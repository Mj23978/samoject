import 'package:flutter/material.dart';

import '../../model/samoject_list_cell.dart';
import '../../model/samoject_list_column.dart';
import '../../samoject_list_grid.dart';
import '../samoject_list_grid_state_manager.dart';
import 'samoject_list_grid_event.dart';
import 'samoject_list_grid_scroll_update_event.dart';

/// [SamojectListCell] This event handles the gesture of the widget.
class SamojectListGridCellGestureEvent extends SamojectListGridEvent {
  final SamojectListGridGestureType gestureType;
  final Offset offset;
  final SamojectListCell cell;
  final SamojectListColumn column;
  final int rowIdx;

  SamojectListGridCellGestureEvent({
    required this.gestureType,
    required this.offset,
    required this.cell,
    required this.column,
    required this.rowIdx,
  });

  @override
  void handler(SamojectListGridStateManager stateManager) {
    switch (gestureType) {
      case SamojectListGridGestureType.onTapUp:
        _onTapUp(stateManager);
        break;
      case SamojectListGridGestureType.onLongPressStart:
        _onLongPressStart(stateManager);
        break;
      case SamojectListGridGestureType.onLongPressMoveUpdate:
        _onLongPressMoveUpdate(stateManager);
        break;
      case SamojectListGridGestureType.onLongPressEnd:
        _onLongPressEnd(stateManager);
        break;
      case SamojectListGridGestureType.onDoubleTap:
        _onDoubleTap(stateManager);
        break;
      case SamojectListGridGestureType.onSecondaryTap:
        _onSecondaryTap(stateManager);
        break;
      default:
    }
  }

  void _onTapUp(SamojectListGridStateManager stateManager) {
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

  void _onLongPressStart(SamojectListGridStateManager stateManager) {
    _setCurrentCell(stateManager, cell, rowIdx);

    stateManager.setSelecting(true);

    if (stateManager.selectingMode.isRow) {
      stateManager.toggleSelectingRow(rowIdx);
    }
  }

  void _onLongPressMoveUpdate(SamojectListGridStateManager stateManager) {
    _setCurrentCell(stateManager, cell, rowIdx);

    stateManager.setCurrentSelectingPositionWithOffset(offset);

    stateManager.eventManager!.addEvent(
      SamojectListGridScrollUpdateEvent(offset: offset),
    );
  }

  void _onLongPressEnd(SamojectListGridStateManager stateManager) {
    _setCurrentCell(stateManager, cell, rowIdx);

    stateManager.setSelecting(false);

    SamojectListGridScrollUpdateEvent.stopScroll(
      stateManager,
      SamojectListGridScrollUpdateDirection.all,
    );
  }

  void _onDoubleTap(SamojectListGridStateManager stateManager) {
    stateManager.onRowDoubleTap!(
      SamojectListGridOnRowDoubleTapEvent(
        row: stateManager.getRowByIdx(rowIdx),
        rowIdx: rowIdx,
        cell: cell,
      ),
    );
  }

  void _onSecondaryTap(SamojectListGridStateManager stateManager) {
    stateManager.onRowSecondaryTap!(
      SamojectListGridOnRowSecondaryTapEvent(
        row: stateManager.getRowByIdx(rowIdx),
        rowIdx: rowIdx,
        cell: cell,
        offset: offset,
      ),
    );
  }

  bool _setKeepFocusAndCurrentCell(SamojectListGridStateManager stateManager) {
    if (stateManager.hasFocus) {
      return false;
    }

    stateManager.setKeepFocus(true);

    return stateManager.isCurrentCell(cell);
  }

  void _selecting(SamojectListGridStateManager stateManager) {
    if (stateManager.keyPressed.shift) {
      final int? columnIdx = stateManager.columnIndex(column);

      stateManager.setCurrentSelectingPosition(
        cellPosition: SamojectListGridCellPosition(
          columnIdx: columnIdx,
          rowIdx: rowIdx,
        ),
      );
    } else if (stateManager.keyPressed.ctrl) {
      stateManager.toggleSelectingRow(rowIdx);
    }
  }

  void _selectMode(SamojectListGridStateManager stateManager) {
    if (stateManager.isCurrentCell(cell) == false) {
      stateManager.setCurrentCell(cell, rowIdx);

      if (!stateManager.mode.isSelectModeWithOneTap) {
        return;
      }
    }

    stateManager.handleOnSelected();
  }

  void _setCurrentCell(
    SamojectListGridStateManager stateManager,
    SamojectListCell? cell,
    int? rowIdx,
  ) {
    if (stateManager.isCurrentCell(cell) != true) {
      stateManager.setCurrentCell(cell, rowIdx, notify: false);
    }
  }
}

enum SamojectListGridGestureType {
  onTapUp,
  onLongPressStart,
  onLongPressMoveUpdate,
  onLongPressEnd,
  onDoubleTap,
  onSecondaryTap;

  bool get isOnTapUp => this == SamojectListGridGestureType.onTapUp;

  bool get isOnLongPressStart =>
      this == SamojectListGridGestureType.onLongPressStart;

  bool get isOnLongPressMoveUpdate =>
      this == SamojectListGridGestureType.onLongPressMoveUpdate;

  bool get isOnLongPressEnd =>
      this == SamojectListGridGestureType.onLongPressEnd;

  bool get isOnDoubleTap => this == SamojectListGridGestureType.onDoubleTap;

  bool get isOnSecondaryTap =>
      this == SamojectListGridGestureType.onSecondaryTap;
}
