import 'package:flutter/material.dart';

import '../../model/samoject_table_cell.dart';
import '../../model/samoject_table_column.dart';
import '../../samoject_table_grid.dart';
import '../samoject_table_grid_state_manager.dart';
import 'samoject_table_grid_event.dart';
import 'samoject_table_grid_scroll_update_event.dart';

/// [SamojectTableCell] This event handles the gesture of the widget.
class SamojectTableGridCellGestureEvent extends SamojectTableGridEvent {
  final SamojectTableGridGestureType gestureType;
  final Offset offset;
  final SamojectTableCell cell;
  final SamojectTableColumn column;
  final int rowIdx;

  SamojectTableGridCellGestureEvent({
    required this.gestureType,
    required this.offset,
    required this.cell,
    required this.column,
    required this.rowIdx,
  });

  @override
  void handler(SamojectTableGridStateManager stateManager) {
    switch (gestureType) {
      case SamojectTableGridGestureType.onTapUp:
        _onTapUp(stateManager);
        break;
      case SamojectTableGridGestureType.onLongPressStart:
        _onLongPressStart(stateManager);
        break;
      case SamojectTableGridGestureType.onLongPressMoveUpdate:
        _onLongPressMoveUpdate(stateManager);
        break;
      case SamojectTableGridGestureType.onLongPressEnd:
        _onLongPressEnd(stateManager);
        break;
      case SamojectTableGridGestureType.onDoubleTap:
        _onDoubleTap(stateManager);
        break;
      case SamojectTableGridGestureType.onSecondaryTap:
        _onSecondaryTap(stateManager);
        break;
      default:
    }
  }

  void _onTapUp(SamojectTableGridStateManager stateManager) {
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

  void _onLongPressStart(SamojectTableGridStateManager stateManager) {
    _setCurrentCell(stateManager, cell, rowIdx);

    stateManager.setSelecting(true);

    if (stateManager.selectingMode.isRow) {
      stateManager.toggleSelectingRow(rowIdx);
    }
  }

  void _onLongPressMoveUpdate(SamojectTableGridStateManager stateManager) {
    _setCurrentCell(stateManager, cell, rowIdx);

    stateManager.setCurrentSelectingPositionWithOffset(offset);

    stateManager.eventManager!.addEvent(
      SamojectTableGridScrollUpdateEvent(offset: offset),
    );
  }

  void _onLongPressEnd(SamojectTableGridStateManager stateManager) {
    _setCurrentCell(stateManager, cell, rowIdx);

    stateManager.setSelecting(false);

    SamojectTableGridScrollUpdateEvent.stopScroll(
      stateManager,
      SamojectTableGridScrollUpdateDirection.all,
    );
  }

  void _onDoubleTap(SamojectTableGridStateManager stateManager) {
    stateManager.onRowDoubleTap!(
      SamojectTableGridOnRowDoubleTapEvent(
        row: stateManager.getRowByIdx(rowIdx),
        rowIdx: rowIdx,
        cell: cell,
      ),
    );
  }

  void _onSecondaryTap(SamojectTableGridStateManager stateManager) {
    stateManager.onRowSecondaryTap!(
      SamojectTableGridOnRowSecondaryTapEvent(
        row: stateManager.getRowByIdx(rowIdx),
        rowIdx: rowIdx,
        cell: cell,
        offset: offset,
      ),
    );
  }

  bool _setKeepFocusAndCurrentCell(SamojectTableGridStateManager stateManager) {
    if (stateManager.hasFocus) {
      return false;
    }

    stateManager.setKeepFocus(true);

    return stateManager.isCurrentCell(cell);
  }

  void _selecting(SamojectTableGridStateManager stateManager) {
    if (stateManager.keyPressed.shift) {
      final int? columnIdx = stateManager.columnIndex(column);

      stateManager.setCurrentSelectingPosition(
        cellPosition: SamojectTableGridCellPosition(
          columnIdx: columnIdx,
          rowIdx: rowIdx,
        ),
      );
    } else if (stateManager.keyPressed.ctrl) {
      stateManager.toggleSelectingRow(rowIdx);
    }
  }

  void _selectMode(SamojectTableGridStateManager stateManager) {
    if (stateManager.isCurrentCell(cell) == false) {
      stateManager.setCurrentCell(cell, rowIdx);

      if (!stateManager.mode.isSelectModeWithOneTap) {
        return;
      }
    }

    stateManager.handleOnSelected();
  }

  void _setCurrentCell(
    SamojectTableGridStateManager stateManager,
    SamojectTableCell? cell,
    int? rowIdx,
  ) {
    if (stateManager.isCurrentCell(cell) != true) {
      stateManager.setCurrentCell(cell, rowIdx, notify: false);
    }
  }
}

enum SamojectTableGridGestureType {
  onTapUp,
  onLongPressStart,
  onLongPressMoveUpdate,
  onLongPressEnd,
  onDoubleTap,
  onSecondaryTap;

  bool get isOnTapUp => this == SamojectTableGridGestureType.onTapUp;

  bool get isOnLongPressStart =>
      this == SamojectTableGridGestureType.onLongPressStart;

  bool get isOnLongPressMoveUpdate =>
      this == SamojectTableGridGestureType.onLongPressMoveUpdate;

  bool get isOnLongPressEnd =>
      this == SamojectTableGridGestureType.onLongPressEnd;

  bool get isOnDoubleTap => this == SamojectTableGridGestureType.onDoubleTap;

  bool get isOnSecondaryTap =>
      this == SamojectTableGridGestureType.onSecondaryTap;
}
