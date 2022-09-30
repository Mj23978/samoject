import 'package:flutter/material.dart';

import '../../model/table_cell.dart';
import '../../model/table_column.dart';
import '../../table_grid.dart';
import '../table_grid_state_manager.dart';
import 'table_grid_event.dart';
import 'table_grid_scroll_update_event.dart';

/// [TableViewCell] This event handles the gesture of the widget.
class TableGridCellGestureEvent extends TableGridEvent {
  final TableGridGestureType gestureType;
  final Offset offset;
  final TableViewCell cell;
  final TableViewColumn column;
  final int rowIdx;

  TableGridCellGestureEvent({
    required this.gestureType,
    required this.offset,
    required this.cell,
    required this.column,
    required this.rowIdx,
  });

  @override
  void handler(TableGridStateManager stateManager) {
    switch (gestureType) {
      case TableGridGestureType.onTapUp:
        _onTapUp(stateManager);
        break;
      case TableGridGestureType.onLongPressStart:
        _onLongPressStart(stateManager);
        break;
      case TableGridGestureType.onLongPressMoveUpdate:
        _onLongPressMoveUpdate(stateManager);
        break;
      case TableGridGestureType.onLongPressEnd:
        _onLongPressEnd(stateManager);
        break;
      case TableGridGestureType.onDoubleTap:
        _onDoubleTap(stateManager);
        break;
      case TableGridGestureType.onSecondaryTap:
        _onSecondaryTap(stateManager);
        break;
      default:
    }
  }

  void _onTapUp(TableGridStateManager stateManager) {
    if (_setKeepFocusAndCurrentCell(stateManager)) {
      return;
    } else if (stateManager.isSelectingInteraction()) {
      _selecting(stateManager);
      return;
    } else if (stateManager.mode.isSelect) {
      _selectMode(stateManager);
      return;
    }

    if (stateManager.isCurrentCell(cell) && stateManager.isEditing != true) {
      stateManager.setEditing(true);
    } else {
      stateManager.setCurrentCell(cell, rowIdx);
    }
  }

  void _onLongPressStart(TableGridStateManager stateManager) {
    _setCurrentCell(stateManager, cell, rowIdx);

    stateManager.setSelecting(true);

    if (stateManager.selectingMode.isRow) {
      stateManager.toggleSelectingRow(rowIdx);
    }
  }

  void _onLongPressMoveUpdate(TableGridStateManager stateManager) {
    _setCurrentCell(stateManager, cell, rowIdx);

    stateManager.setCurrentSelectingPositionWithOffset(offset);

    stateManager.eventManager!.addEvent(
      TableGridScrollUpdateEvent(offset: offset),
    );
  }

  void _onLongPressEnd(TableGridStateManager stateManager) {
    _setCurrentCell(stateManager, cell, rowIdx);

    stateManager.setSelecting(false);

    TableGridScrollUpdateEvent.stopScroll(
      stateManager,
      TableGridScrollUpdateDirection.all,
    );
  }

  void _onDoubleTap(TableGridStateManager stateManager) {
    stateManager.onRowDoubleTap!(
      TableGridOnRowDoubleTapEvent(
        row: stateManager.getRowByIdx(rowIdx),
        rowIdx: rowIdx,
        cell: cell,
      ),
    );
  }

  void _onSecondaryTap(TableGridStateManager stateManager) {
    stateManager.onRowSecondaryTap!(
      TableGridOnRowSecondaryTapEvent(
        row: stateManager.getRowByIdx(rowIdx),
        rowIdx: rowIdx,
        cell: cell,
        offset: offset,
      ),
    );
  }

  bool _setKeepFocusAndCurrentCell(TableGridStateManager stateManager) {
    if (stateManager.hasFocus) {
      return false;
    }

    stateManager.setKeepFocus(true);

    return stateManager.isCurrentCell(cell);
  }

  void _selecting(TableGridStateManager stateManager) {
    if (stateManager.keyPressed.shift) {
      final int? columnIdx = stateManager.columnIndex(column);

      stateManager.setCurrentSelectingPosition(
        cellPosition: TableGridCellPosition(
          columnIdx: columnIdx,
          rowIdx: rowIdx,
        ),
      );
    } else if (stateManager.keyPressed.ctrl) {
      stateManager.toggleSelectingRow(rowIdx);
    }
  }

  void _selectMode(TableGridStateManager stateManager) {
    if (stateManager.isCurrentCell(cell) == false) {
      stateManager.setCurrentCell(cell, rowIdx);

      if (!stateManager.mode.isSelectModeWithOneTap) {
        return;
      }
    }

    stateManager.handleOnSelected();
  }

  void _setCurrentCell(
    TableGridStateManager stateManager,
    TableViewCell? cell,
    int? rowIdx,
  ) {
    if (stateManager.isCurrentCell(cell) != true) {
      stateManager.setCurrentCell(cell, rowIdx, notify: false);
    }
  }
}

enum TableGridGestureType {
  onTapUp,
  onLongPressStart,
  onLongPressMoveUpdate,
  onLongPressEnd,
  onDoubleTap,
  onSecondaryTap;

  bool get isOnTapUp => this == TableGridGestureType.onTapUp;

  bool get isOnLongPressStart => this == TableGridGestureType.onLongPressStart;

  bool get isOnLongPressMoveUpdate =>
      this == TableGridGestureType.onLongPressMoveUpdate;

  bool get isOnLongPressEnd => this == TableGridGestureType.onLongPressEnd;

  bool get isOnDoubleTap => this == TableGridGestureType.onDoubleTap;

  bool get isOnSecondaryTap => this == TableGridGestureType.onSecondaryTap;
}
