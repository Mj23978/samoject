import 'package:flutter/material.dart';

import '../../helper/filter_helper.dart';
import '../../helper/filtered_list.dart';
import '../../model/table_column.dart';
import '../../model/table_row.dart';
import '../../table_grid.dart';
import '../table_grid_state_manager.dart';

abstract class IFilteringRowState {
  List<TableViewRow> get filterRows;

  bool get hasFilter;

  void setFilter(FilteredListFilter<TableViewRow>? filter,
      {bool notify = true});

  void setFilterWithFilterRows(List<TableViewRow> rows, {bool notify = true});

  void setFilterRows(List<TableViewRow> rows);

  List<TableViewRow> filterRowsByField(String columnField);

  /// Check if the column is in a state with filtering applied.
  bool isFilteredColumn(TableViewColumn column);

  void removeColumnsInFilterRows(
    List<TableViewColumn> columns, {
    bool notify = true,
  });

  void showFilterPopup(
    BuildContext context, {
    TableViewColumn? calledColumn,
  });
}

mixin FilteringRowState implements ITableGridState {
  @override
  List<TableViewRow> get filterRows => _filterRows;

  List<TableViewRow> _filterRows = [];

  @override
  bool get hasFilter => refRows.hasFilter;

  @override
  void setFilter(FilteredListFilter<TableViewRow>? filter,
      {bool notify = true}) {
    for (final row in refRows.originalList) {
      row.setState(TableRowState.none);
    }

    var savedFilter = filter;

    if (filter == null) {
      setFilterRows([]);
    } else {
      savedFilter = (TableViewRow row) {
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
  void setFilterWithFilterRows(List<TableViewRow> rows, {bool notify = true}) {
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
  void setFilterRows(List<TableViewRow> rows) {
    _filterRows = rows
        .where(
          (element) => element.cells[FilterHelper.filterFieldValue]!.value
              .toString()
              .isNotEmpty,
        )
        .toList();
  }

  @override
  List<TableViewRow> filterRowsByField(String columnField) {
    return _filterRows
        .where(
          (element) =>
              element.cells[FilterHelper.filterFieldColumn]!.value ==
              columnField,
        )
        .toList();
  }

  @override
  bool isFilteredColumn(TableViewColumn column) {
    return hasFilter && FilterHelper.isFilteredColumn(column, _filterRows);
  }

  @override
  void removeColumnsInFilterRows(
    List<TableViewColumn> columns, {
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
    TableViewColumn? calledColumn,
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
            oddRowColor: TableOptional(null),
            evenRowColor: TableOptional(null),
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
