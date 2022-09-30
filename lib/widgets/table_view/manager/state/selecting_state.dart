import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../helper/table_move_direction.dart';
import '../../model/table_cell.dart';
import '../../model/table_column.dart';
import '../../model/table_row.dart';
import '../../table_grid.dart';
import '../table_grid_state_manager.dart';

abstract class ISelectingState {
  /// Multi-selection state.
  bool get isSelecting;

  /// [selectingMode]
  TableGridSelectingMode get selectingMode;

  /// Current position of multi-select cell.
  /// Calculate the currently selected cell and its multi-selection range.
  TableGridCellPosition? get currentSelectingPosition;

  /// Position list of currently selected.
  /// Only valid in [TableGridSelectingMode.cell].
  ///
  /// ```dart
  /// stateManager.currentSelectingPositionList.forEach((element) {
  ///   final cellValue = stateManager.rows[element.rowIdx].cells[element.field].value;
  /// });
  /// ```
  List<TableGridSelectingCellPosition> get currentSelectingPositionList;

  bool get hasCurrentSelectingPosition;

  /// Rows of currently selected.
  /// Only valid in [TableGridSelectingMode.row].
  List<TableViewRow> get currentSelectingRows;

  /// String of multi-selected cells.
  /// Preserves the structure of the cells selected by the tabs and the enter key.
  String get currentSelectingText;

  /// Change Multi-Select Status.
  void setSelecting(bool flag, {bool notify = true});

  void setSelectingMode(TableGridSelectingMode mode, {bool notify = true});

  void setAllCurrentSelecting();

  /// Sets the position of a multi-selected cell.
  void setCurrentSelectingPosition({
    TableGridCellPosition? cellPosition,
    bool notify = true,
  });

  void setCurrentSelectingPositionByCellKey(
    Key? cellKey, {
    bool notify = true,
  });

  /// Sets the position of a multi-selected cell.
  void setCurrentSelectingPositionWithOffset(Offset offset);

  /// Sets the currentSelectingRows by range.
  /// [from] rowIdx of rows.
  /// [to] rowIdx of rows.
  void setCurrentSelectingRowsByRange(int from, int to, {bool notify = true});

  /// Resets currently selected rows and cells.
  void clearCurrentSelecting({bool notify = true});

  /// Select or unselect a row.
  void toggleSelectingRow(int rowIdx, {bool notify = true});

  bool isSelectingInteraction();

  bool isSelectedRow(Key rowKey);

  /// Whether the cell is the currently multi selected cell.
  bool isSelectedCell(TableViewCell cell, TableViewColumn column, int rowIdx);

  /// The action that is selected in the Select dialog
  /// and processed after the dialog is closed.
  void handleAfterSelectingRow(TableViewCell cell, dynamic value);
}

