import 'package:flutter/material.dart';

import '../helper/filter_helper.dart';
import '../manager/samoject_list_grid_state_manager.dart';
import '../samoject_list_grid.dart';
import 'samoject_list_cell.dart';
import 'samoject_list_column_group.dart';
import 'samoject_list_column_type.dart';
import 'samoject_list_row.dart';

typedef SamojectListColumnValueFormatter = String Function(dynamic value);

typedef SamojectListColumnRenderer = Widget Function(
    SamojectListColumnRendererContext rendererContext);

typedef SamojectListColumnFooterRenderer = Widget Function(
    SamojectListColumnFooterRendererContext context);

/// It dynamically determines whether the cells of the column are in the edit state.
///
/// Once the [readOnly] value is set,
/// whether the cell is editable cannot be changed during runtime,
/// but if this callback is implemented,
/// it can be determined whether the cell can be edited or not according to the state of the cell.
typedef SamojectListColumnCheckReadOnly = bool Function(
  SamojectListRow row,
  SamojectListCell cell,
);

class SamojectListColumn {
  /// A title to be displayed on the screen.
  /// If a titleSpan value is set, the title value is not displayed.
  String title;

  /// Specifies the field name of the row to be connected to the column.
  String field;

  /// Set the column type.
  ///
  /// Text, number, select, date, time, etc.
  /// ex) SamojectListColumnType.text(), SamojectListColumnType.number() ...
  SamojectListColumnType type;

  bool readOnly;

  double width;

  double minWidth;

  /// Customisable title padding.
  /// It takes precedence over defaultColumnTitlePadding in SamojectListGridConfiguration.
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
  /// It takes precedence over defaultCellPadding in SamojectListGridConfiguration.
  EdgeInsets? cellPadding;

  /// Text alignment in Cell. (Left, Right, Center)
  SamojectListColumnTextAlign textAlign;

  /// Text alignment in Title. (Left, Right, Center)
  SamojectListColumnTextAlign titleTextAlign;

  /// Freeze the column to the left and right.
  SamojectListColumnFrozen frozen;

  /// Set column sorting.
  SamojectListColumnSort sort;

  /// Formatter for display of cell values.
  SamojectListColumnValueFormatter? formatter;

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
  SamojectListColumnRenderer? renderer;

  /// A callback that returns a widget
  /// for expressing aggregate values at the bottom.
  ///
  /// ```dart
  /// footerRenderer: (rendererContext) {
  ///   return SamojectListAggregateColumnFooter(
  ///     rendererContext: rendererContext,
  ///     type: SamojectListAggregateColumnType.count,
  ///     format: 'Checked : #,###.###',
  ///     filter: (cell) => cell.row.checked == true,
  ///     alignment: Alignment.center,
  ///   );
  /// },
  /// ```
  SamojectListColumnFooterRenderer? footerRenderer;

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
  /// The [SamojectListGridConfiguration.columnContextIcon] icon appears.
  /// Tap this icon to bring up the context menu.
  ///
  /// If [enableDropToResize] is also activated,
  /// you can adjust the column width by dragging this icon.
  bool enableContextMenu;

  /// Display the right icon for drop to resize the column
  ///
  /// The [SamojectListGridConfiguration.columnResizeIcon] icon appears.
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

