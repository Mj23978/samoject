import 'package:flutter/material.dart';

import 'table_column.dart';
import 'table_row.dart';

class TableViewCell {
  TableViewCell({
    dynamic value,
  })  : _key = UniqueKey(),
        _value = value;

  final Key _key;

  Key get key => _key;

  dynamic _value;

  dynamic get value => _value;

  set value(dynamic changed) {
    if (_value == changed) {
      return;
    }

    _value = changed;

    _valueForSorting = null;
  }

  dynamic _valueForSorting;

  dynamic get valueForSorting {
    _valueForSorting ??= _getValueForSorting();

    return _valueForSorting;
  }

  dynamic _getValueForSorting() {
    _valueForSorting ??= _column.type.makeCompareValue(_value);

    return _valueForSorting;
  }

  TableViewColumn get column => _column;

  late TableViewColumn _column;

  void setColumn(TableViewColumn column) {
    _column = column;
    _valueForSorting = _getValueForSorting();
  }

  TableViewRow get row => _row;

  late TableViewRow _row;

  void setRow(TableViewRow row) {
    _row = row;
  }
}
