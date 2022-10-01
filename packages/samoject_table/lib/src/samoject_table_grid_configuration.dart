import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'helper/filter_helper.dart';
import 'helper/samoject_table_size_helper.dart';
import 'model/samoject_table_column.dart';
import 'samoject_table_grid.dart';

class SamojectTableGridConfiguration {
  /// When you select a value in the pop-up grid, it moves down.
  final bool enableMoveDownAfterSelecting;

  /// Moves the current cell when focus reaches the left or right edge in the edit state.
  final bool enableMoveHorizontalInEditing;

  /// [SamojectTableEnterKeyAction.EditingAndMoveDown]
  /// It switches to the editing state, and moves down in the editing state.
  ///
  /// [SamojectTableEnterKeyAction.EditingAndMoveRight]
  /// It switches to the editing state, and moves to the right in the editing state.
  ///
  /// [SamojectTableEnterKeyAction.ToggleEditing]
  /// The editing state is toggled and cells are not moved.
  ///
  /// [SamojectTableEnterKeyAction.None]
  /// There is no action.
  final SamojectTableGridEnterKeyAction enterKeyAction;

  /// Set borders of [SamojectTableGrid] and columns, cells, and rows.
  final SamojectTableGridStyleConfig style;

  /// Customise scrollbars for desktop usage
  final SamojectTableGridScrollbarConfig scrollbar;

  /// Customise filter of columns
  final SamojectTableGridColumnFilterConfig columnFilter;

  /// Automatically adjust the column width or set the width change condition.
  final SamojectTableGridColumnSizeConfig columnSize;

  final SamojectTableGridLocaleText localeText;

  const SamojectTableGridConfiguration({
    this.enableMoveDownAfterSelecting = false,
    this.enableMoveHorizontalInEditing = false,
    this.enterKeyAction = SamojectTableGridEnterKeyAction.editingAndMoveDown,
    this.style = const SamojectTableGridStyleConfig(),
    this.scrollbar = const SamojectTableGridScrollbarConfig(),
    this.columnFilter = const SamojectTableGridColumnFilterConfig(),
    this.columnSize = const SamojectTableGridColumnSizeConfig(),
    this.localeText = const SamojectTableGridLocaleText(),
  });

  const SamojectTableGridConfiguration.dark({
    this.enableMoveDownAfterSelecting = false,
    this.enableMoveHorizontalInEditing = false,
    this.enterKeyAction = SamojectTableGridEnterKeyAction.editingAndMoveDown,
    this.style = const SamojectTableGridStyleConfig.dark(),
    this.scrollbar = const SamojectTableGridScrollbarConfig(),
    this.columnFilter = const SamojectTableGridColumnFilterConfig(),
    this.columnSize = const SamojectTableGridColumnSizeConfig(),
    this.localeText = const SamojectTableGridLocaleText(),
  });

  void updateLocale() {
    SamojectTableFilterTypeContains.name = localeText.filterContains;
    SamojectTableFilterTypeEquals.name = localeText.filterEquals;
    SamojectTableFilterTypeStartsWith.name = localeText.filterStartsWith;
    SamojectTableFilterTypeEndsWith.name = localeText.filterEndsWith;
    SamojectTableFilterTypeGreaterThan.name = localeText.filterGreaterThan;
    SamojectTableFilterTypeGreaterThanOrEqualTo.name =
        localeText.filterGreaterThanOrEqualTo;
    SamojectTableFilterTypeLessThan.name = localeText.filterLessThan;
    SamojectTableFilterTypeLessThanOrEqualTo.name =
        localeText.filterLessThanOrEqualTo;
  }

  /// Fired when setConfiguration is called in [SamojectTableGridStateManager]'s constructor.
  void applyColumnFilter(List<SamojectTableColumn>? refColumns) {
    if (refColumns == null || refColumns.isEmpty) {
      return;
    }

    var len = refColumns.length;

    for (var i = 0; i < len; i += 1) {
      var column = refColumns[i];

      column.setDefaultFilter(
        columnFilter.getDefaultColumnFilter(column),
      );
    }
  }

  SamojectTableGridConfiguration copyWith({
    bool? enableMoveDownAfterSelecting,
    bool? enableMoveHorizontalInEditing,
    SamojectTableGridEnterKeyAction? enterKeyAction,
    SamojectTableGridStyleConfig? style,
    SamojectTableGridScrollbarConfig? scrollbar,
    SamojectTableGridColumnFilterConfig? columnFilter,
    SamojectTableGridColumnSizeConfig? columnSize,
    SamojectTableGridLocaleText? localeText,
  }) {
    return SamojectTableGridConfiguration(
      enableMoveDownAfterSelecting:
          enableMoveDownAfterSelecting ?? this.enableMoveDownAfterSelecting,
      enableMoveHorizontalInEditing:
          enableMoveHorizontalInEditing ?? this.enableMoveHorizontalInEditing,
      enterKeyAction: enterKeyAction ?? this.enterKeyAction,
      style: style ?? this.style,
      scrollbar: scrollbar ?? this.scrollbar,
      columnFilter: columnFilter ?? this.columnFilter,
      columnSize: columnSize ?? this.columnSize,
      localeText: localeText ?? this.localeText,
    );
  }
}

