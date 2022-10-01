import 'package:flutter/material.dart';

import '../../helper/filter_helper.dart';
import '../../helper/filtered_list.dart';
import '../../model/samoject_list_column.dart';
import '../../model/samoject_list_row.dart';
import '../../samoject_list_grid.dart';
import '../samoject_list_grid_state_manager.dart';

abstract class IFilteringRowState {
  List<SamojectListRow> get filterRows;

  bool get hasFilter;

  void setFilter(FilteredListFilter<SamojectListRow>? filter,
      {bool notify = true});

  void setFilterWithFilterRows(List<SamojectListRow> rows,
      {bool notify = true});

  void setFilterRows(List<SamojectListRow> rows);

  List<SamojectListRow> filterRowsByField(String columnField);

  /// Check if the column is in a state with filtering applied.
  bool isFilteredColumn(SamojectListColumn column);

  void removeColumnsInFilterRows(
    List<SamojectListColumn> columns, {
    bool notify = true,
  });

  void showFilterPopup(
    BuildContext context, {
    SamojectListColumn? calledColumn,
  });
}

mixin FilteringRowState implements ISamojectListGridState {
  @override
  List<SamojectListRow> get filterRows => _filterRows;

  List<SamojectListRow> _filterRows = [];

  @override
  bool get hasFilter => refRows.hasFilter;

  @override
  void setFilter(FilteredListFilter<SamojectListRow>? filter,
      {bool notify = true}) {
    for (final row in refRows.originalList) {
      row.setState(SamojectListRowState.none);
    }

    var savedFilter = filter;

    if (filter == null) {
      setFilterRows([]);
    } else {
      savedFilter = (SamojectListRow row) {
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
  void setFilterWithFilterRows(List<SamojectListRow> rows,
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
  void setFilterRows(List<SamojectListRow> rows) {
    _filterRows = rows
        .where(
          (element) => element.cells[FilterHelper.filterFieldValue]!.value
              .toString()
              .isNotEmpty,
        )
        .toList();
  }

  @override
  List<SamojectListRow> filterRowsByField(String columnField) {
    return _filterRows
        .where(
          (element) =>
              element.cells[FilterHelper.filterFieldColumn]!.value ==
              columnField,
        )
        .toList();
  }

  @override
  bool isFilteredColumn(SamojectListColumn column) {
    return hasFilter && FilterHelper.isFilteredColumn(column, _filterRows);
  }

  @override
  void removeColumnsInFilterRows(
    List<SamojectListColumn> columns, {
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
    SamojectListColumn? calledColumn,
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
            oddRowColor: SamojectListOptional(null),
            evenRowColor: SamojectListOptional(null),
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
