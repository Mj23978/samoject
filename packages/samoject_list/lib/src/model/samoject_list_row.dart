import 'package:flutter/material.dart';

import 'samoject_list_cell.dart';

class SamojectListRow {
  Map<String, SamojectListCell> cells;

  /// Value to maintain the default sort order when sorting columns.
  /// If there is no value, it is automatically set when loading the grid.
  int? sortIdx;

  SamojectListRow({
    required this.cells,
    this.sortIdx,
    bool checked = false,
    Key? key,
  })  : _checked = checked,
        _state = SamojectListRowState.none,
        _key = key ?? UniqueKey();

  /// The state value that the checkbox is checked.
  /// If the enableRowChecked value of the [SamojectListColumn] property is set to true,
  /// a check box appears in the cell of the corresponding column.
  /// To manually change the values at runtime,
  /// use the SamojectListStateManager.setRowChecked
  /// or SamojectListStateManager.toggleAllRowChecked methods.
  bool? get checked => _checked;

  bool? _checked;

  void setChecked(bool? flag) {
    _checked = flag;
  }

  /// State when a new row is added or the cell value in the row is changed.
  ///
  /// Keeps the row from disappearing when changing the cell value
  /// to a value other than the filtering condition while column filtering is applied.
  /// When the value of a cell is changed,
  /// the [state] value of the changed row is changed to [SamojectListRowState.updated],
  /// and in this case, even if the filtering condition is not
  /// Make sure it stays in the list unless you change the filtering again.
  SamojectListRowState get state => _state;

  SamojectListRowState _state;

  void setState(SamojectListRowState state) {
    _state = state;
  }

  Key get key => _key;

  final Key _key;
}

enum SamojectListRowState {
  none,
  added,
  updated;

  bool get isNone => this == SamojectListRowState.none;

  bool get isAdded => this == SamojectListRowState.added;

  bool get isUpdated => this == SamojectListRowState.updated;
}