  SamojectListColumn({
    required this.title,
    required this.field,
    required this.type,
    this.readOnly = false,
    SamojectListColumnCheckReadOnly? checkReadOnly,
    this.width = SamojectListGridSettings.columnWidth,
    this.minWidth = SamojectListGridSettings.minColumnWidth,
    this.titlePadding,
    this.filterPadding,
    this.titleSpan,
    this.cellPadding,
    this.textAlign = SamojectListColumnTextAlign.start,
    this.titleTextAlign = SamojectListColumnTextAlign.start,
    this.frozen = SamojectListColumnFrozen.none,
    this.sort = SamojectListColumnSort.none,
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

  final SamojectListColumnCheckReadOnly? _checkReadOnly;

  Key get key => _key;

  bool get hasRenderer => renderer != null;

  bool get hasCheckReadOnly => _checkReadOnly != null;

  FocusNode? _filterFocusNode;

  FocusNode? get filterFocusNode {
    return _filterFocusNode;
  }

  SamojectListFilterType? _defaultFilter;

  SamojectListFilterType get defaultFilter =>
      _defaultFilter ?? const SamojectListFilterTypeContains();

  bool get isShowRightIcon =>
      enableContextMenu || enableDropToResize || !sort.isNone;

  SamojectListColumnGroup? group;

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
  /// Updated when the [SamojectListGridStateManager.updateVisibilityLayout] method is called.
  ///
  /// [startPosition] is used to determine the position to scroll left and right when moving the keyboard
  /// or whether the columns in the center area are displayed in the screen area.
  double startPosition = 0;

  bool checkReadOnly(SamojectListRow row, SamojectListCell cell) {
    return hasCheckReadOnly ? _checkReadOnly!(row, cell) : readOnly;
  }

  void setFilterFocusNode(FocusNode? node) {
    _filterFocusNode = node;
  }

  void setDefaultFilter(SamojectListFilterType filter) {
    _defaultFilter = filter;
  }

  String formattedValueForType(dynamic value) {
    if (type is SamojectListColumnTypeWithNumberFormat) {
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
    if (type is SamojectListColumnTypeWithNumberFormat) {
      return value.toString().replaceFirst(
            '.',
            (type as SamojectListColumnTypeWithNumberFormat)
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

class SamojectListColumnRendererContext {
  final SamojectListColumn column;

  final int rowIdx;

  final SamojectListRow row;

  final SamojectListCell cell;

  final SamojectListGridStateManager stateManager;

  SamojectListColumnRendererContext({
    required this.column,
    required this.rowIdx,
    required this.row,
    required this.cell,
    required this.stateManager,
  });
}

class SamojectListColumnFooterRendererContext {
  final SamojectListColumn column;

  final SamojectListGridStateManager stateManager;

  SamojectListColumnFooterRendererContext({
    required this.column,
    required this.stateManager,
  });
}

enum SamojectListColumnTextAlign {
  start,
  left,
  center,
  right,
  end;

  TextAlign get value {
    switch (this) {
      case SamojectListColumnTextAlign.start:
        return TextAlign.start;
      case SamojectListColumnTextAlign.left:
        return TextAlign.left;
      case SamojectListColumnTextAlign.center:
        return TextAlign.center;
      case SamojectListColumnTextAlign.right:
        return TextAlign.right;
      case SamojectListColumnTextAlign.end:
        return TextAlign.end;
    }
  }

  AlignmentGeometry get alignmentValue {
    switch (this) {
      case SamojectListColumnTextAlign.start:
        return AlignmentDirectional.centerStart;
      case SamojectListColumnTextAlign.left:
        return Alignment.centerLeft;
      case SamojectListColumnTextAlign.center:
        return Alignment.center;
      case SamojectListColumnTextAlign.right:
        return Alignment.centerRight;
      case SamojectListColumnTextAlign.end:
        return AlignmentDirectional.centerEnd;
    }
  }

  bool get isStart => this == SamojectListColumnTextAlign.start;

  bool get isLeft => this == SamojectListColumnTextAlign.left;

  bool get isCenter => this == SamojectListColumnTextAlign.center;

  bool get isRight => this == SamojectListColumnTextAlign.right;

  bool get isEnd => this == SamojectListColumnTextAlign.end;
}

enum SamojectListColumnFrozen {
  none,
  start,
  end;

  bool get isNone {
    return this == SamojectListColumnFrozen.none;
  }

  bool get isStart {
    return this == SamojectListColumnFrozen.start;
  }

  bool get isEnd {
    return this == SamojectListColumnFrozen.end;
  }

  bool get isFrozen {
    return this == SamojectListColumnFrozen.start ||
        this == SamojectListColumnFrozen.end;
  }
}

enum SamojectListColumnSort {
  none,
  ascending,
  descending;

  bool get isNone {
    return this == SamojectListColumnSort.none;
  }

  bool get isAscending {
    return this == SamojectListColumnSort.ascending;
  }

  bool get isDescending {
    return this == SamojectListColumnSort.descending;
  }
}
