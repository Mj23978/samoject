import 'package:flutter/material.dart';

import '../../samoject_list_grid.dart';
import '../../model/samoject_list_column_type.dart';
import '../../helper/samoject_list_date_time_helper.dart';
import '../../helper/samoject_list_move_direction.dart';
import '../../model/samoject_list_cell.dart';
import '../../model/samoject_list_column.dart';
import '../../model/samoject_list_row.dart';
import '../samoject_list_grid_state_manager.dart';

abstract class ICellState {
  /// currently selected cell.
  SamojectListCell? get currentCell;

  /// The position index value of the currently selected cell.
  SamojectListGridCellPosition? get currentCellPosition;

  SamojectListCell? get firstCell;

  void setCurrentCellPosition(
    SamojectListGridCellPosition cellPosition, {
    bool notify = true,
  });

  void updateCurrentCellPosition({bool notify = true});

  /// Index position of cell in a column
  SamojectListGridCellPosition? cellPositionByCellKey(Key cellKey);

  int? columnIdxByCellKeyAndRowIdx(Key cellKey, int rowIdx);

  /// set currentCell to null
  void clearCurrentCell({bool notify = true});

  /// Change the selected cell.
  void setCurrentCell(
    SamojectListCell? cell,
    int? rowIdx, {
    bool notify = true,
  });

  /// Whether it is possible to move in the [direction] from [cellPosition].
  bool canMoveCell(
    SamojectListGridCellPosition cellPosition,
    SamojectListMoveDirection direction,
  );

  bool canNotMoveCell(
    SamojectListGridCellPosition? cellPosition,
    SamojectListMoveDirection direction,
  );

  /// Whether the cell is in a mutable state
  bool canChangeCellValue({
    required SamojectListColumn column,
    required SamojectListRow row,
    dynamic newValue,
    dynamic oldValue,
  });

  bool canNotChangeCellValue({
    required SamojectListColumn column,
    required SamojectListRow row,
    dynamic newValue,
    dynamic oldValue,
  });

  /// Filter on cell value change
  dynamic filteredCellValue({
    required SamojectListColumn column,
    dynamic newValue,
    dynamic oldValue,
  });

  /// Whether the cell is the currently selected cell.
  bool isCurrentCell(SamojectListCell cell);

  bool isInvalidCellPosition(SamojectListGridCellPosition? cellPosition);
}

