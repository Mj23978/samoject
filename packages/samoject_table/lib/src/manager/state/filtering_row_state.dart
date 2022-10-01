import 'package:flutter/material.dart';

import '../../helper/filter_helper.dart';
import '../../helper/filtered_list.dart';
import '../../model/samoject_table_column.dart';
import '../../model/samoject_table_row.dart';
import '../../samoject_table_grid.dart';
import '../samoject_table_grid_state_manager.dart';

abstract class IFilteringRowState {
  List<SamojectTableRow> get filterRows;

  bool get hasFilter;

  void setFilter(FilteredListFilter<SamojectTableRow>? filter,
      {bool notify = true});

  void setFilterWithFilterRows(List<SamojectTableRow> rows,
      {bool notify = true});

  void setFilterRows(List<SamojectTableRow> rows);

  List<SamojectTableRow> filterRowsByField(String columnField);

  /// Check if the column is in a state with filtering applied.
  bool isFilteredColumn(SamojectTableColumn column);

  void removeColumnsInFilterRows(
    List<SamojectTableColumn> columns, {
    bool notify = true,
  });

  void showFilterPopup(
    BuildContext context, {
    SamojectTableColumn? calledColumn,
  });
}

mixin FilteringRowState implements ISamojectTableGridState {
  @override
  List<SamojectTableRow> get filterRows => _filterRows;

  List<SamojectTableRow> _filterRows = [];

  @override
  bool get hasFilter => refRows.hasFilter;

  @override
  void setFilter(FilteredListFilter<SamojectTableRow>? filter,
      {bool notify = true}) {
    for (final row in refRows.originalList) {
      row.setState(SamojectTableRowState.none);
    }

    var savedFilter = filter;

    if (filter == null) {
      setFilterRows([]);
    } else {
      savedFilter = (SamojectTableRow row) {
        return !row.state.isNone || filter(row);
      };
    }

    refRows.setFilter(savedFilter);

    resetCurrentState(notify: false);

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void setFilterWithFilterRows(List<SamojectTableRow> rows,
      {bool notify = true}) {
    setFilterRows(rows);

    var enabledFilterColumnFields =
        refColumns.where((element) => element.enableFilterMenuItem).toList();

    setFilter(
      FilterHelper.convertRowsToFilter(_filterRows, enabledFilterColumnFields),
      notify: isPaginated ? false : notify,
    );

    if (isPaginated) {
      resetPage(notify: notify);
    }
  }

  @override
  void setFilterRows(List<SamojectTableRow> rows) {
    _filterRows = rows
        .where(
          (element) => element.cells[FilterHelper.filterFieldValue]!.value
              .toString()
              .isNotEmpty,
        )
        .toList();
  }

  @override
  List<SamojectTableRow> filterRowsByField(String columnField) {
    return _filterRows
        .where(
          (element) =>
              element.cells[FilterHelper.filterFieldColumn]!.value ==
              columnField,
        )
        .toList();
  }

  @override
  bool isFilteredColumn(SamojectTableColumn column) {
    return hasFilter && FilterHelper.isFilteredColumn(column, _filterRows);
  }

  @override
  void removeColumnsInFilterRows(
    List<SamojectTableColumn> columns, {
    bool notify = true,
  }) {
    if (filterRows.isEmpty) {
      return;
    }

    final Set<String> columnFields = Set.from(columns.map((e) => e.field));

    filterRows.removeWhere(
      (filterRow) {
        return columnFields.contains(
          filterRow.cells[FilterHelper.filterFieldColumn]!.value,
        );
      },
    );

    setFilterWithFilterRows(filterRows, notify: notify);
  }

  @override
  void showFilterPopup(
    BuildContext context, {
    SamojectTableColumn? calledColumn,
  }) {
    var shouldProvideDefaultFilterRow =
        _filterRows.isEmpty && calledColumn != null;

    var rows = shouldProvideDefaultFilterRow
        ? [
            FilterHelper.createFilterRow(
              columnField: calledColumn.enableFilterMenuItem
                  ? calledColumn.field
                  : FilterHelper.filterFieldAllColumns,
              filterType: calledColumn.defaultFilter,
            ),
          ]
        : _filterRows;

    FilterHelper.filterPopup(
      FilterPopupState(
        context: context,
        configuration: configuration.copyWith(
          style: configuration.style.copyWith(
            gridBorderRadius: configuration.style.gridPopupBorderRadius,
            enableRowColorAnimation: false,
            oddRowColor: SamojectTableOptional(null),
            evenRowColor: SamojectTableOptional(null),
          ),
        ),
        handleAddNewFilter: (filterState) {
          filterState!.appendRows([FilterHelper.createFilterRow()]);
        },
        handleApplyFilter: (filterState) {
          setFilterWithFilterRows(filterState!.rows);
        },
        columns: columns,
        filterRows: rows,
        focusFirstFilterValue: shouldProvideDefaultFilterRow,
      ),
    );
  }
}
