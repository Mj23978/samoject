import 'package:flutter/material.dart';

import 'samoject_table_column.dart';
import 'samoject_table_row.dart';

class SamojectTableCell {
  SamojectTableCell({
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

  SamojectTableColumn get column => _column;

  late SamojectTableColumn _column;

  void setColumn(SamojectTableColumn column) {
    _column = column;
    _valueForSorting = _getValueForSorting();
  }

  SamojectTableRow get row => _row;

  late SamojectTableRow _row;

  void setRow(SamojectTableRow row) {
    _row = row;
  }
}
