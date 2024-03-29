import 'package:flutter/material.dart';

import '../../helper/samoject_list_move_direction.dart';
import '../../model/samoject_list_column.dart';
import '../samoject_list_grid_state_manager.dart';

abstract class IFocusState {
  /// FocusNode to control keyboard input.
  FocusNode? get gridFocusNode;

  bool get keepFocus;

  bool get hasFocus;

  void setGridFocusNode(FocusNode focusNode);

  void setKeepFocus(bool flag, {bool notify = true});

  void nextFocusOfColumnFilter(
    SamojectListColumn column, {
    bool reversed = false,
  });
}

mixin FocusState implements ISamojectListGridState {
  @override
  FocusNode? get gridFocusNode => _gridFocusNode;

  FocusNode? _gridFocusNode;

  @override
  bool get keepFocus => _keepFocus;

  bool _keepFocus = false;

  @override
  bool get hasFocus =>
      _gridFocusNode != null && _keepFocus && _gridFocusNode!.hasFocus;

  @override
  void setGridFocusNode(FocusNode? focusNode) {
    _gridFocusNode = focusNode;
  }

  @override
  void setKeepFocus(bool flag, {bool notify = true}) {
    if (_keepFocus == flag) {
      return;
    }

    _keepFocus = flag;

    if (_keepFocus) {
      _gridFocusNode!.requestFocus();
    }

    if (notify) {
      if (_keepFocus) {
        // RequestFocus is fired and notifies listeners with hasFocus true.
        // requestFocus delays up to one frame.
        notifyListenersOnPostFrame();
      } else {
        notifyListeners();
      }
    }
  }

  @override
  void nextFocusOfColumnFilter(
    SamojectListColumn column, {
    bool reversed = false,
  }) {
    if (!column.enableFilterMenuItem) {
      return;
    }

    final columnIndexes = reversed
        ? columnIndexesByShowFrozen.reversed.toList(growable: false)
        : columnIndexesByShowFrozen.toList(growable: false);

    final length = columnIndexes.length;

    bool found = false;

    for (int i = 0; i < length - 1; i += 1) {
      var current = refColumns[columnIndexes[i]];

      if (!found && current.key == column.key) {
        found = true;
      }

      if (!found) {
        continue;
      }

      var toMoveIndex = columnIndexes[i + 1];

      var toMove = refColumns[toMoveIndex];

      if (toMove.enableFilterMenuItem) {
        toMove.filterFocusNode?.requestFocus();

        moveScrollByColumn(
          reversed
              ? SamojectListMoveDirection.left
              : SamojectListMoveDirection.right,
          reversed ? length - 1 - i : i,
        );

        return;
      }
    }
  }
}
