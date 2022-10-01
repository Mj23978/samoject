import 'package:flutter/material.dart';

import '../helper/filter_helper.dart';
import '../manager/samoject_table_grid_state_manager.dart';
import '../samoject_table_grid.dart';
import 'samoject_table_cell.dart';
import 'samoject_table_column_group.dart';
import 'samoject_table_column_type.dart';
import 'samoject_table_row.dart';

typedef SamojectTableColumnValueFormatter = String Function(dynamic value);

typedef SamojectTableColumnRenderer = Widget Function(
    SamojectTableColumnRendererContext rendererContext);

typedef SamojectTableColumnFooterRenderer = Widget Function(
    SamojectTableColumnFooterRendererContext context);

/// It dynamically determines whether the cells of the column are in the edit state.
///
/// Once the [readOnly] value is set,
/// whether the cell is editable cannot be changed during runtime,
/// but if this callback is implemented,
/// it can be determined whether the cell can be edited or not according to the state of the cell.
typedef SamojectTableColumnCheckReadOnly = bool Function(
  SamojectTableRow row,
  SamojectTableCell cell,
);

class SamojectTableColumn {
  /// A title to be displayed on the screen.
  /// If a titleSpan value is set, the title value is not displayed.
  String title;

  /// Specifies the field name of the row to be connected to the column.
  String field;

  /// Set the column type.
  ///
  /// Text, number, select, date, time, etc.
  /// ex) SamojectTableColumnType.text(), SamojectTableColumnType.number() ...
  SamojectTableColumnType type;

  bool readOnly;

  double width;

  double minWidth;

  /// Customisable title padding.
  /// It takes precedence over defaultColumnTitlePadding in SamojectTableGridConfiguration.
  EdgeInsets? titlePadding;

  EdgeInsets? filterPadding;

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
  InlineSpan? titleSpan;

  /// Customisable cell padding.
  /// It takes precedence over defaultCellPadding in SamojectTableGridConfiguration.
  EdgeInsets? cellPadding;

  /// Text alignment in Cell. (Left, Right, Center)
  SamojectTableColumnTextAlign textAlign;

  /// Text alignment in Title. (Left, Right, Center)
  SamojectTableColumnTextAlign titleTextAlign;

  /// Freeze the column to the left and right.
  SamojectTableColumnFrozen frozen;

  /// Set column sorting.
  SamojectTableColumnSort sort;

  /// Formatter for display of cell values.
  SamojectTableColumnValueFormatter? formatter;

  /// Apply the formatter in the editing state.
  /// However, it is applied only when the cell is readonly
  /// or the text cannot be directly modified, such as in the form of select popup.
  bool applyFormatterInEditing;

  Color? backgroundColor;

  /// Customize the widget in the default cell.
  ///
  /// ```dart
  /// renderer: (rendererContext) {
  ///  Color textColor = Colors.black;
  ///
  ///  if (rendererContext.cell.value == 'red') {
  ///    textColor = Colors.red;
  ///  } else if (rendererContext.cell.value == 'blue') {
  ///    textColor = Colors.blue;
  ///  } else if (rendererContext.cell.value == 'green') {
  ///    textColor = Colors.green;
  ///  }
  ///
  ///  return Text(
  ///    rendererContext.cell.value.toString(),
  ///    style: TextStyle(
  ///      color: textColor,
  ///      fontWeight: FontWeight.bold,
  ///    ),
  ///  );
  /// },
  /// ```
  ///
  /// Consider wrapping a RepaintBoundary widget
  /// if you are defining custom cells with high paint cost.
  SamojectTableColumnRenderer? renderer;

  /// A callback that returns a widget
  /// for expressing aggregate values at the bottom.
  ///
  /// ```dart
  /// footerRenderer: (rendererContext) {
  ///   return SamojectTableAggregateColumnFooter(
  ///     rendererContext: rendererContext,
  ///     type: SamojectTableAggregateColumnType.count,
  ///     format: 'Checked : #,###.###',
  ///     filter: (cell) => cell.row.checked == true,
  ///     alignment: Alignment.center,
  ///   );
  /// },
  /// ```
  SamojectTableColumnFooterRenderer? footerRenderer;

  /// Change the position of the column by dragging the column title.
  bool enableColumnDrag;