class SamojectTableGridStyleConfig {
  const SamojectTableGridStyleConfig({
    this.enableGridBorderShadow = false,
    this.enableColumnBorderVertical = true,
    this.enableColumnBorderHorizontal = true,
    this.enableCellBorderVertical = true,
    this.enableCellBorderHorizontal = true,
    this.enableRowColorAnimation = false,
    this.gridBackgroundColor = Colors.white,
    this.rowColor = Colors.white,
    this.oddRowColor,
    this.evenRowColor,
    this.activatedColor = const Color(0xFFDCF5FF),
    this.checkedColor = const Color(0x11757575),
    this.cellColorInEditState = Colors.white,
    this.cellColorInReadOnlyState = const Color(0xFFDBDBDC),
    this.dragTargetColumnColor = const Color(0xFFDCF5FF),
    this.iconColor = Colors.black26,
    this.disabledIconColor = Colors.black12,
    this.menuBackgroundColor = Colors.white,
    this.gridBorderColor = const Color(0xFFA1A5AE),
    this.borderColor = const Color(0xFFDDE2EB),
    this.activatedBorderColor = Colors.lightBlue,
    this.inactivatedBorderColor = const Color(0xFFC4C7CC),
    this.iconSize = 18,
    this.rowHeight = SamojectTableGridSettings.rowHeight,
    this.columnHeight = SamojectTableGridSettings.rowHeight,
    this.columnFilterHeight = SamojectTableGridSettings.rowHeight,
    this.defaultColumnTitlePadding =
        SamojectTableGridSettings.columnTitlePadding,
    this.defaultColumnFilterPadding =
        SamojectTableGridSettings.columnFilterPadding,
    this.defaultCellPadding = SamojectTableGridSettings.cellPadding,
    this.columnTextStyle = const TextStyle(
      color: Colors.black,
      decoration: TextDecoration.none,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    this.cellTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    this.columnContextIcon = Icons.dehaze,
    this.columnResizeIcon = Icons.code_sharp,
    this.columnAscendingIcon,
    this.columnDescendingIcon,
    this.gridBorderRadius = BorderRadius.zero,
    this.gridPopupBorderRadius = BorderRadius.zero,
  });

  const SamojectTableGridStyleConfig.dark({
    this.enableGridBorderShadow = false,
    this.enableColumnBorderVertical = true,
    this.enableColumnBorderHorizontal = true,
    this.enableCellBorderVertical = true,
    this.enableCellBorderHorizontal = true,
    this.enableRowColorAnimation = false,
    this.gridBackgroundColor = const Color(0xFF111111),
    this.rowColor = const Color(0xFF111111),
    this.oddRowColor,
    this.evenRowColor,
    this.activatedColor = const Color(0xFF313131),
    this.checkedColor = const Color(0x11202020),
    this.cellColorInEditState = const Color(0xFF666666),
    this.cellColorInReadOnlyState = const Color(0xFF222222),
    this.dragTargetColumnColor = const Color(0xFF313131),
    this.iconColor = Colors.white38,
    this.disabledIconColor = Colors.white12,
    this.menuBackgroundColor = const Color(0xFF414141),
    this.gridBorderColor = const Color(0xFF666666),
    this.borderColor = const Color(0xFF222222),
    this.activatedBorderColor = const Color(0xFFFFFFFF),
    this.inactivatedBorderColor = const Color(0xFF666666),
    this.iconSize = 18,
    this.rowHeight = SamojectTableGridSettings.rowHeight,
    this.columnHeight = SamojectTableGridSettings.rowHeight,
    this.columnFilterHeight = SamojectTableGridSettings.rowHeight,
    this.defaultColumnTitlePadding =
        SamojectTableGridSettings.columnTitlePadding,
    this.defaultColumnFilterPadding =
        SamojectTableGridSettings.columnFilterPadding,
    this.defaultCellPadding = SamojectTableGridSettings.cellPadding,
    this.columnTextStyle = const TextStyle(
      color: Colors.white,
      decoration: TextDecoration.none,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    this.cellTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    this.columnContextIcon = Icons.dehaze,
    this.columnResizeIcon = Icons.code_sharp,
    this.columnAscendingIcon,
    this.columnDescendingIcon,
    this.gridBorderRadius = BorderRadius.zero,
    this.gridPopupBorderRadius = BorderRadius.zero,
  });

  /// Enable borderShadow in [SamojectTableGrid].
  final bool enableGridBorderShadow;

  /// Enable the vertical border of [SamojectTableColumn] and [SamojectTableColumnGroup].
  final bool enableColumnBorderVertical;

  /// Enable the horizontal border of [SamojectTableColumn] and [SamojectTableColumnGroup].
  final bool enableColumnBorderHorizontal;

  /// Enable the vertical border of [SamojectTableCell].
  final bool enableCellBorderVertical;

  /// Enable the horizontal border of [SamojectTableCell].
  final bool enableCellBorderHorizontal;

  /// Animation of background color transition of rows,
  /// such as when the current row or rows are dragged.
  final bool enableRowColorAnimation;

  final Color gridBackgroundColor;

  /// Default row background color
  ///
  /// If [SamojectTableGrid.rowColorCallback] is set, rowColorCallback takes precedence.
  final Color rowColor;

  /// Background color for odd rows
  ///
  /// The first row, which is number 0, is treated as an odd row.
  /// If [SamojectTableGrid.rowColorCallback] is set, rowColorCallback takes precedence.
  final Color? oddRowColor;

  /// Background color for even rows
  ///
  /// The row with number 1 is treated as an even row.
  /// If [SamojectTableGrid.rowColorCallback] is set, rowColorCallback takes precedence.
  final Color? evenRowColor;

  /// Activated Color. (Current or Selected row, cell)
  final Color activatedColor;

  /// Checked Color. (Checked rows)
  final Color checkedColor;

  /// Cell color in edit state. (only current cell)
  final Color cellColorInEditState;

  /// Cell color in read-only state
  final Color cellColorInReadOnlyState;

  /// The background color of the column to be dragged.
  /// When moving a column by dragging it.
  final Color dragTargetColumnColor;

  /// Icon color. (column menu, cell of popup type, pagination plugin)
  final Color iconColor;

  /// Disabled icon color. (pagination plugin)
  final Color disabledIconColor;

  /// BackgroundColor of Popup menu. (column menu)
  final Color menuBackgroundColor;

  /// Set the border color of [SamojectTableGrid].
  final Color gridBorderColor;

  /// Set the border color of the widgets inside [SamojectTableGrid].
  ///
  /// Border color is set
  /// for [SamojectTableColumn], [SamojectTableColumnGroup], [SamojectTableCell], [SamojectTableRow], etc.
  final Color borderColor;

  /// Border color set when widgets such as [SamojectTableRow] and [SamojectTableCell]
  /// receive focus or are currently selected.
  final Color activatedBorderColor;

  /// Border color set when widgets such as [SamojectTableRow] and [SamojectTableCell] lose focus.
  final Color inactivatedBorderColor;

  /// Icon size. (column menu, cell of popup type)
  final double iconSize;

  /// Height of a row.
  final double rowHeight;

  /// Height of column.
  final double columnHeight;

  /// Height of column filter.
  final double columnFilterHeight;

  /// Customise column title padding
  /// If there is no titlePadding of SamojectTableColumn,
  /// it is the title padding of the default column.
  final EdgeInsets defaultColumnTitlePadding;

  final EdgeInsets defaultColumnFilterPadding;

  /// Customise cell padding
  /// If there is no cellPadding of SamojectTableColumn,
  /// it is the padding value of cell.
  final EdgeInsets defaultCellPadding;

  /// Column - text style
  final TextStyle columnTextStyle;

  /// Cell - text style
  final TextStyle cellTextStyle;

  /// Icon that can open a pop-up menu next to the column title
  /// when [enableContextMenu] of [SamojectTableColumn] is true.
  final IconData columnContextIcon;

  /// If enableContextMenu of SamojectTableColumn is false and enableDropToResize is true,
  /// only the width of the column can be adjusted.
  final IconData columnResizeIcon;

  /// Ascending icon when sorting a column.
  ///
  /// If no value is specified, the default icon is set.
  final Icon? columnAscendingIcon;

  /// Descending icon when sorting a column.
  ///
  /// If no value is specified, the default icon is set.
  final Icon? columnDescendingIcon;

  /// Apply the border radius of [SamojectTableGrid].
  final BorderRadiusGeometry gridBorderRadius;

  /// Apply border radius to popup opened inside [SamojectTableGrid].
  final BorderRadiusGeometry gridPopupBorderRadius;

  SamojectTableGridStyleConfig copyWith({
    bool? enableGridBorderShadow,
    bool? enableColumnBorderVertical,
    bool? enableColumnBorderHorizontal,
    bool? enableCellBorderVertical,
    bool? enableCellBorderHorizontal,
    bool? enableRowColorAnimation,
    Color? gridBackgroundColor,
    Color? rowColor,
    SamojectTableOptional<Color?>? oddRowColor,
    SamojectTableOptional<Color?>? evenRowColor,
    Color? activatedColor,
    Color? checkedColor,
    Color? cellColorInEditState,
    Color? cellColorInReadOnlyState,
    Color? dragTargetColumnColor,
    Color? iconColor,
    Color? disabledIconColor,
    Color? menuBackgroundColor,
    Color? gridBorderColor,
    Color? borderColor,
    Color? activatedBorderColor,
    Color? inactivatedBorderColor,
    double? iconSize,
    double? rowHeight,
    double? columnHeight,
    double? columnFilterHeight,
    EdgeInsets? defaultColumnTitlePadding,
    EdgeInsets? defaultColumnFilterPadding,
    EdgeInsets? defaultCellPadding,
    TextStyle? columnTextStyle,
    TextStyle? cellTextStyle,
    IconData? columnContextIcon,
    IconData? columnResizeIcon,
    SamojectTableOptional<Icon?>? columnAscendingIcon,
    SamojectTableOptional<Icon?>? columnDescendingIcon,
    BorderRadiusGeometry? gridBorderRadius,
    BorderRadiusGeometry? gridPopupBorderRadius,
  }) {
    return SamojectTableGridStyleConfig(
      enableGridBorderShadow:
          enableGridBorderShadow ?? this.enableGridBorderShadow,
      enableColumnBorderVertical:
          enableColumnBorderVertical ?? this.enableColumnBorderVertical,
      enableColumnBorderHorizontal:
          enableColumnBorderHorizontal ?? this.enableColumnBorderHorizontal,
      enableCellBorderVertical:
          enableCellBorderVertical ?? this.enableCellBorderVertical,
      enableCellBorderHorizontal:
          enableCellBorderHorizontal ?? this.enableCellBorderHorizontal,
      enableRowColorAnimation:
          enableRowColorAnimation ?? this.enableRowColorAnimation,
      gridBackgroundColor: gridBackgroundColor ?? this.gridBackgroundColor,
      rowColor: rowColor ?? this.rowColor,
      oddRowColor: oddRowColor == null ? this.oddRowColor : oddRowColor.value,
      evenRowColor:
          evenRowColor == null ? this.evenRowColor : evenRowColor.value,
      activatedColor: activatedColor ?? this.activatedColor,
      checkedColor: checkedColor ?? this.checkedColor,
      cellColorInEditState: cellColorInEditState ?? this.cellColorInEditState,
      cellColorInReadOnlyState:
          cellColorInReadOnlyState ?? this.cellColorInReadOnlyState,
      dragTargetColumnColor:
          dragTargetColumnColor ?? this.dragTargetColumnColor,
      iconColor: iconColor ?? this.iconColor,
      disabledIconColor: disabledIconColor ?? this.disabledIconColor,
      menuBackgroundColor: menuBackgroundColor ?? this.menuBackgroundColor,
      gridBorderColor: gridBorderColor ?? this.gridBorderColor,
      borderColor: borderColor ?? this.borderColor,
      activatedBorderColor: activatedBorderColor ?? this.activatedBorderColor,
      inactivatedBorderColor:
          inactivatedBorderColor ?? this.inactivatedBorderColor,
      iconSize: iconSize ?? this.iconSize,
      rowHeight: rowHeight ?? this.rowHeight,
      columnHeight: columnHeight ?? this.columnHeight,
      columnFilterHeight: columnFilterHeight ?? this.columnFilterHeight,
      defaultColumnTitlePadding:
          defaultColumnTitlePadding ?? this.defaultColumnTitlePadding,
      defaultColumnFilterPadding:
          defaultColumnFilterPadding ?? this.defaultColumnFilterPadding,
      defaultCellPadding: defaultCellPadding ?? this.defaultCellPadding,
      columnTextStyle: columnTextStyle ?? this.columnTextStyle,
      cellTextStyle: cellTextStyle ?? this.cellTextStyle,
      columnContextIcon: columnContextIcon ?? this.columnContextIcon,
      columnResizeIcon: columnResizeIcon ?? this.columnResizeIcon,
      columnAscendingIcon: columnAscendingIcon == null
          ? this.columnAscendingIcon
          : columnAscendingIcon.value,
      columnDescendingIcon: columnDescendingIcon == null
          ? this.columnDescendingIcon
          : columnDescendingIcon.value,
      gridBorderRadius: gridBorderRadius ?? this.gridBorderRadius,
      gridPopupBorderRadius:
          gridPopupBorderRadius ?? this.gridPopupBorderRadius,
    );
  }
}

/// Allows to customise scrollbars "look and feel"
/// The general feature is making vertical scrollbar draggable and therefore more useful
/// for desktop systems. Set [draggableScrollbar] to true to achieve this behavior. Also
/// changing [isAlwaysShown] to true is recommended for more usability at desktops.
class SamojectTableGridScrollbarConfig {
  const SamojectTableGridScrollbarConfig({
    this.draggableScrollbar = true,
    this.isAlwaysShown = false,
    this.scrollbarRadius = CupertinoScrollbar.defaultRadius,
    this.scrollbarRadiusWhileDragging =
        CupertinoScrollbar.defaultRadiusWhileDragging,
    this.scrollbarThickness = CupertinoScrollbar.defaultThickness,
    this.scrollbarThicknessWhileDragging =
        CupertinoScrollbar.defaultThicknessWhileDragging,
  });

  final bool draggableScrollbar;
  final bool isAlwaysShown;
  final double scrollbarThickness;
  final double scrollbarThicknessWhileDragging;
  final Radius scrollbarRadius;
  final Radius scrollbarRadiusWhileDragging;
}

typedef SamojectTableGridColumnFilterResolver = Function<T>();

typedef SamojectTableGridResolveDefaultColumnFilter = SamojectTableFilterType
    Function(
  SamojectTableColumn column,
  SamojectTableGridColumnFilterResolver resolver,
);

class SamojectTableGridColumnFilterConfig {
  /// # Set the filter information of the column.
  ///
  /// **Return the value returned by [resolveDefaultColumnFilter] through the resolver function.**
  /// **Prevents errors returning filter that are not in the [filters] list.**
  ///
  /// The value of returning from resolveDefaultColumnFilter
  /// becomes the condition of TextField below the column or
  /// is set as the default filter when calling the column popup.
  ///
  /// ```dart
  ///
  /// var filterConfig = SamojectTableColumnFilterConfig(
  ///   filters: const [
  ///     ...FilterHelper.defaultFilters,
  ///     // custom filter
  ///     ClassYouImplemented(),
  ///   ],
  ///   resolveDefaultColumnFilter: (column, resolver) {
  ///     if (column.field == 'text') {
  ///       return resolver<SamojectTableFilterTypeContains>();
  ///     } else if (column.field == 'number') {
  ///       return resolver<SamojectTableFilterTypeGreaterThan>();
  ///     } else if (column.field == 'date') {
  ///       return resolver<SamojectTableFilterTypeLessThan>();
  ///     } else if (column.field == 'select') {
  ///       return resolver<ClassYouImplemented>();
  ///     }
  ///
  ///     return resolver<SamojectTableFilterTypeContains>();
  ///   },
  /// );
  ///
  /// class ClassYouImplemented implements SamojectTableFilterType {
  ///   String get title => 'Custom contains';
  ///
  ///   get compare => ({
  ///         String base,
  ///         String search,
  ///         SamojectTableColumn column,
  ///       }) {
  ///         var keys = search.split(',').map((e) => e.toUpperCase()).toList();
  ///
  ///         return keys.contains(base.toUpperCase());
  ///       };
  ///
  ///   const ClassYouImplemented();
  /// }
  /// ```
  const SamojectTableGridColumnFilterConfig({
    List<SamojectTableFilterType>? filters,
    SamojectTableGridResolveDefaultColumnFilter? resolveDefaultColumnFilter,
    int? debounceMilliseconds,
  })  : _userFilters = filters,
        _userResolveDefaultColumnFilter = resolveDefaultColumnFilter,
        _debounceMilliseconds = debounceMilliseconds == null
            ? SamojectTableGridSettings.debounceMillisecondsForColumnFilter
            : debounceMilliseconds < 0
                ? 0
                : debounceMilliseconds;

  final List<SamojectTableFilterType>? _userFilters;

  final SamojectTableGridResolveDefaultColumnFilter?
      _userResolveDefaultColumnFilter;

  final int _debounceMilliseconds;

  bool get hasUserFilter => _userFilters != null && _userFilters!.isNotEmpty;

  List<SamojectTableFilterType> get filters =>
      hasUserFilter ? _userFilters! : FilterHelper.defaultFilters;

  int get debounceMilliseconds => _debounceMilliseconds;

  SamojectTableFilterType resolver<T>() {
    return filters.firstWhereOrNull(
          (element) => element.runtimeType == T,
        ) ??
        filters.first;
  }

  SamojectTableFilterType getDefaultColumnFilter(SamojectTableColumn column) {
    if (_userResolveDefaultColumnFilter == null) {
      return filters.first;
    }

    var resolvedFilter = _userResolveDefaultColumnFilter!(column, resolver);

    assert(filters.contains(resolvedFilter));

    return resolvedFilter;
  }
}

/// Automatically change the column width or set the mode when changing the width.
class SamojectTableGridColumnSizeConfig {
  const SamojectTableGridColumnSizeConfig({
    this.autoSizeMode = SamojectTableAutoSizeMode.none,
    this.resizeMode = SamojectTableResizeMode.normal,
    this.restoreAutoSizeAfterHideColumn = true,
    this.restoreAutoSizeAfterFrozenColumn = true,
    this.restoreAutoSizeAfterMoveColumn = true,
    this.restoreAutoSizeAfterInsertColumn = true,
    this.restoreAutoSizeAfterRemoveColumn = true,
  });

  /// Automatically change the column width.
  final SamojectTableAutoSizeMode autoSizeMode;

  /// This is the condition for changing the width of the column.
  final SamojectTableResizeMode resizeMode;

  /// [SamojectTableColumn.hide] Whether to apply autoSizeMode after state change.
  /// If false, autoSizeMode is not applied after the state change
  /// and the state after the change is maintained.
  final bool restoreAutoSizeAfterHideColumn;

  /// [SamojectTableColumn.frozen] Whether to apply autoSizeMode after state change.
  /// If false, autoSizeMode is not applied after the state change
  /// and the state after the change is maintained.
  final bool restoreAutoSizeAfterFrozenColumn;

  /// Whether to apply autoSizeMode after [SamojectTableColumn] is moved.
  /// If false, do not apply autoSizeMode after moving
  /// and keep the state after change.
  final bool restoreAutoSizeAfterMoveColumn;

  /// Whether to apply autoSizeMode after adding [SamojectTableColumn].
  /// If false, autoSizeMode is not applied after column addition
  /// and the state after change is maintained.
  final bool restoreAutoSizeAfterInsertColumn;

  /// [SamojectTableColumn] Whether to apply autoSizeMode after deletion.
  /// If false, autoSizeMode is not applied after deletion
  /// and the state after change is maintained.
  final bool restoreAutoSizeAfterRemoveColumn;

  SamojectTableGridColumnSizeConfig copyWith({
    SamojectTableAutoSizeMode? autoSizeMode,
    SamojectTableResizeMode? resizeMode,
    bool? restoreAutoSizeAfterHideColumn,
    bool? restoreAutoSizeAfterFrozenColumn,
    bool? restoreAutoSizeAfterMoveColumn,
    bool? restoreAutoSizeAfterInsertColumn,
    bool? restoreAutoSizeAfterRemoveColumn,
  }) {
    return SamojectTableGridColumnSizeConfig(
      autoSizeMode: autoSizeMode ?? this.autoSizeMode,
      resizeMode: resizeMode ?? this.resizeMode,
      restoreAutoSizeAfterHideColumn:
          restoreAutoSizeAfterHideColumn ?? this.restoreAutoSizeAfterHideColumn,
      restoreAutoSizeAfterFrozenColumn: restoreAutoSizeAfterFrozenColumn ??
          this.restoreAutoSizeAfterFrozenColumn,
      restoreAutoSizeAfterMoveColumn:
          restoreAutoSizeAfterMoveColumn ?? this.restoreAutoSizeAfterMoveColumn,
      restoreAutoSizeAfterInsertColumn: restoreAutoSizeAfterInsertColumn ??
          this.restoreAutoSizeAfterInsertColumn,
      restoreAutoSizeAfterRemoveColumn: restoreAutoSizeAfterRemoveColumn ??
          this.restoreAutoSizeAfterRemoveColumn,
    );
  }

  @override
  bool operator ==(covariant SamojectTableGridColumnSizeConfig other) {
    return autoSizeMode == other.autoSizeMode &&
        resizeMode == other.resizeMode &&
        restoreAutoSizeAfterHideColumn ==
            other.restoreAutoSizeAfterHideColumn &&
        restoreAutoSizeAfterFrozenColumn ==
            other.restoreAutoSizeAfterFrozenColumn &&
        restoreAutoSizeAfterMoveColumn ==
            other.restoreAutoSizeAfterMoveColumn &&
        restoreAutoSizeAfterInsertColumn ==
            other.restoreAutoSizeAfterInsertColumn &&
        restoreAutoSizeAfterRemoveColumn ==
            other.restoreAutoSizeAfterRemoveColumn;
  }

  @override
  int get hashCode => Object.hash(
        autoSizeMode,
        resizeMode,
        restoreAutoSizeAfterHideColumn,
        restoreAutoSizeAfterFrozenColumn,
        restoreAutoSizeAfterMoveColumn,
        restoreAutoSizeAfterInsertColumn,
        restoreAutoSizeAfterRemoveColumn,
      );
}

class SamojectTableGridLocaleText {
  // Column menu
  final String unfreezeColumn;
  final String freezeColumnToStart;
  final String freezeColumnToEnd;
  final String autoFitColumn;
  final String hideColumn;
  final String setColumns;
  final String setFilter;
  final String resetFilter;

  // SetColumns popup
  final String setColumnsTitle;

  // Filter popup
  final String filterColumn;
  final String filterType;
  final String filterValue;
  final String filterAllColumns;
  final String filterContains;
  final String filterEquals;
  final String filterStartsWith;
  final String filterEndsWith;
  final String filterGreaterThan;
  final String filterGreaterThanOrEqualTo;
  final String filterLessThan;
  final String filterLessThanOrEqualTo;

  // Date column popup
  final String sunday;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;

  // Time column popup
  final String hour;
  final String minute;

  // Common
  final String loadingText;

  const SamojectTableGridLocaleText({
    // Column menu
    this.unfreezeColumn = 'Unfreeze',
    this.freezeColumnToStart = 'Freeze to start',
    this.freezeColumnToEnd = 'Freeze to end',
    this.autoFitColumn = 'Auto fit',
    this.hideColumn = 'Hide column',
    this.setColumns = 'Set columns',
    this.setFilter = 'Set filter',
    this.resetFilter = 'Reset filter',
    // SetColumns popup
    this.setColumnsTitle = 'Column title',
    // Filter popup
    this.filterColumn = 'Column',
    this.filterType = 'Type',
    this.filterValue = 'Value',
    this.filterAllColumns = 'All columns',
    this.filterContains = 'Contains',
    this.filterEquals = 'Equals',
    this.filterStartsWith = 'Starts with',
    this.filterEndsWith = 'Ends with',
    this.filterGreaterThan = 'Greater than',
    this.filterGreaterThanOrEqualTo = 'Greater than or equal to',
    this.filterLessThan = 'Less than',
    this.filterLessThanOrEqualTo = 'Less than or equal to',
    // Date popup
    this.sunday = 'Su',
    this.monday = 'Mo',
    this.tuesday = 'Tu',
    this.wednesday = 'We',
    this.thursday = 'Th',
    this.friday = 'Fr',
    this.saturday = 'Sa',
    // Time column popup
    this.hour = 'Hour',
    this.minute = 'Minute',
    // Common
    this.loadingText = 'Loading',
  });

  const SamojectTableGridLocaleText.china({
    // Column menu
    this.unfreezeColumn = '解冻列',
    this.freezeColumnToStart = '冻结列至起点',
    this.freezeColumnToEnd = '冻结列至终点',
    this.autoFitColumn = '自动列宽',
    this.hideColumn = '隐藏列',
    this.setColumns = '设置列',
    this.setFilter = '设置过滤器',
    this.resetFilter = '重置过滤器',
    // SetColumns popup
    this.setColumnsTitle = '列标题',
    // Filter popup
    this.filterColumn = '列',
    this.filterType = '类型',
    this.filterValue = '值',
    this.filterAllColumns = '全部列',
    this.filterContains = '包含',
    this.filterEquals = '等于',
    this.filterStartsWith = '开始于',
    this.filterEndsWith = '结束于',
    this.filterGreaterThan = '大于',
    this.filterGreaterThanOrEqualTo = '大于等于',
    this.filterLessThan = '小于',
    this.filterLessThanOrEqualTo = '小于等于',
    // Date popup
    this.sunday = '日',
    this.monday = '一',
    this.tuesday = '四',
    this.wednesday = '三',
    this.thursday = '二',
    this.friday = '五',
    this.saturday = '六',
    // Time column popup
    this.hour = '时',
    this.minute = '分',
    // Common
    this.loadingText = '加载中',
  });

  const SamojectTableGridLocaleText.korean({
    // Column menu
    this.unfreezeColumn = '고정 해제',
    this.freezeColumnToStart = '시작에 고정',
    this.freezeColumnToEnd = '끝에 고정',
    this.autoFitColumn = '넓이 자동 조정',
    this.hideColumn = '컬럼 숨기기',
    this.setColumns = '컬럼 설정',
    this.setFilter = '필터 설정',
    this.resetFilter = '필터 초기화',
    // SetColumns popup
    this.setColumnsTitle = '컬럼명',
    // Filter popup
    this.filterColumn = '컬럼',
    this.filterType = '종류',
    this.filterValue = '값',
    this.filterAllColumns = '전체 컬럼',
    this.filterContains = '포함',
    this.filterEquals = '일치',
    this.filterStartsWith = '~로 시작',
    this.filterEndsWith = '~로 끝',
    this.filterGreaterThan = '~보다 큰',
    this.filterGreaterThanOrEqualTo = '~보다 크거나 같은',
    this.filterLessThan = '~보다 작은',
    this.filterLessThanOrEqualTo = '~보다 작거나 같은',
    // Date popup
    this.sunday = '일',
    this.monday = '월',
    this.tuesday = '화',
    this.wednesday = '수',
    this.thursday = '목',
    this.friday = '금',
    this.saturday = '토',
    // Time column popup
    this.hour = '시',
    this.minute = '분',
    // Common
    this.loadingText = '로딩중',
  });

  const SamojectTableGridLocaleText.russian({
    // Column menu
    this.unfreezeColumn = 'Открепить',
    this.freezeColumnToStart = 'Закрепить в начале',
    this.freezeColumnToEnd = 'Закрепить в конце',
    this.autoFitColumn = 'Автоматический размер',
    this.hideColumn = 'Скрыть колонку',
    this.setColumns = 'Выбрать колонки',
    this.setFilter = 'Установить фильтр',
    this.resetFilter = 'Сбросить фильтр',
    // SetColumns popup
    this.setColumnsTitle = 'Column title',
    // Filter popup
    this.filterColumn = 'Колонка',
    this.filterType = 'Тип',
    this.filterValue = 'Значение',
    this.filterAllColumns = 'Все колонки',
    this.filterContains = 'Содержит',
    this.filterEquals = 'Равно',
    this.filterStartsWith = 'Начинается с',
    this.filterEndsWith = 'Заканчивается на',
    this.filterGreaterThan = 'Больше чем',
    this.filterGreaterThanOrEqualTo = 'Больше или равно',
    this.filterLessThan = 'Меньше чем',
    this.filterLessThanOrEqualTo = 'Меньше или равно',
    // Date popup
    this.sunday = 'Вск',
    this.monday = 'Пн',
    this.tuesday = 'Вт',
    this.wednesday = 'Ср',
    this.thursday = 'Чт',
    this.friday = 'Пт',
    this.saturday = 'Сб',
    // Time column popup
    this.hour = 'Часы',
    this.minute = 'Минуты',
    // Common
    this.loadingText = 'Загрузка',
  });

  const SamojectTableGridLocaleText.czech({
    // Column menu
    this.unfreezeColumn = 'Uvolnit',
    this.freezeColumnToStart = 'Ukotvit na začátek',
    this.freezeColumnToEnd = 'Ukotvit na konec',
    this.autoFitColumn = 'Autom. přizpůsobit',
    this.hideColumn = 'Skrýt sloupec',
    this.setColumns = 'Upravit sloupce',
    this.setFilter = 'Nastavit filtr',
    this.resetFilter = 'Resetovat filtr',
    // SetColumns popup
    this.setColumnsTitle = 'Název sloupce',
    // Filter popup
    this.filterColumn = 'Sloupec',
    this.filterType = 'Typ',
    this.filterValue = 'Hodnota',
    this.filterAllColumns = 'Všechny sloupce',
    this.filterContains = 'Obsahuje',
    this.filterEquals = 'Rovná se',
    this.filterStartsWith = 'Začíná na',
    this.filterEndsWith = 'Končí na',
    this.filterGreaterThan = 'Větší než',
    this.filterGreaterThanOrEqualTo = 'Větší než nebo rovno',
    this.filterLessThan = 'Menší než',
    this.filterLessThanOrEqualTo = 'Menší než nebo rovno',
    // Date popup
    this.sunday = 'Ne',
    this.monday = 'Po',
    this.tuesday = 'Út',
    this.wednesday = 'St',
    this.thursday = 'Čt',
    this.friday = 'Pá',
    this.saturday = 'So',
    // Time column popup
    this.hour = 'Hodina',
    this.minute = 'Minuta',
    // Common
    this.loadingText = 'Načítání',
  });

  const SamojectTableGridLocaleText.brazilianPortuguese({
    // Column menu
    this.unfreezeColumn = 'Descongelar',
    this.freezeColumnToStart = 'Congelar ao início',
    this.freezeColumnToEnd = 'Congelar ao final',
    this.autoFitColumn = 'Auto Ajustar',
    this.hideColumn = 'Esconder coluna',
    this.setColumns = 'Definir colunas',
    this.setFilter = 'Definir fitros',
    this.resetFilter = 'Limpar filtros',
    // SetColumns popup
    this.setColumnsTitle = 'Título da coluna',
    // Filter popup
    this.filterColumn = 'Coluna',
    this.filterType = 'Tipo',
    this.filterValue = 'Valor',
    this.filterAllColumns = 'Todas as colunas',
    this.filterContains = 'Contenha',
    this.filterEquals = 'Igual',
    this.filterStartsWith = 'Inicia com',
    this.filterEndsWith = 'Termina com',
    this.filterGreaterThan = 'Maior que',
    this.filterGreaterThanOrEqualTo = 'Maior ou igual que',
    this.filterLessThan = 'Menor que',
    this.filterLessThanOrEqualTo = 'Menor ou igual que',
    // Date popup
    this.sunday = 'Dom',
    this.monday = 'Seg',
    this.tuesday = 'Ter',
    this.wednesday = 'Qua',
    this.thursday = 'Qui',
    this.friday = 'Sex',
    this.saturday = 'Sab',
    // Time column popup
    this.hour = 'Hora',
    this.minute = 'Minuto',
    // Common
    this.loadingText = 'Carregando',
  });

  const SamojectTableGridLocaleText.spanish({
    // Column menu
    this.unfreezeColumn = 'Descongelar',
    this.freezeColumnToStart = 'Inmovilizar al principio',
    this.freezeColumnToEnd = 'Inmovilizar al final',
    this.autoFitColumn = 'Autoajuste',
    this.hideColumn = 'Ocultar columna',
    this.setColumns = 'Eligir columnas',
    this.setFilter = 'Definir fitros',
    this.resetFilter = 'Limpiar filtros',
    // SetColumns popup
    this.setColumnsTitle = 'Título de la columna',
    // Filter popup
    this.filterColumn = 'Columna',
    this.filterType = 'Tipo',
    this.filterValue = 'Valor',
    this.filterAllColumns = 'Todas las columnas',
    this.filterContains = 'Contenga',
    this.filterEquals = 'Igual',
    this.filterStartsWith = 'Empieza con',
    this.filterEndsWith = 'Termina con',
    this.filterGreaterThan = 'Más grande que',
    this.filterGreaterThanOrEqualTo = 'Más grande o igual que',
    this.filterLessThan = 'Más pequeño que',
    this.filterLessThanOrEqualTo = 'Más pequeño o igual que',
    // Date popup
    this.sunday = 'Dom',
    this.monday = 'Lu',
    this.tuesday = 'Ma',
    this.wednesday = 'Mi',
    this.thursday = 'Ju',
    this.friday = 'Vi',
    this.saturday = 'Sa',
    // Time column popup
    this.hour = 'Hora',
    this.minute = 'Minuto',
    // Common
    this.loadingText = 'Cargando',
  });

  const SamojectTableGridLocaleText.persian({
    // Column menu
    this.unfreezeColumn = 'جدا کردن',
    this.freezeColumnToStart = 'چسباندن به ابتدا',
    this.freezeColumnToEnd = 'چسباندن به انتها',
    this.autoFitColumn = 'عرض خودکار',
    this.hideColumn = 'مخفی کردن ستون',
    this.setColumns = 'تنظیم ستون ها',
    this.setFilter = 'اعمال فیلتر',
    this.resetFilter = 'ریست فیلتر',
    // SetColumns popup
    this.setColumnsTitle = 'عنوان ستون',
    // Filter popup
    this.filterColumn = 'ستون',
    this.filterType = 'نوع',
    this.filterValue = 'مقدار',
    this.filterAllColumns = 'تمام ستون ها',
    this.filterContains = 'شامل',
    this.filterEquals = 'برابر',
    this.filterStartsWith = 'شروع با',
    this.filterEndsWith = 'خاتمه با',
    this.filterGreaterThan = 'بزرگتر از',
    this.filterGreaterThanOrEqualTo = 'بزرگتر مساوی از',
    this.filterLessThan = 'کمتر از',
    this.filterLessThanOrEqualTo = 'کمتر مساوی از',
    // Date popup
    this.sunday = 'ی',
    this.monday = 'د',
    this.tuesday = 'س',
    this.wednesday = 'چ',
    this.thursday = 'پ',
    this.friday = 'ج',
    this.saturday = 'ش',
    // Time column popup
    this.hour = 'ساعت',
    this.minute = 'دقیقه',
    // Common
    this.loadingText = 'در حال بارگیری',
  });

  const SamojectTableGridLocaleText.arabic({
    // Column menu
    this.unfreezeColumn = 'إلغاء التجميد',
    this.freezeColumnToStart = 'تجميد إلى البداية',
    this.freezeColumnToEnd = 'تجميد إلى النهاية',
    this.autoFitColumn = 'تعبئة تلقائية',
    this.hideColumn = 'إخفاء العمود',
    this.setColumns = 'إدراج أعمدة',
    this.setFilter = 'فلترة',
    this.resetFilter = 'تهيئة الفلترة',
    // SetColumns popup
    this.setColumnsTitle = 'اسم العمود',
    // Filter popup
    this.filterColumn = 'العمود',
    this.filterType = 'النوع',
    this.filterValue = 'القيمة',
    this.filterAllColumns = 'كل الأعمدة',
    this.filterContains = 'يحتوي',
    this.filterEquals = 'يساوي',
    this.filterStartsWith = 'يبدأ بـ',
    this.filterEndsWith = 'ينتهي بـ',
    this.filterGreaterThan = 'أكبر من',
    this.filterGreaterThanOrEqualTo = 'أكبر من أو يساوي',
    this.filterLessThan = 'اصغر من',
    this.filterLessThanOrEqualTo = 'أصغر من أو يساوي',
    // Date popup
    this.sunday = 'أح',
    this.monday = 'إث',
    this.tuesday = 'ثل',
    this.wednesday = 'أر',
    this.thursday = 'خم',
    this.friday = 'جم',
    this.saturday = 'سب',
    // Time column popup
    this.hour = 'ساعة',
    this.minute = 'دقيقي',
    // Common
    this.loadingText = 'جاري التحميل',
  });
}

/// Behavior of the Enter key when a cell is selected.
enum SamojectTableGridEnterKeyAction {
  /// When the Enter key is pressed, the cell is changed to the edit state,
  /// or if it is already in the edit state, it moves to the cell below.
  editingAndMoveDown,

  /// When the Enter key is pressed, the cell is changed to the edit state,
  /// or if it is already in the edit state, it moves to the right cell.
  editingAndMoveRight,

  /// Pressing the Enter key toggles the editing status.
  toggleEditing,

  /// Pressing the Enter key does nothing.
  none;

  bool get isEditingAndMoveDown =>
      this == SamojectTableGridEnterKeyAction.editingAndMoveDown;

  bool get isEditingAndMoveRight =>
      this == SamojectTableGridEnterKeyAction.editingAndMoveRight;

  bool get isToggleEditing =>
      this == SamojectTableGridEnterKeyAction.toggleEditing;

  bool get isNone => this == SamojectTableGridEnterKeyAction.none;
}