mixin SelectingState implements ITableGridState {
  @override
  bool get isSelecting => _isSelecting;

  bool _isSelecting = false;

  @override
  TableGridSelectingMode get selectingMode => _selectingMode;

  TableGridSelectingMode _selectingMode = TableGridSelectingMode.cell;

  @override
  TableGridCellPosition? get currentSelectingPosition =>
      _currentSelectingPosition;

  TableGridCellPosition? _currentSelectingPosition;

  @override
  List<TableGridSelectingCellPosition> get currentSelectingPositionList {
    if (currentCellPosition == null || currentSelectingPosition == null) {
      return [];
    }

    switch (_selectingMode) {
      case TableGridSelectingMode.cell:
        return _selectingCells();
      case TableGridSelectingMode.horizontal:
        return _selectingCellsHorizontally();
      case TableGridSelectingMode.row:
      case TableGridSelectingMode.none:
        return [];
    }
  }

  @override
  bool get hasCurrentSelectingPosition => _currentSelectingPosition != null;

  @override
  List<TableViewRow> get currentSelectingRows => _currentSelectingRows;

  List<TableViewRow> _currentSelectingRows = [];

  @override
  String get currentSelectingText {
    final bool fromSelectingRows =
        _selectingMode.isRow && _currentSelectingRows.isNotEmpty;

    final bool fromSelectingPosition =
        currentCellPosition != null && currentSelectingPosition != null;

    final bool fromCurrentCell = currentCellPosition != null;

    if (fromSelectingRows) {
      return _selectingTextFromSelectingRows();
    } else if (fromSelectingPosition) {
      return _selectingTextFromSelectingPosition();
    } else if (fromCurrentCell) {
      return _selectingTextFromCurrentCell();
    }

    return '';
  }

  @override
  void setSelecting(bool flag, {bool notify = true}) {
    if (_selectingMode.isNone) {
      return;
    }

    if (currentCell == null || _isSelecting == flag) {
      return;
    }

    _isSelecting = flag;

    if (isEditing == true) {
      setEditing(false, notify: false);
    }

    // Invalidates the previously selected row.
    if (_isSelecting) {
      clearCurrentSelecting(notify: false);
    }

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void setSelectingMode(TableGridSelectingMode mode, {bool notify = true}) {
    if (_selectingMode == mode) {
      return;
    }

    _currentSelectingRows = [];

    _currentSelectingPosition = null;

    _selectingMode = mode;

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void setAllCurrentSelecting() {
    if (refRows.isEmpty) {
      return;
    }

    switch (_selectingMode) {
      case TableGridSelectingMode.cell:
      case TableGridSelectingMode.horizontal:
        _setFistCellAsCurrent();

        setCurrentSelectingPosition(
          cellPosition: TableGridCellPosition(
            columnIdx: refColumns.length - 1,
            rowIdx: refRows.length - 1,
          ),
        );
        break;
      case TableGridSelectingMode.row:
        if (currentCell == null) {
          _setFistCellAsCurrent();
        }

        _currentSelectingPosition = TableGridCellPosition(
          columnIdx: refColumns.length - 1,
          rowIdx: refRows.length - 1,
        );

        setCurrentSelectingRowsByRange(0, refRows.length - 1);
        break;
      case TableGridSelectingMode.none:
      default:
        break;
    }
  }

  @override
  void setCurrentSelectingPosition({
    TableGridCellPosition? cellPosition,
    bool notify = true,
  }) {
    if (_selectingMode.isNone) {
      return;
    }

    if (_currentSelectingPosition == cellPosition) {
      return;
    }

    _currentSelectingPosition =
        isInvalidCellPosition(cellPosition) ? null : cellPosition;

    if (_currentSelectingPosition != null && _selectingMode.isRow) {
      setCurrentSelectingRowsByRange(
        currentRowIdx,
        _currentSelectingPosition!.rowIdx,
        notify: false,
      );
    }

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void setCurrentSelectingPositionByCellKey(
    Key? cellKey, {
    bool notify = true,
  }) {
    if (cellKey == null) {
      return;
    }

    setCurrentSelectingPosition(
      cellPosition: cellPositionByCellKey(cellKey),
      notify: notify,
    );
  }

  @override
  void setCurrentSelectingPositionWithOffset(Offset? offset) {
    if (currentCell == null) {
      return;
    }

    final double gridBodyOffsetDy = gridGlobalOffset!.dy +
        TableGridSettings.gridBorderWidth +
        headerHeight +
        columnGroupHeight +
        columnHeight +
        columnFilterHeight;

    double currentCellOffsetDy = (currentRowIdx! * rowTotalHeight) +
        gridBodyOffsetDy -
        scroll!.vertical!.offset;

    if (gridBodyOffsetDy > offset!.dy) {
      return;
    }

    int rowIdx = (((currentCellOffsetDy - offset.dy) / rowTotalHeight).ceil() -
            currentRowIdx!)
        .abs();

    int? columnIdx;

    final directionalOffset = toDirectionalOffset(offset);
    double currentWidth = isLTR ? gridGlobalOffset!.dx : 0.0;

    final columnIndexes = columnIndexesByShowFrozen;

    final savedRightBlankOffset = rightBlankOffset;
    final savedHorizontalScrollOffset = scroll!.horizontal!.offset;

    for (int i = 0; i < columnIndexes.length; i += 1) {
      final column = refColumns[columnIndexes[i]];

      currentWidth += column.width;

      final rightFrozenColumnOffset =
          column.frozen.isEnd && showFrozenColumn ? savedRightBlankOffset : 0;

      if (currentWidth + rightFrozenColumnOffset >
          directionalOffset.dx + savedHorizontalScrollOffset) {
        columnIdx = i;
        break;
      }
    }

    if (columnIdx == null) {
      return;
    }

    setCurrentSelectingPosition(
      cellPosition: TableGridCellPosition(
        columnIdx: columnIdx,
        rowIdx: rowIdx,
      ),
    );
  }

  @override
  void setCurrentSelectingRowsByRange(int? from, int? to,
      {bool notify = true}) {
    if (!_selectingMode.isRow) {
      return;
    }

    final maxFrom = min(from!, to!);

    final maxTo = max(from, to) + 1;

    if (maxFrom < 0 || maxTo > refRows.length) {
      return;
    }

    _currentSelectingRows = refRows.getRange(maxFrom, maxTo).toList();

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void clearCurrentSelecting({bool notify = true}) {
    _clearCurrentSelectingPosition(notify: notify);

    _clearCurrentSelectingRows(notify: notify);
  }

  @override
  void toggleSelectingRow(int? rowIdx, {notify = true}) {
    if (!_selectingMode.isRow) {
      return;
    }

    if (rowIdx == null || rowIdx < 0 || rowIdx > refRows.length - 1) {
      return;
    }

    final TableViewRow row = refRows[rowIdx];

    final keys = Set.from(_currentSelectingRows.map((e) => e.key));

    if (keys.contains(row.key)) {
      _currentSelectingRows.removeWhere((element) => element.key == row.key);
    } else {
      _currentSelectingRows.add(row);
    }

    if (notify) {
      notifyListeners();
    }
  }

  @override
  bool isSelectingInteraction() {
    return !_selectingMode.isNone &&
        (keyPressed.shift || keyPressed.ctrl) &&
        currentCell != null;
  }

  @override
  bool isSelectedRow(Key? rowKey) {
    if (rowKey == null ||
        !_selectingMode.isRow ||
        _currentSelectingRows.isEmpty) {
      return false;
    }

    return _currentSelectingRows.firstWhereOrNull(
          (element) => element.key == rowKey,
        ) !=
        null;
  }

  // todo : code cleanup
  @override
  bool isSelectedCell(TableViewCell cell, TableViewColumn column, int rowIdx) {
    if (_selectingMode.isNone) {
      return false;
    }

    if (currentCellPosition == null) {
      return false;
    }

    if (_currentSelectingPosition == null) {
      return false;
    }

    if (_selectingMode.isCell) {
      final bool inRangeOfRows = min(currentCellPosition!.rowIdx as num,
                  _currentSelectingPosition!.rowIdx as num) <=
              rowIdx &&
          rowIdx <=
              max(currentCellPosition!.rowIdx!,
                  _currentSelectingPosition!.rowIdx!);

      if (inRangeOfRows == false) {
        return false;
      }

      final int? columnIdx = columnIndex(column);

      if (columnIdx == null) {
        return false;
      }

      final bool inRangeOfColumns = min(currentCellPosition!.columnIdx as num,
                  currentSelectingPosition!.columnIdx as num) <=
              columnIdx &&
          columnIdx <=
              max(currentCellPosition!.columnIdx!,
                  currentSelectingPosition!.columnIdx!);

      if (inRangeOfColumns == false) {
        return false;
      }

      return true;
    } else if (_selectingMode.isHorizontal) {
      int startRowIdx =
          min(currentCellPosition!.rowIdx!, _currentSelectingPosition!.rowIdx!);

      int endRowIdx =
          max(currentCellPosition!.rowIdx!, _currentSelectingPosition!.rowIdx!);

      final int? columnIdx = columnIndex(column);

      if (columnIdx == null) {
        return false;
      }

      int? startColumnIdx;

      int? endColumnIdx;

      if (currentCellPosition!.rowIdx! < _currentSelectingPosition!.rowIdx!) {
        startColumnIdx = currentCellPosition!.columnIdx;
        endColumnIdx = _currentSelectingPosition!.columnIdx;
      } else if (currentCellPosition!.rowIdx! >
          _currentSelectingPosition!.rowIdx!) {
        startColumnIdx = _currentSelectingPosition!.columnIdx;
        endColumnIdx = currentCellPosition!.columnIdx;
      } else {
        startColumnIdx = min(currentCellPosition!.columnIdx!,
            _currentSelectingPosition!.columnIdx!);
        endColumnIdx = max(currentCellPosition!.columnIdx!,
            _currentSelectingPosition!.columnIdx!);
      }

      if (rowIdx == startRowIdx && startRowIdx == endRowIdx) {
        return !(columnIdx < startColumnIdx! || columnIdx > endColumnIdx!);
      } else if (rowIdx == startRowIdx && columnIdx >= startColumnIdx!) {
        return true;
      } else if (rowIdx == endRowIdx && columnIdx <= endColumnIdx!) {
        return true;
      } else if (rowIdx > startRowIdx && rowIdx < endRowIdx) {
        return true;
      }

      return false;
    } else if (_selectingMode.isRow) {
      return false;
    } else {
      throw Exception('selectingMode is not handled');
    }
  }

  @override
  void handleAfterSelectingRow(TableViewCell cell, dynamic value) {
    changeCellValue(cell, value, notify: false);

    if (configuration.enableMoveDownAfterSelecting) {
      moveCurrentCell(TableMoveDirection.down, notify: false);

      setEditing(true, notify: false);
    }

    setKeepFocus(true, notify: false);

    notifyListeners();
  }

  List<TableGridSelectingCellPosition> _selectingCells() {
    final List<TableGridSelectingCellPosition> positions = [];

    final columnIndexes = columnIndexesByShowFrozen;

    int columnStartIdx = min(
        currentCellPosition!.columnIdx!, currentSelectingPosition!.columnIdx!);

    int columnEndIdx = max(
        currentCellPosition!.columnIdx!, currentSelectingPosition!.columnIdx!);

    int rowStartIdx =
        min(currentCellPosition!.rowIdx!, currentSelectingPosition!.rowIdx!);

    int rowEndIdx =
        max(currentCellPosition!.rowIdx!, currentSelectingPosition!.rowIdx!);

    for (int i = rowStartIdx; i <= rowEndIdx; i += 1) {
      for (int j = columnStartIdx; j <= columnEndIdx; j += 1) {
        final String field = refColumns[columnIndexes[j]].field;

        positions.add(TableGridSelectingCellPosition(
          rowIdx: i,
          field: field,
        ));
      }
    }

    return positions;
  }

  List<TableGridSelectingCellPosition> _selectingCellsHorizontally() {
    final List<TableGridSelectingCellPosition> positions = [];

    final columnIndexes = columnIndexesByShowFrozen;

    final bool firstCurrent = currentCellPosition!.rowIdx! <
            currentSelectingPosition!.rowIdx! ||
        (currentCellPosition!.rowIdx! == currentSelectingPosition!.rowIdx! &&
            currentCellPosition!.columnIdx! <=
                currentSelectingPosition!.columnIdx!);

    TableGridCellPosition startCell =
        firstCurrent ? currentCellPosition! : currentSelectingPosition!;

    TableGridCellPosition endCell =
        !firstCurrent ? currentCellPosition! : currentSelectingPosition!;

    int columnStartIdx = startCell.columnIdx!;

    int columnEndIdx = endCell.columnIdx!;

    int rowStartIdx = startCell.rowIdx!;

    int rowEndIdx = endCell.rowIdx!;

    final length = columnIndexes.length;

    for (int i = rowStartIdx; i <= rowEndIdx; i += 1) {
      for (int j = 0; j < length; j += 1) {
        if (i == rowStartIdx && j < columnStartIdx) {
          continue;
        }

        final String field = refColumns[columnIndexes[j]].field;

        positions.add(TableGridSelectingCellPosition(
          rowIdx: i,
          field: field,
        ));

        if (i == rowEndIdx && j == columnEndIdx) {
          break;
        }
      }
    }

    return positions;
  }

  String _selectingTextFromSelectingRows() {
    final columnIndexes = columnIndexesByShowFrozen;

    List<String> rowText = [];

    for (final row in _currentSelectingRows) {
      List<String> columnText = [];

      for (int i = 0; i < columnIndexes.length; i += 1) {
        final String field = refColumns[columnIndexes[i]].field;

        columnText.add(row.cells[field]!.value.toString());
      }

      rowText.add(columnText.join('\t'));
    }

    return rowText.join('\n');
  }

  String _selectingTextFromSelectingPosition() {
    final columnIndexes = columnIndexesByShowFrozen;

    List<String> rowText = [];

    int columnStartIdx = min(
        currentCellPosition!.columnIdx!, currentSelectingPosition!.columnIdx!);

    int columnEndIdx = max(
        currentCellPosition!.columnIdx!, currentSelectingPosition!.columnIdx!);

    int rowStartIdx =
        min(currentCellPosition!.rowIdx!, currentSelectingPosition!.rowIdx!);

    int rowEndIdx =
        max(currentCellPosition!.rowIdx!, currentSelectingPosition!.rowIdx!);

    for (int i = rowStartIdx; i <= rowEndIdx; i += 1) {
      List<String> columnText = [];

      for (int j = columnStartIdx; j <= columnEndIdx; j += 1) {
        final String field = refColumns[columnIndexes[j]].field;

        columnText.add(refRows[i].cells[field]!.value.toString());
      }

      rowText.add(columnText.join('\t'));
    }

    return rowText.join('\n');
  }

  String _selectingTextFromCurrentCell() {
    return currentCell!.value.toString();
  }

  void _setFistCellAsCurrent() {
    setCurrentCell(firstCell, 0, notify: false);

    if (isEditing == true) {
      setEditing(false, notify: false);
    }
  }

  void _clearCurrentSelectingPosition({bool notify = true}) {
    if (_currentSelectingPosition == null) {
      return;
    }

    _currentSelectingPosition = null;

    if (notify) {
      notifyListeners();
    }
  }

  void _clearCurrentSelectingRows({bool notify = true}) {
    if (_currentSelectingRows.isEmpty) {
      return;
    }

    _currentSelectingRows = [];

    if (notify) {
      notifyListeners();
    }
  }
}