mixin CellState implements ISamojectListGridState {
  @override
  SamojectListCell? get currentCell => _currentCell;

  SamojectListCell? _currentCell;

  @override
  SamojectListGridCellPosition? get currentCellPosition => _currentCellPosition;

  SamojectListGridCellPosition? _currentCellPosition;

  @override
  SamojectListCell? get firstCell {
    if (refRows.isEmpty) {
      return null;
    }

    final columnIndexes = columnIndexesByShowFrozen;

    final columnField = refColumns[columnIndexes.first].field;

    return refRows.first.cells[columnField];
  }

  @override
  void setCurrentCellPosition(
    SamojectListGridCellPosition? cellPosition, {
    bool notify = true,
  }) {
    if (_currentCellPosition == cellPosition) {
      return;
    }

    if (cellPosition == null) {
      clearCurrentCell(notify: false);
    } else if (isInvalidCellPosition(cellPosition)) {
      return;
    }

    _currentCellPosition = cellPosition;

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void updateCurrentCellPosition({bool notify = true}) {
    if (_currentCell == null) {
      return;
    }

    setCurrentCellPosition(
      cellPositionByCellKey(_currentCell!.key),
      notify: false,
    );

    if (notify) {
      notifyListeners();
    }
  }

  @override
  SamojectListGridCellPosition? cellPositionByCellKey(Key? cellKey) {
    if (cellKey == null) {
      return null;
    }

    final length = refRows.length;

    for (int rowIdx = 0; rowIdx < length; rowIdx += 1) {
      final columnIdx = columnIdxByCellKeyAndRowIdx(cellKey, rowIdx);

      if (columnIdx != null) {
        return SamojectListGridCellPosition(
            columnIdx: columnIdx, rowIdx: rowIdx);
      }
    }

    return null;
  }

  @override
  int? columnIdxByCellKeyAndRowIdx(Key cellKey, int rowIdx) {
    if (rowIdx < 0 || rowIdx >= refRows.length) {
      return null;
    }

    final columnIndexes = columnIndexesByShowFrozen;
    final length = columnIndexes.length;

    for (int columnIdx = 0; columnIdx < length; columnIdx += 1) {
      final field = refColumns[columnIndexes[columnIdx]].field;

      if (refRows[rowIdx].cells[field]!.key == cellKey) {
        return columnIdx;
      }
    }

    return null;
  }

  @override
  void clearCurrentCell({bool notify = true}) {
    if (_currentCell == null) {
      return;
    }

    _currentCell = null;

    _currentCellPosition = null;

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void setCurrentCell(
    SamojectListCell? cell,
    int? rowIdx, {
    bool notify = true,
  }) {
    if (cell == null ||
        rowIdx == null ||
        refRows.isEmpty ||
        rowIdx < 0 ||
        rowIdx > refRows.length - 1) {
      return;
    }

    if (_currentCell != null && _currentCell!.key == cell.key) {
      return;
    }

    _currentCell = cell;

    _currentCellPosition = SamojectListGridCellPosition(
      rowIdx: rowIdx,
      columnIdx: columnIdxByCellKeyAndRowIdx(cell.key, rowIdx),
    );

    clearCurrentSelecting(notify: false);

    setEditing(autoEditing, notify: false);

    if (notify) {
      notifyListeners();
    }
  }

  @override
  bool canMoveCell(SamojectListGridCellPosition? cellPosition,
      SamojectListMoveDirection direction) {
    switch (direction) {
      case SamojectListMoveDirection.left:
        return cellPosition!.columnIdx! > 0;
      case SamojectListMoveDirection.right:
        return cellPosition!.columnIdx! < refColumns.length - 1;
      case SamojectListMoveDirection.up:
        return cellPosition!.rowIdx! > 0;
      case SamojectListMoveDirection.down:
        return cellPosition!.rowIdx! < refRows.length - 1;
    }
  }

  @override
  bool canNotMoveCell(SamojectListGridCellPosition? cellPosition,
      SamojectListMoveDirection direction) {
    return !canMoveCell(cellPosition, direction);
  }

  @override
  bool canChangeCellValue({
    required SamojectListColumn column,
    required SamojectListRow row,
    dynamic newValue,
    dynamic oldValue,
  }) {
    if (column.checkReadOnly(row, row.cells[column.field]!) ||
        column.enableEditingMode != true) {
      return false;
    }

    if (mode.isSelect) {
      return false;
    }

    if (newValue.toString() == oldValue.toString()) {
      return false;
    }

    return true;
  }

  @override
  bool canNotChangeCellValue({
    required SamojectListColumn column,
    required SamojectListRow row,
    dynamic newValue,
    dynamic oldValue,
  }) {
    return !canChangeCellValue(
      column: column,
      row: row,
      newValue: newValue,
      oldValue: oldValue,
    );
  }

  @override
  dynamic filteredCellValue({
    required SamojectListColumn column,
    dynamic newValue,
    dynamic oldValue,
  }) {
    if (column.type.isSelect) {
      return column.type.select.items.contains(newValue) == true
          ? newValue
          : oldValue;
    }

    if (column.type.isDate) {
      try {
        final parseNewValue =
            column.type.date.dateFormat.parseStrict(newValue.toString());

        return SamojectListDateTimeHelper.isValidRange(
          date: parseNewValue,
          start: column.type.date.startDate,
          end: column.type.date.endDate,
        )
            ? column.type.date.dateFormat.format(parseNewValue)
            : oldValue;
      } catch (e) {
        return oldValue;
      }
    }

    if (column.type.isTime) {
      final time = RegExp(r'^([0-1]?\d|2[0-3]):[0-5]\d$');

      return time.hasMatch(newValue.toString()) ? newValue : oldValue;
    }

    return newValue;
  }

  @override
  bool isCurrentCell(SamojectListCell? cell) {
    return _currentCell != null && _currentCell!.key == cell!.key;
  }

  @override
  bool isInvalidCellPosition(SamojectListGridCellPosition? cellPosition) {
    return cellPosition == null ||
        cellPosition.columnIdx == null ||
        cellPosition.rowIdx == null ||
        cellPosition.columnIdx! < 0 ||
        cellPosition.rowIdx! < 0 ||
        cellPosition.columnIdx! > refColumns.length - 1 ||
        cellPosition.rowIdx! > refRows.length - 1;
  }
}
