import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../helper/filtered_list.dart';
import '../../helper/table_move_direction.dart';
import '../../model/table_cell.dart';
import '../../model/table_row.dart';
import '../../table_grid.dart';
import '../table_grid_state_manager.dart';

abstract class IRowState {
  List<TableViewRow> get rows;

  FilteredList<TableViewRow> refRows = FilteredList();

  List<TableViewRow> get checkedRows;

  List<TableViewRow> get unCheckedRows;

  bool get hasCheckedRow;

  bool get hasUnCheckedRow;

  /// Property for [tristate] value in [Checkbox] widget.
  bool? get tristateCheckedRow;

  /// Row index of currently selected cell.
  int? get currentRowIdx;

  /// Row of currently selected cell.
  TableViewRow? get currentRow;

  TableRowColorCallback? get rowColorCallback;

  int? getRowIdxByOffset(double offset);

  TableViewRow? getRowByIdx(int rowIdx);

  TableViewRow getNewRow();

  List<TableViewRow> getNewRows({
    int count = 1,
  });

  List<TableViewRow> setSortIdxOfRows(
    List<TableViewRow> rows, {
    bool increase = true,
    int start = 0,
  });

  void setRowChecked(
    TableViewRow row,
    bool flag, {
    bool notify = true,
  });

  void insertRows(
    int rowIdx,
    List<TableViewRow> rows, {
    bool notify = true,
  });

  void prependNewRows({
    int count = 1,
  });

  void prependRows(List<TableViewRow> rows);

  void appendNewRows({
    int count = 1,
  });

  void appendRows(List<TableViewRow> rows);

  void removeCurrentRow();

  void removeRows(List<TableViewRow> rows);

  void removeAllRows({bool notify = true});

  void moveRowsByOffset(
    List<TableViewRow> rows,
    double offset, {
    bool notify = true,
  });

  void moveRowsByIndex(
    List<TableViewRow> rows,
    int index, {
    bool notify = true,
  });

  void toggleAllRowChecked(
    bool flag, {
    bool notify = true,
  });

  /// Dynamically change the background color of row by implementing a callback function.
  void setRowColorCallback(TableRowColorCallback rowColorCallback);
}

