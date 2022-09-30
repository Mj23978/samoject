import 'package:flutter/material.dart';

import 'table_cell.dart';

class TableViewRow {
  Map<String, TableViewCell> cells;

  /// Value to maintain the default sort order when sorting columns.
  /// If there is no value, it is automatically set when loading the grid.
  int? sortIdx;

  TableViewRow({
    required this.cells,
    this.sortIdx,
    bool checked = false,
    Key? key,
  })  : _checked = checked,
        _state = TableRowState.none,
        _key = key ?? UniqueKey();

  /// The state value that the checkbox is checked.
  /// If the enableRowChecked value of the [TableViewColumn] property is set to true,
  /// a check box appears in the cell of the corresponding column.
  /// To manually change the values at runtime,
  /// use the TableStateManager.setRowChecked
  /// or TableStateManager.toggleAllRowChecked methods.
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
  /// the [state] value of the changed row is changed to [TableRowState.updated],
  /// and in this case, even if the filtering condition is not
  /// Make sure it stays in the list unless you change the filtering again.
  TableRowState get state => _state;

  TableRowState _state;

  void setState(TableRowState state) {
    _state = state;
  }

  Key get key => _key;

  final Key _key;
}

enum TableRowState {
  none,
  added,
  updated;

  bool get isNone => this == TableRowState.none;

  bool get isAdded => this == TableRowState.added;

  bool get isUpdated => this == TableRowState.updated;
}
