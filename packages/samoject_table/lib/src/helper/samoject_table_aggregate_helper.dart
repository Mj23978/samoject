import 'package:collection/collection.dart'
    show IterableNumberExtension, IterableExtension;

import '../model/samoject_table_column.dart';
import '../model/samoject_table_column_type.dart';
import '../model/samoject_table_row.dart';
import '../plugin/samoject_table_aggregate_column_footer.dart';

class SamojectTableAggregateHelper {
  static num sum({
    required List<SamojectTableRow> rows,
    required SamojectTableColumn column,
    SamojectTableAggregateFilter? filter,
  }) {
    num sum = 0;

    if (column.type is! SamojectTableColumnTypeWithNumberFormat ||
        !_hasColumnField(rows: rows, column: column)) {
      return sum;
    }

    final numberColumn = column.type as SamojectTableColumnTypeWithNumberFormat;

    sum = rows.fold(0, (p, e) {
      final cell = e.cells[column.field]!;

      if (filter == null || filter(cell)) {
        return p += cell.value!;
      }
      return p;
    });

    return numberColumn.toNumber(numberColumn.applyFormat(sum));
  }

  static num average({
    required List<SamojectTableRow> rows,
    required SamojectTableColumn column,
    SamojectTableAggregateFilter? filter,
  }) {
    num sum = 0;

    if (column.type is! SamojectTableColumnTypeWithNumberFormat ||
        !_hasColumnField(rows: rows, column: column)) {
      return sum;
    }

    int itemCount = 0;

    sum = rows.fold(0, (p, e) {
      final cell = e.cells[column.field]!;

      if (filter == null || filter(cell)) {
        ++itemCount;
        return p += cell.value!;
      }

      return p;
    });

    return sum / itemCount;
  }

  static num? min({
    required List<SamojectTableRow> rows,
    required SamojectTableColumn column,
    SamojectTableAggregateFilter? filter,
  }) {
    if (column.type is! SamojectTableColumnTypeWithNumberFormat ||
        !_hasColumnField(rows: rows, column: column)) {
      return null;
    }

    final foundItems = filter != null
        ? rows.where((row) => filter(row.cells[column.field]!))
        : rows;

    final Iterable<num> mapValues =
        foundItems.map((e) => e.cells[column.field]!.value);

    return mapValues.minOrNull;
  }

  static num? max({
    required List<SamojectTableRow> rows,
    required SamojectTableColumn column,
    SamojectTableAggregateFilter? filter,
  }) {
    if (column.type is! SamojectTableColumnTypeWithNumberFormat ||
        !_hasColumnField(rows: rows, column: column)) {
      return null;
    }

    final foundItems = filter != null
        ? rows.where((row) => filter(row.cells[column.field]!))
        : rows;

    final Iterable<num> mapValues =
        foundItems.map((e) => e.cells[column.field]!.value);

    return mapValues.maxOrNull;
  }

  static int count({
    required List<SamojectTableRow> rows,
    required SamojectTableColumn column,
    SamojectTableAggregateFilter? filter,
  }) {
    if (!_hasColumnField(rows: rows, column: column)) {
      return 0;
    }

    final foundItems = filter != null
        ? rows.where((row) => filter(row.cells[column.field]!))
        : rows;

    return foundItems.length;
  }

  static bool _hasColumnField({
    required List<SamojectTableRow> rows,
    required SamojectTableColumn column,
  }) {
    return rows.firstOrNull?.cells.containsKey(column.field) == true;
  }
}