mixin RowState implements ITableGridState {
  @override
  List<TableViewRow> get rows => [...refRows];

  @override
  FilteredList<TableViewRow> get refRows => _refRows;

  @override
  set refRows(FilteredList<TableViewRow> setRows) {
    TableGridStateManager.initializeRows(refColumns.originalList, setRows);
    _refRows = setRows;
  }

  FilteredList<TableViewRow> _refRows = FilteredList();

  @override
  List<TableViewRow> get checkedRows =>
      refRows.where((row) => row.checked!).toList(
            growable: false,
          );

  @override
  List<TableViewRow> get unCheckedRows =>
      refRows.where((row) => !row.checked!).toList(
            growable: false,
          );

  @override
  bool get hasCheckedRow =>
      refRows.firstWhereOrNull((element) => element.checked!) != null;

  @override
  bool get hasUnCheckedRow =>
      refRows.firstWhereOrNull((element) => !element.checked!) != null;

  @override
  bool? get tristateCheckedRow {
    final length = refRows.length;

    if (length == 0) {
      return false;
    }

    final Set<bool> checkSet = {};

    for (var i = 0; i < length; i += 1) {
      checkSet.add(refRows[i].checked == true);
    }

    return checkSet.length == 2 ? null : checkSet.first;
  }

  @override
  int? get currentRowIdx => currentCellPosition?.rowIdx;

  @override
  TableViewRow? get currentRow {
    if (currentRowIdx == null) {
      return null;
    }

    return refRows[currentRowIdx!];
  }

  TableRowColorCallback? _rowColorCallback;

  @override
  TableRowColorCallback? get rowColorCallback {
    return _rowColorCallback;
  }

  @override
  int? getRowIdxByOffset(double offset) {
    offset -= bodyTopOffset - scroll!.verticalOffset;

    double currentOffset = 0.0;

    int? indexToMove;

    final int rowsLength = refRows.length;

    for (var i = 0; i < rowsLength; i += 1) {
      if (currentOffset <= offset && offset < currentOffset + rowTotalHeight) {
        indexToMove = i;
        break;
      }

      currentOffset += rowTotalHeight;
    }

    return indexToMove;
  }

  @override
  TableViewRow? getRowByIdx(int? rowIdx) {
    if (rowIdx == null || rowIdx < 0 || refRows.length - 1 < rowIdx) {
      return null;
    }

    return refRows[rowIdx];
  }

  @override
  TableViewRow getNewRow() {
    final cells = <String, TableViewCell>{};

    for (var column in refColumns) {
      cells[column.field] = TableViewCell(
        value: column.type.defaultValue,
      );
    }

    return TableViewRow(cells: cells);
  }

  @override
  List<TableViewRow> getNewRows({
    int count = 1,
  }) {
    List<TableViewRow> rows = [];

    for (var i = 0; i < count; i += 1) {
      rows.add(getNewRow());
    }

    if (rows.isEmpty) {
      return [];
    }

    return rows;
  }

  @override
  List<TableViewRow> setSortIdxOfRows(
    List<TableViewRow> rows, {
    bool increase = true,
    int start = 0,
  }) {
    int sortIdx = start;

    for (final row in rows) {
      row.sortIdx = sortIdx;

      sortIdx = increase ? ++sortIdx : --sortIdx;
    }

    return rows;
  }

  @override
  void setRowChecked(
    TableViewRow row,
    bool flag, {
    bool notify = true,
  }) {
    final findRow = refRows.firstWhereOrNull(
      (element) => element.key == row.key,
    );

    if (findRow == null) {
      return;
    }

    findRow.setChecked(flag);

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void insertRows(
    int rowIdx,
    List<TableViewRow> rows, {
    bool notify = true,
  }) {
    if (rows.isEmpty) {
      return;
    }

    if (rowIdx < 0 || refRows.length < rowIdx) {
      return;
    }

    if (hasSortedColumn) {
      final originalRowIdx = page > 1 ? rowIdx + (page - 1) * pageSize : rowIdx;

      final int? sortIdx = refRows.originalList[originalRowIdx].sortIdx;

      TableGridStateManager.initializeRows(
        refColumns,
        rows,
        start: sortIdx ?? 0,
      );

      for (int i = 0; i < refRows.originalLength; i += 1) {
        if (sortIdx! <= refRows.originalList[i].sortIdx!) {
          refRows.originalList[i].sortIdx =
              refRows.originalList[i].sortIdx! + rows.length;
        }
      }

      _insertRows(rowIdx, rows, state: TableRowState.added);
    } else {
      _insertRows(rowIdx, rows, state: TableRowState.added);

      TableGridStateManager.initializeRows(
        refColumns,
        refRows.originalList,
        forceApplySortIdx: true,
      );
    }

    /// Update currentRowIdx
    if (currentCell != null) {
      updateCurrentCellPosition(notify: false);

      // todo : whether to apply scrolling.
    }

    /// Update currentSelectingPosition
    if (currentSelectingPosition != null &&
        rowIdx <= currentSelectingPosition!.rowIdx!) {
      setCurrentSelectingPosition(
        cellPosition: TableGridCellPosition(
          columnIdx: currentSelectingPosition!.columnIdx,
          rowIdx: rows.length + currentSelectingPosition!.rowIdx!,
        ),
        notify: false,
      );
    }

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void prependNewRows({
    int count = 1,
  }) {
    prependRows(getNewRows(count: count));
  }

  @override
  void prependRows(List<TableViewRow> rows) {
    if (rows.isEmpty) {
      return;
    }

    final minSortIdx = (refRows.isNotEmpty
        ? refRows.first.sortIdx == null
            ? 0
            : refRows.first.sortIdx!
        : 0);

    final start = minSortIdx - rows.length;

    for (final element in refRows.originalList) {
      if (element.sortIdx != null && element.sortIdx! < minSortIdx) {
        element.sortIdx = element.sortIdx! - rows.length;
      }
    }

    TableGridStateManager.initializeRows(
      refColumns,
      rows,
      start: start,
    );

    _insertRows(0, rows, state: TableRowState.added);

    /// Update currentRowIdx
    if (currentCell != null) {
      setCurrentCellPosition(
        TableGridCellPosition(
          columnIdx: currentCellPosition!.columnIdx,
          rowIdx: rows.length + currentRowIdx!,
        ),
        notify: false,
      );

      double offsetToMove = rows.length * rowTotalHeight;

      scrollByDirection(TableMoveDirection.up, offsetToMove);
    }

    /// Update currentSelectingPosition
    if (currentSelectingPosition != null) {
      setCurrentSelectingPosition(
        cellPosition: TableGridCellPosition(
          columnIdx: currentSelectingPosition!.columnIdx,
          rowIdx: rows.length + currentSelectingPosition!.rowIdx!,
        ),
        notify: false,
      );
    }

    notifyListeners();
  }

  @override
  void appendNewRows({
    int count = 1,
  }) {
    appendRows(getNewRows(count: count));
  }

  @override
  void appendRows(List<TableViewRow> rows) {
    if (rows.isEmpty) {
      return;
    }

    final start = refRows.isNotEmpty
        ? refRows.last.sortIdx == null
            ? 1
            : refRows.last.sortIdx! + 1
        : 0;

    for (final element in refRows.originalList) {
      if (element.sortIdx != null && element.sortIdx! > start - 1) {
        element.sortIdx = element.sortIdx! + rows.length;
      }
    }

    TableGridStateManager.initializeRows(
      refColumns,
      rows,
      start: start,
    );

    _insertRows(refRows.length, rows, state: TableRowState.added);

    notifyListeners();
  }

  @override
  void removeCurrentRow() {
    if (currentRowIdx == null) {
      return;
    }

    refRows.removeAt(currentRowIdx!);

    resetCurrentState(notify: false);

    notifyListeners();
  }

  @override
  void removeRows(
    List<TableViewRow> rows, {
    bool notify = true,
  }) {
    if (rows.isEmpty) {
      return;
    }

    final Set<Key> removeKeys = Set.from(rows.map((e) => e.key));

    if (currentRowIdx != null &&
        refRows.length > currentRowIdx! &&
        removeKeys.contains(refRows[currentRowIdx!].key)) {
      resetCurrentState(notify: false);
    }

    Key? selectingCellKey;

    if (hasCurrentSelectingPosition) {
      selectingCellKey = refRows
          .originalList[currentSelectingPosition!.rowIdx!].cells.entries
          .elementAt(currentSelectingPosition!.columnIdx!)
          .value
          .key;
    }

    refRows.removeWhereFromOriginal((row) => removeKeys.contains(row.key));

    updateCurrentCellPosition(notify: false);

    setCurrentSelectingPositionByCellKey(selectingCellKey, notify: false);

    currentSelectingRows.removeWhere((row) => removeKeys.contains(row.key));

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void removeAllRows({bool notify = true}) {
    if (refRows.originalList.isEmpty) {
      return;
    }

    refRows.clearFromOriginal();

    resetCurrentState(notify: false);

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void moveRowsByOffset(
    List<TableViewRow> rows,
    double offset, {
    bool notify = true,
  }) {
    int? indexToMove = getRowIdxByOffset(offset);

    moveRowsByIndex(rows, indexToMove, notify: notify);
  }

  @override
  void moveRowsByIndex(
    List<TableViewRow> rows,
    int? indexToMove, {
    bool notify = true,
  }) {
    if (indexToMove == null) {
      return;
    }

    if (indexToMove + rows.length > refRows.length) {
      indexToMove = refRows.length - rows.length;
    }

    for (final row in rows) {
      refRows.removeFromOriginal(row);
    }

    final originalRowIdx =
        page > 1 ? indexToMove + (page - 1) * pageSize : indexToMove;

    if (originalRowIdx >= refRows.originalLength) {
      refRows.addAll(rows.cast<TableViewRow>());
    } else {
      refRows.insertAll(indexToMove, rows.cast<TableViewRow>());
    }

    int sortIdx = 0;

    for (var element in refRows.originalList) {
      element.sortIdx = sortIdx++;
    }

    updateCurrentCellPosition(notify: false);

    if (onRowsMoved != null) {
      onRowsMoved!(TableGridOnRowsMovedEvent(
        idx: indexToMove,
        rows: rows,
      ));
    }

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void toggleAllRowChecked(
    bool? flag, {
    bool notify = true,
  }) {
    for (final row in refRows) {
      row.setChecked(flag == true);
    }

    if (notify) {
      notifyListeners();
    }
  }

  void _insertRows(
    int index,
    List<TableViewRow> rows, {
    TableRowState? state,
  }) {
    if (rows.isEmpty) {
      return;
    }

    if (state != null) {
      for (final row in rows) {
        row.setState(state);
      }
    }

    final originalRowIdx = page > 1 ? index + (page - 1) * pageSize : index;

    if (originalRowIdx >= refRows.originalLength) {
      refRows.addAll(rows.cast<TableViewRow>());
    } else {
      refRows.insertAll(index, rows.cast<TableViewRow>());
    }

    if (isPaginated) {
      setPage(page, notify: false);
    }
  }

  @override
  void setRowColorCallback(TableRowColorCallback? rowColorCallback) {
    _rowColorCallback = rowColorCallback;
  }
}