  /// Change the position of the row by dragging the icon in the cell.
  bool enableRowDrag;

  /// A checkbox appears in the cell of the column.
  bool enableRowChecked;

  /// Sort rows by tapping on the column heading.
  bool enableSorting;

  /// Displays the right icon of the column title.
  ///
  /// The [SamojectTableGridConfiguration.columnContextIcon] icon appears.
  /// Tap this icon to bring up the context menu.
  ///
  /// If [enableDropToResize] is also activated,
  /// you can adjust the column width by dragging this icon.
  bool enableContextMenu;

  /// Display the right icon for drop to resize the column
  ///
  /// The [SamojectTableGridConfiguration.columnResizeIcon] icon appears.
  /// By dragging this icon to the left or right, the width of the column can be adjusted.
  /// Can't narrow down to less than [minWidth].
  /// Also, if [frozen] is set,
  /// it can be expanded only within the limit of the width of the frozen column.
  ///
  /// If [enableContextMenu] is enabled, the contextMenu icon appears.
  /// In this case, dragging the context menu icon adjusts the column width.
  bool enableDropToResize;

  /// Displays filter-related menus in the column context menu.
  /// Valid only when [enableContextMenu] is activated.
  bool enableFilterMenuItem;

  /// Displays Hide column menu in the column context menu.
  /// Valid only when [enableContextMenu] is activated.
  bool enableHideColumnMenuItem;

  /// Displays Set columns menu in the column context menu.
  /// Valid only when [enableContextMenu] is activated.
  bool enableSetColumnsMenuItem;

  bool enableAutoEditing;

  /// Entering the Enter key or tapping the cell enters the Editing mode.
  bool? enableEditingMode;

  /// Hide the column.
  bool hide;

  SamojectTableColumn({
    required this.title,
    required this.field,
    required this.type,
    this.readOnly = false,
    SamojectTableColumnCheckReadOnly? checkReadOnly,
    this.width = SamojectTableGridSettings.columnWidth,
    this.minWidth = SamojectTableGridSettings.minColumnWidth,
    this.titlePadding,
    this.filterPadding,
    this.titleSpan,
    this.cellPadding,
    this.textAlign = SamojectTableColumnTextAlign.start,
    this.titleTextAlign = SamojectTableColumnTextAlign.start,
    this.frozen = SamojectTableColumnFrozen.none,
    this.sort = SamojectTableColumnSort.none,
    this.formatter,
    this.applyFormatterInEditing = false,
    this.backgroundColor,
    this.renderer,
    this.footerRenderer,
    this.enableColumnDrag = true,
    this.enableRowDrag = false,
    this.enableRowChecked = false,
    this.enableSorting = true,
    this.enableContextMenu = true,
    this.enableDropToResize = true,
    this.enableFilterMenuItem = true,
    this.enableHideColumnMenuItem = true,
    this.enableSetColumnsMenuItem = true,
    this.enableAutoEditing = false,
    this.enableEditingMode = true,
    this.hide = false,
  })  : _key = UniqueKey(),
        _checkReadOnly = checkReadOnly;

  final Key _key;

  final SamojectTableColumnCheckReadOnly? _checkReadOnly;

  Key get key => _key;

  bool get hasRenderer => renderer != null;

  bool get hasCheckReadOnly => _checkReadOnly != null;

  FocusNode? _filterFocusNode;

  FocusNode? get filterFocusNode {
    return _filterFocusNode;
  }

  SamojectTableFilterType? _defaultFilter;

  SamojectTableFilterType get defaultFilter =>
      _defaultFilter ?? const SamojectTableFilterTypeContains();

  bool get isShowRightIcon =>
      enableContextMenu || enableDropToResize || !sort.isNone;

  SamojectTableColumnGroup? group;

  String get titleWithGroup {
    if (group == null) {
      return title;
    }

    List<String> titleList = [
      title,
    ];

    if (group!.expandedColumn != true) {
      titleList.add(group!.title);
    }

    for (final g in group!.parents.toList()) {
      titleList.add(g.title);
    }

    return titleList.reversed.join(' ');
  }

  /// [startPosition] is the position value for the position of the column from the left.
  ///
  /// Updated when the [SamojectTableGridStateManager.updateVisibilityLayout] method is called.
  ///
  /// [startPosition] is used to determine the position to scroll left and right when moving the keyboard
  /// or whether the columns in the center area are displayed in the screen area.
  double startPosition = 0;

