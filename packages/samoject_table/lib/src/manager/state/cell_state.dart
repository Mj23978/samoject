import 'package:flutter/material.dart';

import '../../samoject_table_grid.dart';
import '../../model/samoject_table_column_type.dart';
import '../../helper/samoject_table_date_time_helper.dart';
import '../../helper/samoject_table_move_direction.dart';
import '../../model/samoject_table_cell.dart';
import '../../model/samoject_table_column.dart';
import '../../model/samoject_table_row.dart';
import '../samoject_table_grid_state_manager.dart';

abstract class ICellState {
  /// currently selected cell.
  SamojectTableCell? get currentCell;

  /// The position index value of the currently selected cell.
  SamojectTableGridCellPosition? get currentCellPosition;

  SamojectTableCell? get firstCell;

  void setCurrentCellPosition(
    SamojectTableGridCellPosition cellPosition, {
    bool notify = true,
  });

  void updateCurrentCellPosition({bool notify = true});

  /// Index position of cell in a column
  SamojectTableGridCellPosition? cellPositionByCellKey(Key cellKey);

  int? columnIdxByCellKeyAndRowIdx(Key cellKey, int rowIdx);

  /// set currentCell to null
  void clearCurrentCell({bool notify = true});

  /// Change the selected cell.
  void setCurrentCell(
    SamojectTableCell? cell,
    int? rowIdx, {
    bool notify = true,
  });

  /// Whether it is possible to move in the [direction] from [cellPosition].
  bool canMoveCell(
    SamojectTableGridCellPosition cellPosition,
    SamojectTableMoveDirection direction,
  );

  bool canNotMoveCell(
    SamojectTableGridCellPosition? cellPosition,
    SamojectTableMoveDirection direction,
  );

  /// Whether the cell is in a mutable state
  bool canChangeCellValue({
    required SamojectTableColumn column,
    required SamojectTableRow row,
    dynamic newValue,
    dynamic oldValue,
  });

  bool canNotChangeCellValue({
    required SamojectTableColumn column,
    required SamojectTableRow row,
    dynamic newValue,
    dynamic oldValue,
  });

  /// Filter on cell value change
  dynamic filteredCellValue({
    required SamojectTableColumn column,
    dynamic newValue,
    dynamic oldValue,
  });

  /// Whether the cell is the currently selected cell.
  bool isCurrentCell(SamojectTableCell cell);

  bool isInvalidCellPosition(SamojectTableGridCellPosition? cellPosition);
}

mixin CellState implements ISamojectTableGridState {
  @override
  SamojectTableCell? get currentCell => _currentCell;

  SamojectTableCell? _currentCell;

  @override
  SamojectTableGridCellPosition? get currentCellPosition =>
      _currentCellPosition;

  SamojectTableGridCellPosition? _currentCellPosition;

  @override
  SamojectTableCell? get firstCell {
    if (refRows.isEmpty) {
      return null;
    }

    final columnIndexes = columnIndexesByShowFrozen;

    final columnField = refColumns[columnIndexes.first].field;

    return refRows.first.cells[columnField];
  }

  @override
  void setCurrentCellPosition(
    SamojectTableGridCellPosition? cellPosition, {
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
  SamojectTableGridCellPosition? cellPositionByCellKey(Key? cellKey) {
    if (cellKey == null) {
      return null;
    }

    final length = refRows.length;

    for (int rowIdx = 0; rowIdx < length; rowIdx += 1) {
      final columnIdx = columnIdxByCellKeyAndRowIdx(cellKey, rowIdx);

      if (columnIdx != null) {
        return SamojectTableGridCellPosition(
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
    SamojectTableCell? cell,
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

    _currentCellPosition = SamojectTableGridCellPosition(
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
  bool canMoveCell(SamojectTableGridCellPosition? cellPosition,
      SamojectTableMoveDirection direction) {
    switch (direction) {
      case SamojectTableMoveDirection.left:
        return cellPosition!.columnIdx! > 0;
      case SamojectTableMoveDirection.right:
        return cellPosition!.columnIdx! < refColumns.length - 1;
      case SamojectTableMoveDirection.up:
        return cellPosition!.rowIdx! > 0;
      case SamojectTableMoveDirection.down:
        return cellPosition!.rowIdx! < refRows.length - 1;
    }
  }

  @override
  bool canNotMoveCell(SamojectTableGridCellPosition? cellPosition,
      SamojectTableMoveDirection direction) {
    return !canMoveCell(cellPosition, direction);
  }

  @override
  bool canChangeCellValue({
    required SamojectTableColumn column,
    required SamojectTableRow row,
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
    required SamojectTableColumn column,
    required SamojectTableRow row,
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
    required SamojectTableColumn column,
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

        return SamojectTableDateTimeHelper.isValidRange(
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
  bool isCurrentCell(SamojectTableCell? cell) {
    return _currentCell != null && _currentCell!.key == cell!.key;
  }

  @override
  bool isInvalidCellPosition(SamojectTableGridCellPosition? cellPosition) {
    return cellPosition == null ||
        cellPosition.columnIdx == null ||
        cellPosition.rowIdx == null ||
        cellPosition.columnIdx! < 0 ||
        cellPosition.rowIdx! < 0 ||
        cellPosition.columnIdx! > refColumns.length - 1 ||
        cellPosition.rowIdx! > refRows.length - 1;
  }
}
