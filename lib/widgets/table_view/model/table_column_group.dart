import 'package:flutter/cupertino.dart';

import 'table_column.dart';

class TableViewColumnGroup {
  final String title;

  final List<String>? fields;

  final List<TableViewColumnGroup>? children;

  final EdgeInsets? titlePadding;

  /// Text alignment in Cell. (Left, Right, Center)
  final TableColumnTextAlign titleTextAlign;

  /// Customize the column with TextSpan or WidgetSpan instead of the column's title string.
  ///
  /// ```
  /// titleSpan: const TextSpan(
  ///   children: [
  ///     WidgetSpan(
  ///       child: Text(
  ///         '* ',
  ///         style: TextStyle(color: Colors.red),
  ///       ),
  ///     ),
  ///     TextSpan(text: 'column title'),
  ///   ],
  /// ),
  /// ```
  final InlineSpan? titleSpan;

  /// It shows only one column.
  /// he height is set to the maximum depth of the group.
  /// The group title is not shown.
  final bool? expandedColumn;

  final Color? backgroundColor;

  TableViewColumnGroup({
    required this.title,
    this.fields,
    this.children,
    this.titlePadding,
    this.titleSpan,
    this.titleTextAlign = TableColumnTextAlign.center,
    this.expandedColumn = false,
    this.backgroundColor,
    Key? key,
  })  : assert(fields == null
            ? (children != null && children.isNotEmpty)
            : fields.isNotEmpty && children == null),
        assert(expandedColumn == true
            ? fields?.length == 1 && children == null
            : true),
        _key = key ?? UniqueKey() {
    hasFields = fields != null;

    hasChildren = !hasFields;

    if (hasChildren) {
      for (final child in children!) {
        child.parent = this;
      }
    }
  }

  Key get key => _key;

  final Key _key;

  late final bool hasFields;

  late final bool hasChildren;

  TableViewColumnGroup? parent;

  Iterable<TableViewColumnGroup> get parents sync* {
    var cursor = parent;

    while (cursor != null) {
      yield cursor;

      cursor = cursor.parent;
    }
  }
}

class TableColumnGroupPair {
  TableViewColumnGroup group;
  List<TableViewColumn> columns;

  TableColumnGroupPair({
    required this.group,
    required this.columns,
  }) :
        // a unique reproducible key
        _key = ValueKey(group.key.toString() +
            columns.fold("",
                (previousValue, element) => "$previousValue-${element.field}"));

  Key get key => _key;

  final Key _key;

  double get width {
    double sumWidth = 0;

    for (final column in columns) {
      sumWidth += column.width;
    }

    return sumWidth;
  }

  double get startPosition => columns.first.startPosition;
}