  bool checkReadOnly(SamojectTableRow row, SamojectTableCell cell) {
    return hasCheckReadOnly ? _checkReadOnly!(row, cell) : readOnly;
  }

  void setFilterFocusNode(FocusNode? node) {
    _filterFocusNode = node;
  }

  void setDefaultFilter(SamojectTableFilterType filter) {
    _defaultFilter = filter;
  }

  String formattedValueForType(dynamic value) {
    if (type is SamojectTableColumnTypeWithNumberFormat) {
      return type.applyFormat(value);
    }

    return value.toString();
  }

  String formattedValueForDisplay(dynamic value) {
    if (formatter != null) {
      return formatter!(value).toString();
    }

    return formattedValueForType(value);
  }

  String formattedValueForDisplayInEditing(dynamic value) {
    if (type is SamojectTableColumnTypeWithNumberFormat) {
      return value.toString().replaceFirst(
            '.',
            (type as SamojectTableColumnTypeWithNumberFormat)
                .numberFormat
                .symbols
                .DECIMAL_SEP,
          );
    }

    if (formatter != null) {
      final bool allowFormatting =
          readOnly || type.isSelect || type.isTime || type.isDate;

      if (applyFormatterInEditing && allowFormatting) {
        return formatter!(value).toString();
      }
    }

    return value.toString();
  }
}

class SamojectTableColumnRendererContext {
  final SamojectTableColumn column;

  final int rowIdx;

  final SamojectTableRow row;

  final SamojectTableCell cell;

  final SamojectTableGridStateManager stateManager;

  SamojectTableColumnRendererContext({
    required this.column,
    required this.rowIdx,
    required this.row,
    required this.cell,
    required this.stateManager,
  });
}

class SamojectTableColumnFooterRendererContext {
  final SamojectTableColumn column;

  final SamojectTableGridStateManager stateManager;

  SamojectTableColumnFooterRendererContext({
    required this.column,
    required this.stateManager,
  });
}

enum SamojectTableColumnTextAlign {
  start,
  left,
  center,
  right,
  end;

  TextAlign get value {
    switch (this) {
      case SamojectTableColumnTextAlign.start:
        return TextAlign.start;
      case SamojectTableColumnTextAlign.left:
        return TextAlign.left;
      case SamojectTableColumnTextAlign.center:
        return TextAlign.center;
      case SamojectTableColumnTextAlign.right:
        return TextAlign.right;
      case SamojectTableColumnTextAlign.end:
        return TextAlign.end;
    }
  }

  AlignmentGeometry get alignmentValue {
    switch (this) {
      case SamojectTableColumnTextAlign.start:
        return AlignmentDirectional.centerStart;
      case SamojectTableColumnTextAlign.left:
        return Alignment.centerLeft;
      case SamojectTableColumnTextAlign.center:
        return Alignment.center;
      case SamojectTableColumnTextAlign.right:
        return Alignment.centerRight;
      case SamojectTableColumnTextAlign.end:
        return AlignmentDirectional.centerEnd;
    }
  }

  bool get isStart => this == SamojectTableColumnTextAlign.start;

  bool get isLeft => this == SamojectTableColumnTextAlign.left;

  bool get isCenter => this == SamojectTableColumnTextAlign.center;

  bool get isRight => this == SamojectTableColumnTextAlign.right;

  bool get isEnd => this == SamojectTableColumnTextAlign.end;
}

enum SamojectTableColumnFrozen {
  none,
  start,
  end;

  bool get isNone {
    return this == SamojectTableColumnFrozen.none;
  }

  bool get isStart {
    return this == SamojectTableColumnFrozen.start;
  }

  bool get isEnd {
    return this == SamojectTableColumnFrozen.end;
  }

  bool get isFrozen {
    return this == SamojectTableColumnFrozen.start ||
        this == SamojectTableColumnFrozen.end;
  }
}

enum SamojectTableColumnSort {
  none,
  ascending,
  descending;

  bool get isNone {
    return this == SamojectTableColumnSort.none;
  }

  bool get isAscending {
    return this == SamojectTableColumnSort.ascending;
  }

  bool get isDescending {
    return this == SamojectTableColumnSort.descending;
  }
}
