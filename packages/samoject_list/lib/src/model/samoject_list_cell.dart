import 'package:flutter/material.dart';

import 'samoject_list_column.dart';
import 'samoject_list_row.dart';

class SamojectListCell {
  SamojectListCell({
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

  SamojectListColumn get column => _column;

  late SamojectListColumn _column;

  void setColumn(SamojectListColumn column) {
    _column = column;
    _valueForSorting = _getValueForSorting();
  }

  SamojectListRow get row => _row;

  late SamojectListRow _row;

  void setRow(SamojectListRow row) {
    _row = row;
  }
}
