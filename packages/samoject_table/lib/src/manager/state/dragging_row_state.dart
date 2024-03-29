import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../model/samoject_table_row.dart';
import '../samoject_table_grid_state_manager.dart';

abstract class IDraggingRowState {
  bool get isDraggingRow;

  List<SamojectTableRow> get dragRows;

  int? get dragTargetRowIdx;

  bool get canRowDrag;

  void setIsDraggingRow(
    bool flag, {
    bool notify = true,
  });

  void setDragRows(
    List<SamojectTableRow> rows, {
    bool notify = true,
  });

  void setDragTargetRowIdx(
    int rowIdx, {
    bool notify = true,
  });

  bool isRowIdxDragTarget(int rowIdx);

  bool isRowIdxTopDragTarget(int rowIdx);

  bool isRowIdxBottomDragTarget(int rowIdx);

  bool isRowBeingDragged(Key rowKey);
}

mixin DraggingRowState implements ISamojectTableGridState {
  @override
  bool get isDraggingRow => _isDraggingRow;

  bool _isDraggingRow = false;

  @override
  List<SamojectTableRow> get dragRows => _dragRows;

  List<SamojectTableRow> _dragRows = [];

  @override
  int? get dragTargetRowIdx => _dragTargetRowIdx;

  int? _dragTargetRowIdx;

  @override
  bool get canRowDrag => !hasFilter && !hasSortedColumn;

  @override
  void setIsDraggingRow(
    bool flag, {
    bool notify = true,
  }) {
    if (_isDraggingRow == flag) {
      return;
    }

    _isDraggingRow = flag;

    _clearDraggingState();

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void setDragRows(
    List<SamojectTableRow> rows, {
    bool notify = true,
  }) {
    _dragRows = rows;

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void setDragTargetRowIdx(
    int? rowIdx, {
    bool notify = true,
  }) {
    if (_dragTargetRowIdx == rowIdx) {
      return;
    }

    _dragTargetRowIdx = rowIdx;

    if (notify) {
      notifyListeners();
    }
  }

  @override
  bool isRowIdxDragTarget(int? rowIdx) {
    return rowIdx != null &&
        _dragTargetRowIdx != null &&
        _dragTargetRowIdx! <= rowIdx &&
        rowIdx < _dragTargetRowIdx! + _dragRows.length;
  }

  @override
  bool isRowIdxTopDragTarget(int? rowIdx) {
    return rowIdx != null &&
        _dragTargetRowIdx != null &&
        _dragTargetRowIdx == rowIdx &&
        rowIdx + _dragRows.length <= refRows.length;
  }

  @override
  bool isRowIdxBottomDragTarget(int? rowIdx) {
    return rowIdx != null &&
        _dragTargetRowIdx != null &&
        rowIdx == _dragTargetRowIdx! + _dragRows.length - 1;
  }

  @override
  bool isRowBeingDragged(Key? rowKey) {
    return rowKey != null &&
        _isDraggingRow == true &&
        dragRows.firstWhereOrNull((element) => element.key == rowKey) != null;
  }

  void _clearDraggingState() {
    _dragRows = [];

    _dragTargetRowIdx = null;
  }
}
