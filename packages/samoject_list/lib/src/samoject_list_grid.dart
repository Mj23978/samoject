import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show Intl;

import 'helper/show_column_menu.dart';
import 'helper/samoject_list_key_manager_event.dart';
import 'manager/samoject_list_grid_event_manager.dart';
import 'manager/samoject_list_grid_key_manager.dart';
import 'manager/samoject_list_grid_state_manager.dart';
import 'model/samoject_list_cell.dart';
import 'model/samoject_list_column.dart';
import 'model/samoject_list_column_group.dart';
import 'model/samoject_list_row.dart';
import 'plugin/samoject_list_pagination.dart';
import 'samoject_list_grid_configuration.dart';
import 'ui/miscellaneous/samoject_list_state_with_change.dart';
import 'ui/ui.dart';
import 'widgets/samoject_list_linked_scroll_controller.dart';
import 'widgets/samoject_list_loading.dart';
import 'widgets/samoject_list_shadow_line.dart';

typedef SamojectListOnLoadedEventCallback = void Function(
    SamojectListGridOnLoadedEvent event);

typedef SamojectListOnChangedEventCallback = void Function(
    SamojectListGridOnChangedEvent event);

typedef SamojectListOnSelectedEventCallback = void Function(
    SamojectListGridOnSelectedEvent event);

typedef SamojectListOnSortedEventCallback = void Function(
    SamojectListGridOnSortedEvent event);

typedef SamojectListOnRowCheckedEventCallback = void Function(
    SamojectListGridOnRowCheckedEvent event);

typedef SamojectListOnRowDoubleTapEventCallback = void Function(
    SamojectListGridOnRowDoubleTapEvent event);

typedef SamojectListOnRowSecondaryTapEventCallback = void Function(
    SamojectListGridOnRowSecondaryTapEvent event);

typedef SamojectListOnRowsMovedEventCallback = void Function(
    SamojectListGridOnRowsMovedEvent event);

typedef CreateHeaderCallBack = Widget Function(
    SamojectListGridStateManager stateManager);

typedef CreateFooterCallBack = Widget Function(
    SamojectListGridStateManager stateManager);

typedef SamojectListRowColorCallback = Color Function(
    SamojectListRowColorContext rowColorContext);

/// [SamojectListGrid] is a widget that receives columns and rows and is expressed as a grid-type UI.
///
/// [SamojectListGrid] supports movement and editing with the keyboard,
/// Through various settings, it can be transformed and used in various UIs.
///
/// Pop-ups such as date selection, time selection,
/// and option selection used inside [SamojectListGrid] are created with the API provided outside of [SamojectListGrid].
/// Also, the popup to set the filter or column inside the grid is implemented through the setting of [SamojectListGrid].
class SamojectListGrid extends SamojectListStatefulWidget {
  const SamojectListGrid({
    Key? key,
    required this.columns,
    required this.rows,
    this.columnGroups,
    this.onLoaded,
    this.onChanged,
    this.onSelected,
    this.onSorted,
    this.onRowChecked,
    this.onRowDoubleTap,
    this.onRowSecondaryTap,
    this.onRowsMoved,
    this.createHeader,
    this.createFooter,
    this.rowColorCallback,
    this.columnMenuDelegate,
    this.configuration,
    this.mode = SamojectListGridMode.normal,
  }) : super(key: key);

  /// {@template table_grid_property_columns}
  /// The [SamojectListColumn] column is delivered as a list and can be added or deleted after grid creation.
  ///
  /// Columns can be added or deleted
  /// with [SamojectListGridStateManager.insertColumns] and [SamojectListGridStateManager.removeColumns].
  ///
  /// Each [SamojectListColumn.field] value in [List] must be unique.
  /// [SamojectListColumn.field] must be provided to match the map key in [SamojectListRow.cells].
  /// should also be provided to match in [SamojectListColumnGroup.fields] as well.
  /// {@endtemplate}
  final List<SamojectListColumn> columns;

  /// {@template table_grid_property_rows}
  /// [rows] contains a call to the [SamojectListGridStateManager.initializeRows] method
  /// that handles necessary settings when creating a grid or when a new row is added.
  ///
  /// CPU operation is required as much as [rows.length] multiplied by the number of [SamojectListRow.cells].
  /// No problem under normal circumstances, but if there are many rows and columns,
  /// the UI may freeze at the start of the grid.
  /// In this case, the grid is started by passing an empty list to rows
  /// and after the [SamojectListGrid.onLoaded] callback is called
  /// Rows initialization can be done asynchronously with [SamojectListGridStateManager.initializeRowsAsync] .
  ///
  /// ```dart
  /// stateManager.setShowLoading(true);
  ///
  /// SamojectListGridStateManager.initializeRowsAsync(
  ///   columns,
  ///   fetchedRows,
  /// ).then((value) {
  ///   stateManager.refRows.addAll(FilteredList(initialList: value));
  ///
  ///   /// In this example,
  ///   /// the loading screen is activated in the onLoaded callback when the grid is created.
  ///   /// If the loading screen is not activated
  ///   /// You must update the grid state by calling the stateManager.notifyListeners() method.
  ///   /// Because calling setShowLoading updates the grid state
  ///   /// No need to call stateManager.notifyListeners.
  ///   stateManager.setShowLoading(false);
  /// });
  /// ```
  /// {@endtemplate}
  final List<SamojectListRow> rows;

  /// {@template table_grid_property_columnGroups}
  /// [columnGroups] can be expressed in UI by grouping columns.
  /// {@endtemplate}
  final List<SamojectListColumnGroup>? columnGroups;

  /// {@template table_grid_property_onLoaded}
  /// [SamojectListGrid] completes setting and passes [SamojectListGridStateManager] to [event].
  ///
  /// When the [SamojectListGrid] starts,
  /// the desired setting can be made through [SamojectListGridStateManager].
  ///
  /// ex) Change the selection mode to cell selection.
  /// ```dart
  /// onLoaded: (SamojectListGridOnLoadedEvent event) {
  ///   event.stateManager.setSelectingMode(SamojectListGridSelectingMode.cell);
  /// },
  /// ```
  /// {@endtemplate}
  final SamojectListOnLoadedEventCallback? onLoaded;

  /// {@template table_grid_property_onChanged}
  /// [onChanged] is called when the cell value changes.
  ///
  /// When changing the cell value directly programmatically
  /// with the [SamojectListGridStateManager.changeCellValue] method
  /// When changing the value by calling [callOnChangedEvent]
  /// as false as the parameter of [SamojectListGridStateManager.changeCellValue]
  /// The [onChanged] callback is not called.
  /// {@endtemplate}
  final SamojectListOnChangedEventCallback? onChanged;

  /// {@template table_grid_property_onSelected}
  /// [onSelected] can receive a response only if [SamojectListGrid.mode] is set to [SamojectListGridMode.select] .
  ///
  /// When a row is tapped or the Enter key is pressed, the row information can be returned.
  /// When [SamojectListGrid] is used for row selection, you can use [SamojectListGridMode.select] .
  /// Basically, in [SamojectListGridMode.select], the [onLoaded] callback works
  /// when the current selected row is tapped or the Enter key is pressed.
  /// This will require a double tap if no row is selected.
  /// In [SamojectListGridMode.selectWithOneTap], the [onLoaded] callback works when the unselected row is tapped once.
  /// {@endtemplate}
  final SamojectListOnSelectedEventCallback? onSelected;

  /// {@template table_grid_property_onSorted}
  /// [onSorted] is a callback that is called when column sorting is changed.
  /// {@endtemplate}
  final SamojectListOnSortedEventCallback? onSorted;

  /// {@template table_grid_property_onRowChecked}
  /// [onRowChecked] can receive the check status change of the checkbox
  /// when [SamojectListColumn.enableRowChecked] is enabled.
  /// {@endtemplate}
  final SamojectListOnRowCheckedEventCallback? onRowChecked;

  /// {@template table_grid_property_onRowDoubleTap}
  /// [onRowDoubleTap] is called when a row is tapped twice in a row.
  /// {@endtemplate}
  final SamojectListOnRowDoubleTapEventCallback? onRowDoubleTap;

  /// {@template table_grid_property_onRowSecondaryTap}
  /// [onRowSecondaryTap] is called when a mouse right-click event occurs.
  /// {@endtemplate}
  final SamojectListOnRowSecondaryTapEventCallback? onRowSecondaryTap;

  /// {@template table_grid_property_onRowsMoved}
  /// [onRowsMoved] is called after the row is dragged and moved if [SamojectListColumn.enableRowDrag] is enabled.
  /// {@endtemplate}
  final SamojectListOnRowsMovedEventCallback? onRowsMoved;

  /// {@template table_grid_property_createHeader}
  /// [createHeader] is a user-definable area located above the upper column area of [SamojectListGrid].
  ///
  /// Just pass a callback that returns [Widget] .
  /// Assuming you created a widget called Header.
  /// ```dart
  /// createHeader: (stateManager) {
  ///   stateManager.headerHeight = 45;
  ///   return Header(
  ///     stateManager: stateManager,
  ///   );
  /// },
  /// ```
  ///
  /// If the widget returned to the callback detects the state and updates the UI,
  /// register the callback in [SamojectListGridStateManager.addListener]
  /// and update the UI with [StatefulWidget.setState], etc.
  /// The listener callback registered with [SamojectListGridStateManager.addListener]
  /// must remove the listener callback with [SamojectListGridStateManager.removeListener]
  /// when the widget returned by the callback is dispose.
  /// {@endtemplate}
  final CreateHeaderCallBack? createHeader;

  /// {@template table_grid_property_createFooter}
  /// [createFooter] is equivalent to [createHeader].
  /// However, it is located at the bottom of the grid.
  ///
  /// [CreateFooter] can also be passed an already provided widget for Pagination.
  /// Of course you can pass it to [createHeader] , but it's not a typical UI.
  /// ```dart
  /// createFooter: (stateManager) {
  ///   stateManager.setPageSize(100, notify: false); // default 40
  ///   return SamojectListPagination(stateManager);
  /// },
  /// ```
  /// {@endtemplate}
  final CreateFooterCallBack? createFooter;

  /// {@template table_grid_property_rowColorCallback}
  /// [rowColorCallback] can change the row background color dynamically according to the state.
  ///
  /// Implement a callback that returns a [Color] by referring to the value passed as a callback argument.
  /// An exception should be handled when a column is deleted.
  /// ```dart
  /// rowColorCallback = (SamojectListRowColorContext rowColorContext) {
  ///   return rowColorContext.row.cells['column2']?.value == 'green'
  ///       ? const Color(0xFFE2F6DF)
  ///       : Colors.white;
  /// }
  /// ```
  /// {@endtemplate}
  final SamojectListRowColorCallback? rowColorCallback;

  /// {@template table_grid_property_columnMenuDelegate}
  /// Column menu can be customized.
  ///
  /// See the demo example link below.
  /// https://github.com/bosskmk/samoject_list_grid/blob/master/demo/lib/screen/feature/column_menu_screen.dart
  /// {@endtemplate}
  final SamojectListColumnMenuDelegate? columnMenuDelegate;

  /// {@template table_grid_property_configuration}
  /// In [configuration], you can change the style and settings or text used in [SamojectListGrid].
  /// {@endtemplate}
  final SamojectListGridConfiguration? configuration;

  /// Execution mode of [SamojectListGrid].
  ///
  /// [SamojectListGridMode.normal]
  /// {@template table_grid_mode_normal}
  /// Basic mode with most functions not limited, such as editing and selection.
  /// {@endtemplate}
  ///
  /// [SamojectListGridMode.select], [SamojectListGridMode.selectWithOneTap]
  /// {@template table_grid_mode_select}
  /// Mode for selecting one list from a specific list.
  /// Tap a row or press Enter to select the current row.
  ///
  /// [select]
  /// Call the [SamojectListGrid.onSelected] callback when the selected row is tapped.
  /// To select an unselected row, select the row and then tap once more.
  /// [selectWithOneTap]
  /// Same as [select], but calls [SamojectListGrid.onSelected] with one tap.
  ///
  /// This mode is non-editable, but programmatically possible.
  /// ```dart
  /// stateManager.changeCellValue(
  ///   stateManager.currentRow!.cells['column_1']!,
  ///   value,
  ///   force: true,
  /// );
  /// ```
  /// {@endtemplate}
  ///
  /// [SamojectListGridMode.popup]
  /// {@template table_grid_mode_popup}
  /// This is a mode for popup type.
  /// It is used when calling a popup for filtering or column setting
  /// inside [SamojectListGrid], and it is not a mode for users.
  ///
  /// If the user wants to run [SamojectListGrid] as a popup,
  /// use [SamojectListGridPopup] or [SamojectListGridDualGridPopup].
  /// {@endtemplate}
  final SamojectListGridMode? mode;

  /// [setDefaultLocale] sets locale when [Intl] package is used in [SamojectListGrid].
  ///
  /// {@template intl_default_locale}
  /// ```dart
  /// SamojectListGrid.setDefaultLocale('es_ES');
  /// SamojectListGrid.initializeDateFormat();
  ///
  /// // or if you already use Intl in your app.
  ///
  /// Intl.defaultLocale = 'es_ES';
  /// initializeDateFormatting();
  /// ```
  /// {@endtemplate}
  static setDefaultLocale(String locale) {
    Intl.defaultLocale = locale;
  }

  /// [initializeDateFormat] should be called
  /// when you need to set date format when changing locale.
  ///
  /// {@macro intl_default_locale}
  static initializeDateFormat() {
    initializeDateFormatting();
  }

  @override
  SamojectListGridState createState() => SamojectListGridState();
}

class SamojectListGridState
    extends SamojectListStateWithChange<SamojectListGrid> {
  bool _showColumnTitle = false;

  bool _showColumnFilter = false;

  bool _showColumnFooter = false;

  bool _showColumnGroups = false;

  bool _showFrozenColumn = false;

  bool _showLoading = false;

  bool _hasLeftFrozenColumns = false;

  bool _hasRightFrozenColumns = false;

  double _bodyLeftOffset = 0.0;

  double _bodyRightOffset = 0.0;

  double _rightFrozenLeftOffset = 0.0;

  Widget? _header;

  Widget? _footer;

  final FocusNode _gridFocusNode = FocusNode();

  final LinkedScrollControllerGroup _verticalScroll =
      LinkedScrollControllerGroup();

  final LinkedScrollControllerGroup _horizontalScroll =
      LinkedScrollControllerGroup();

  final List<Function()> _disposeList = [];

  late final SamojectListGridStateManager _stateManager;

  late final SamojectListGridKeyManager _keyManager;

  late final SamojectListGridEventManager _eventManager;

  @override
  SamojectListGridStateManager get stateManager => _stateManager;

  @override
  void initState() {
    _initStateManager();

    _initKeyManager();

    _initEventManager();

    _initOnLoadedEvent();

    _initSelectMode();

    _initHeaderFooter();

    _disposeList.add(() {
      _gridFocusNode.dispose();
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      updateState();
    });

    super.initState();
  }

  @override
  void dispose() {
    for (var dispose in _disposeList) {
      dispose();
    }

    super.dispose();
  }

  @override
  void updateState() {
    _showColumnTitle = update<bool>(
      _showColumnTitle,
      stateManager.showColumnTitle,
    );

    _showColumnFilter = update<bool>(
      _showColumnFilter,
      stateManager.showColumnFilter,
    );

    _showColumnFooter = update<bool>(
      _showColumnFooter,
      stateManager.showColumnFooter,
    );

    _showColumnGroups = update<bool>(
      _showColumnGroups,
      stateManager.showColumnGroups,
    );

    _showFrozenColumn = update<bool>(
      _showFrozenColumn,
      stateManager.showFrozenColumn,
    );

    _showLoading = update<bool>(
      _showLoading,
      stateManager.showLoading,
    );

    _hasLeftFrozenColumns = update<bool>(
      _hasLeftFrozenColumns,
      stateManager.hasLeftFrozenColumns,
    );

    _hasRightFrozenColumns = update<bool>(
      _hasRightFrozenColumns,
      stateManager.hasRightFrozenColumns,
    );

    _bodyLeftOffset = update<double>(
      _bodyLeftOffset,
      stateManager.bodyLeftOffset,
    );

    _bodyRightOffset = update<double>(
      _bodyRightOffset,
      stateManager.bodyRightOffset,
    );

    _rightFrozenLeftOffset = update<double>(
      _rightFrozenLeftOffset,
      stateManager.rightFrozenLeftOffset,
    );
  }

  void _initStateManager() {
    _stateManager = SamojectListGridStateManager(
      columns: widget.columns,
      rows: widget.rows,
      gridFocusNode: _gridFocusNode,
      scroll: SamojectListGridScrollController(
        vertical: _verticalScroll,
        horizontal: _horizontalScroll,
      ),
      columnGroups: widget.columnGroups,
      mode: widget.mode,
      onChangedEventCallback: widget.onChanged,
      onSelectedEventCallback: widget.onSelected,
      onSortedEventCallback: widget.onSorted,
      onRowCheckedEventCallback: widget.onRowChecked,
      onRowDoubleTapEventCallback: widget.onRowDoubleTap,
      onRowSecondaryTapEventCallback: widget.onRowSecondaryTap,
      onRowsMovedEventCallback: widget.onRowsMoved,
      onRowColorCallback: widget.rowColorCallback,
      columnMenuDelegate: widget.columnMenuDelegate,
      createHeader: widget.createHeader,
      createFooter: widget.createFooter,
      configuration: widget.configuration,
    );

    // Dispose
    _disposeList.add(() {
      _stateManager.dispose();
    });
  }

  void _initKeyManager() {
    _keyManager = SamojectListGridKeyManager(
      stateManager: _stateManager,
    );

    _keyManager.init();

    _stateManager.setKeyManager(_keyManager);

    // Dispose
    _disposeList.add(() {
      _keyManager.dispose();
    });
  }

  void _initEventManager() {
    _eventManager = SamojectListGridEventManager(
      stateManager: _stateManager,
    );

    _eventManager.init();

    _stateManager.setEventManager(_eventManager);

    // Dispose
    _disposeList.add(() {
      _eventManager.dispose();
    });
  }

  void _initOnLoadedEvent() {
    if (widget.onLoaded == null) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onLoaded!(SamojectListGridOnLoadedEvent(
        stateManager: _stateManager,
      ));
    });
  }

  void _initSelectMode() {
    if (widget.mode.isSelect != true) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_stateManager.currentCell == null && widget.rows.isNotEmpty) {
        final firstVisible =
            widget.columns.firstWhereOrNull((element) => !element.hide);

        if (firstVisible != null) {
          _stateManager.setCurrentCell(
            widget.rows.first.cells[firstVisible.field],
            0,
          );
        }
      }

      _stateManager.gridFocusNode!.requestFocus();
    });
  }

  void _initHeaderFooter() {
    if (_stateManager.showHeader) {
      _header = _stateManager.createHeader!(_stateManager);
    }

    if (_stateManager.showFooter) {
      _footer = _stateManager.createFooter!(_stateManager);
    }

    if (_header is SamojectListPagination ||
        _footer is SamojectListPagination) {
      _stateManager.setPage(1, notify: false);
    }
  }

  KeyEventResult _handleGridFocusOnKey(FocusNode focusNode, RawKeyEvent event) {
    if (_keyManager.eventResult.isSkip == false) {
      _keyManager.subject.add(SamojectListKeyManagerEvent(
        focusNode: focusNode,
        event: event,
      ));
    }

    return _keyManager.eventResult.consume(KeyEventResult.handled);
  }

  @override
  Widget build(BuildContext context) {
    final style = _stateManager.style;

    final bool showLeftFrozen =
        _stateManager.showFrozenColumn && _stateManager.hasLeftFrozenColumns;

    final bool showRightFrozen =
        _stateManager.showFrozenColumn && _stateManager.hasRightFrozenColumns;

    final bool showColumnRowDivider =
        _stateManager.showColumnTitle || _stateManager.showColumnFilter;

    final bool showColumnFooter = _stateManager.showColumnFooter;

    _stateManager.setTextDirection(Directionality.of(context));

    return FocusScope(
      onFocusChange: _stateManager.setKeepFocus,
      onKey: _handleGridFocusOnKey,
      child: SafeArea(
        child: _GridContainer(
          stateManager: _stateManager,
          child: CustomMultiChildLayout(
            key: _stateManager.gridKey,
            delegate: SamojectListGridLayoutDelegate(_stateManager),
            children: [
              /// Body columns and rows.
              LayoutId(
                id: _StackName.bodyRows,
                child: SamojectListBodyRows(_stateManager),
              ),
              LayoutId(
                id: _StackName.bodyColumns,
                child: SamojectListBodyColumns(_stateManager),
              ),

              /// Body columns footer.
              if (showColumnFooter)
                LayoutId(
                  id: _StackName.bodyColumnFooters,
                  child: SamojectListBodyColumnsFooter(stateManager),
                ),

              /// Left columns and rows.
              if (showLeftFrozen) ...[
                LayoutId(
                  id: _StackName.leftFrozenColumns,
                  child: SamojectListLeftFrozenColumns(_stateManager),
                ),
                LayoutId(
                    id: _StackName.leftFrozenRows,
                    child: SamojectListLeftFrozenRows(_stateManager)),
                LayoutId(
                  id: _StackName.leftFrozenDivider,
                  child: SamojectListShadowLine(
                    axis: Axis.vertical,
                    color: style.gridBorderColor,
                    shadow: style.enableGridBorderShadow,
                  ),
                ),
                if (showColumnFooter)
                  LayoutId(
                    id: _StackName.leftFrozenColumnFooters,
                    child: SamojectListLeftFrozenColumnsFooter(stateManager),
                  ),
              ],

              /// Right columns and rows.
              if (showRightFrozen) ...[
                LayoutId(
                  id: _StackName.rightFrozenColumns,
                  child: SamojectListRightFrozenColumns(_stateManager),
                ),
                LayoutId(
                    id: _StackName.rightFrozenRows,
                    child: SamojectListRightFrozenRows(_stateManager)),
                LayoutId(
                  id: _StackName.rightFrozenDivider,
                  child: SamojectListShadowLine(
                    axis: Axis.vertical,
                    color: style.gridBorderColor,
                    shadow: style.enableGridBorderShadow,
                    reverse: true,
                  ),
                ),
                if (showColumnFooter)
                  LayoutId(
                    id: _StackName.rightFrozenColumnFooters,
                    child: SamojectListRightFrozenColumnsFooter(stateManager),
                  ),
              ],

              /// Column and row divider.
              if (showColumnRowDivider)
                LayoutId(
                  id: _StackName.columnRowDivider,
                  child: SamojectListShadowLine(
                    axis: Axis.horizontal,
                    color: style.gridBorderColor,
                    shadow: style.enableGridBorderShadow,
                  ),
                ),

              /// Header and divider.
              if (_stateManager.showHeader) ...[
                LayoutId(
                  id: _StackName.headerDivider,
                  child: SamojectListShadowLine(
                    axis: Axis.horizontal,
                    color: style.gridBorderColor,
                    shadow: style.enableGridBorderShadow,
                  ),
                ),
                LayoutId(
                  id: _StackName.header,
                  child: _header!,
                ),
              ],

              /// Column footer divider.
              if (showColumnFooter)
                LayoutId(
                  id: _StackName.columnFooterDivider,
                  child: SamojectListShadowLine(
                    axis: Axis.horizontal,
                    color: style.gridBorderColor,
                    shadow: style.enableGridBorderShadow,
                  ),
                ),

              /// Footer and divider.
              if (_stateManager.showFooter) ...[
                LayoutId(
                  id: _StackName.footerDivider,
                  child: SamojectListShadowLine(
                    axis: Axis.horizontal,
                    color: style.gridBorderColor,
                    shadow: style.enableGridBorderShadow,
                    reverse: true,
                  ),
                ),
                LayoutId(
                  id: _StackName.footer,
                  child: _footer!,
                ),
              ],

              /// Loading screen.
              if (_stateManager.showLoading)
                LayoutId(
                  id: _StackName.loading,
                  child: SamojectListLoading(
                    backgroundColor: style.gridBackgroundColor,
                    indicatorColor: style.activatedBorderColor,
                    text: _stateManager.localeText.loadingText,
                    textStyle: style.cellTextStyle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SamojectListGridLayoutDelegate extends MultiChildLayoutDelegate {
  final SamojectListGridStateManager _stateManager;

  SamojectListGridLayoutDelegate(this._stateManager)
      : super(relayout: _stateManager.resizingChangeNotifier);

  @override
  void performLayout(Size size) {
    if (_stateManager.showFrozenColumn !=
        _stateManager.shouldShowFrozenColumns(size.width)) {
      _stateManager.notifyListenersOnPostFrame();
    }

    _stateManager.setLayout(BoxConstraints.tight(size));

    bool isLTR = _stateManager.isLTR;
    double bodyRowsTopOffset = 0;
    double bodyRowsBottomOffset = 0;
    double columnsTopOffset = 0;
    double bodyLeftOffset = 0;
    double bodyRightOffset = 0;

    // first layout header and footer and see what remains for the scrolling part
    if (hasChild(_StackName.header)) {
      // maximum 40% of the height
      var s = layoutChild(
        _StackName.header,
        BoxConstraints.loose(Size(size.width, size.height / 100 * 40)),
      );

      _stateManager.headerHeight = s.height;

      bodyRowsTopOffset += s.height;

      columnsTopOffset += s.height;
    }

    if (hasChild(_StackName.headerDivider)) {
      layoutChild(
        _StackName.headerDivider,
        BoxConstraints.tight(
          Size(size.width, SamojectListGridSettings.gridBorderWidth),
        ),
      );

      positionChild(
        _StackName.headerDivider,
        Offset(0, columnsTopOffset),
      );
    }

    if (hasChild(_StackName.footer)) {
      // maximum 40% of the height
      var s = layoutChild(
        _StackName.footer,
        BoxConstraints.loose(Size(size.width, size.height / 100 * 40)),
      );

      _stateManager.footerHeight = s.height;

      bodyRowsBottomOffset += s.height;

      positionChild(
        _StackName.footer,
        Offset(0, size.height - bodyRowsBottomOffset),
      );
    }

    if (hasChild(_StackName.footerDivider)) {
      layoutChild(
        _StackName.footerDivider,
        BoxConstraints.tight(
          Size(size.width, SamojectListGridSettings.gridBorderWidth),
        ),
      );

      positionChild(
        _StackName.footerDivider,
        Offset(0, size.height - bodyRowsBottomOffset),
      );
    }

    // now layout columns of frozen sides and see what remains for the body width
    if (hasChild(_StackName.leftFrozenColumns)) {
      var s = layoutChild(
        _StackName.leftFrozenColumns,
        BoxConstraints.loose(size),
      );

      final double posX = isLTR ? 0 : size.width - s.width;

      positionChild(
        _StackName.leftFrozenColumns,
        Offset(posX, columnsTopOffset),
      );

      if (isLTR) {
        bodyLeftOffset = s.width;
      } else {
        bodyRightOffset = s.width;
      }
    }

    if (hasChild(_StackName.leftFrozenDivider)) {
      var s = layoutChild(
        _StackName.leftFrozenDivider,
        BoxConstraints.tight(
          Size(
            SamojectListGridSettings.gridBorderWidth,
            size.height - columnsTopOffset - bodyRowsBottomOffset,
          ),
        ),
      );

      final double posX = isLTR
          ? bodyLeftOffset
          : size.width -
              bodyRightOffset -
              SamojectListGridSettings.gridBorderWidth;

      positionChild(
        _StackName.leftFrozenDivider,
        Offset(posX, columnsTopOffset),
      );

      if (isLTR) {
        bodyLeftOffset += s.width;
      } else {
        bodyRightOffset += s.width;
      }
    }

    if (hasChild(_StackName.rightFrozenColumns)) {
      var s = layoutChild(
        _StackName.rightFrozenColumns,
        BoxConstraints.loose(size),
      );

      final double posX = isLTR
          ? size.width - s.width + SamojectListGridSettings.gridBorderWidth
          : 0;

      positionChild(
        _StackName.rightFrozenColumns,
        Offset(posX, columnsTopOffset),
      );

      if (isLTR) {
        bodyRightOffset = s.width;
      } else {
        bodyLeftOffset = s.width;
      }
    }

    if (hasChild(_StackName.rightFrozenDivider)) {
      var s = layoutChild(
        _StackName.rightFrozenDivider,
        BoxConstraints.tight(
          Size(
            SamojectListGridSettings.gridBorderWidth,
            size.height - columnsTopOffset - bodyRowsBottomOffset,
          ),
        ),
      );

      final double posX = isLTR
          ? size.width -
              bodyRightOffset -
              SamojectListGridSettings.gridBorderWidth
          : bodyLeftOffset;

      positionChild(
        _StackName.rightFrozenDivider,
        Offset(posX, columnsTopOffset),
      );

      if (isLTR) {
        bodyRightOffset += s.width;
      } else {
        bodyLeftOffset += s.width;
      }
    }

    if (hasChild(_StackName.bodyColumns)) {
      var s = layoutChild(
        _StackName.bodyColumns,
        BoxConstraints.loose(
          Size(size.width - bodyLeftOffset - bodyRightOffset, size.height),
        ),
      );

      final double posX =
          isLTR ? bodyLeftOffset : size.width - s.width - bodyRightOffset;

      positionChild(
        _StackName.bodyColumns,
        Offset(posX, columnsTopOffset),
      );

      bodyRowsTopOffset += s.height;
    }

    if (hasChild(_StackName.bodyColumnFooters)) {
      var s = layoutChild(
        _StackName.bodyColumnFooters,
        BoxConstraints.loose(
          Size(size.width - bodyLeftOffset - bodyRightOffset, size.height),
        ),
      );

      _stateManager.columnFooterHeight = s.height;

      final double posX =
          isLTR ? bodyLeftOffset : size.width - s.width - bodyRightOffset;

      positionChild(
        _StackName.bodyColumnFooters,
        Offset(posX, size.height - bodyRowsBottomOffset - s.height),
      );

      bodyRowsBottomOffset += s.height;
    }

    if (hasChild(_StackName.columnFooterDivider)) {
      var s = layoutChild(
        _StackName.columnFooterDivider,
        BoxConstraints.tight(
          Size(size.width, SamojectListGridSettings.gridBorderWidth),
        ),
      );

      positionChild(
        _StackName.columnFooterDivider,
        Offset(0, size.height - bodyRowsBottomOffset - s.height),
      );
    }

    // layout rows
    if (hasChild(_StackName.columnRowDivider)) {
      var s = layoutChild(
        _StackName.columnRowDivider,
        BoxConstraints.tight(
          Size(size.width, SamojectListGridSettings.gridBorderWidth),
        ),
      );

      positionChild(
        _StackName.columnRowDivider,
        Offset(0, bodyRowsTopOffset),
      );

      bodyRowsTopOffset += s.height;
    } else {
      bodyRowsTopOffset += SamojectListGridSettings.gridBorderWidth;
    }

    if (hasChild(_StackName.leftFrozenRows)) {
      final double offset = isLTR ? bodyLeftOffset : bodyRightOffset;
      final double posX = isLTR
          ? 0
          : size.width -
              bodyRightOffset +
              SamojectListGridSettings.gridBorderWidth;

      layoutChild(
        _StackName.leftFrozenRows,
        BoxConstraints.loose(
          Size(offset, size.height - bodyRowsTopOffset - bodyRowsBottomOffset),
        ),
      );

      positionChild(
        _StackName.leftFrozenRows,
        Offset(posX, bodyRowsTopOffset),
      );
    }

    if (hasChild(_StackName.leftFrozenColumnFooters)) {
      final double offset = isLTR ? bodyLeftOffset : bodyRightOffset;
      final double posX = isLTR
          ? 0
          : size.width -
              bodyRightOffset +
              SamojectListGridSettings.gridBorderWidth;

      layoutChild(
        _StackName.leftFrozenColumnFooters,
        BoxConstraints.loose(
          Size(offset, size.height - bodyRowsBottomOffset),
        ),
      );

      positionChild(
        _StackName.leftFrozenColumnFooters,
        Offset(posX, size.height - bodyRowsBottomOffset),
      );
    }

    if (hasChild(_StackName.rightFrozenRows)) {
      final double offset = isLTR ? bodyRightOffset : bodyLeftOffset;
      final double posX = isLTR
          ? size.width -
              bodyRightOffset +
              SamojectListGridSettings.gridBorderWidth
          : 0;

      layoutChild(
        _StackName.rightFrozenRows,
        BoxConstraints.loose(
          Size(offset, size.height - bodyRowsTopOffset - bodyRowsBottomOffset),
        ),
      );

      positionChild(
        _StackName.rightFrozenRows,
        Offset(posX, bodyRowsTopOffset),
      );
    }

    if (hasChild(_StackName.rightFrozenColumnFooters)) {
      final double offset = isLTR ? bodyRightOffset : bodyLeftOffset;
      var s = layoutChild(
        _StackName.rightFrozenColumnFooters,
        BoxConstraints.loose(Size(offset, size.height)),
      );

      final double posX = isLTR
          ? size.width - s.width + SamojectListGridSettings.gridBorderWidth
          : 0;

      positionChild(
        _StackName.rightFrozenColumnFooters,
        Offset(posX, size.height - bodyRowsBottomOffset),
      );
    }

    if (hasChild(_StackName.bodyRows)) {
      var height = size.height - bodyRowsTopOffset - bodyRowsBottomOffset;

      var width = size.width - bodyLeftOffset - bodyRightOffset;

      layoutChild(
        _StackName.bodyRows,
        BoxConstraints.tight(Size(width, height)),
      );

      positionChild(
        _StackName.bodyRows,
        Offset(bodyLeftOffset, bodyRowsTopOffset),
      );
    }

    if (hasChild(_StackName.loading)) {
      layoutChild(
        _StackName.loading,
        BoxConstraints.tight(size),
      );
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}

class _GridContainer extends StatelessWidget {
  final SamojectListGridStateManager stateManager;

  final Widget child;

  const _GridContainer({
    required this.stateManager,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = stateManager.style;

    return Focus(
      focusNode: stateManager.gridFocusNode,
      child: ScrollConfiguration(
        behavior: const SamojectListScrollBehavior().copyWith(
          scrollbars: false,
        ),
        child: Container(
          padding: const EdgeInsets.all(SamojectListGridSettings.gridPadding),
          decoration: BoxDecoration(
            color: style.gridBackgroundColor,
            borderRadius: style.gridBorderRadius,
            border: Border.all(
              color: style.gridBorderColor,
              width: SamojectListGridSettings.gridBorderWidth,
            ),
          ),
          child: ClipRRect(
            borderRadius: style.gridBorderRadius.resolve(TextDirection.ltr),
            child: child,
          ),
        ),
      ),
    );
  }
}

class SamojectListGridOnLoadedEvent {
  final SamojectListGridStateManager stateManager;

  const SamojectListGridOnLoadedEvent({
    required this.stateManager,
  });
}

/// Event called when the value of [SamojectListCell] is changed.
///
/// Notice.
/// [columnIdx], [rowIdx] are the values in the current screen state.
/// Values in their current state, not actual data values
/// with filtering, sorting, or pagination applied.
/// This value is from
/// [SamojectListGridStateManager.columns] and [SamojectListGridStateManager.rows].
///
/// All data is in
/// [SamojectListGridStateManager.refColumns.originalList]
/// [SamojectListGridStateManager.refRows.originalList]
class SamojectListGridOnChangedEvent {
  final int? columnIdx;
  final SamojectListColumn? column;
  final int? rowIdx;
  final SamojectListRow? row;
  final dynamic value;
  final dynamic oldValue;

  SamojectListGridOnChangedEvent({
    this.columnIdx,
    this.column,
    this.rowIdx,
    this.row,
    this.value,
    this.oldValue,
  });

  @override
  String toString() {
    String out = '[SamojectListOnChangedEvent] ';
    out += 'ColumnIndex : $columnIdx, RowIndex : $rowIdx\n';
    out += '::: oldValue : $oldValue\n';
    out += '::: newValue : $value';
    return out;
  }
}

class SamojectListGridOnSelectedEvent {
  final SamojectListRow? row;
  final int? rowIdx;
  final SamojectListCell? cell;

  SamojectListGridOnSelectedEvent({
    this.row,
    this.rowIdx,
    this.cell,
  });
}

class SamojectListGridOnSortedEvent {
  final SamojectListColumn column;

  final SamojectListColumnSort oldSort;

  SamojectListGridOnSortedEvent({
    required this.column,
    required this.oldSort,
  });

  @override
  String toString() {
    return '[SamojectListGridOnSortedEvent] ${column.title} (changed: ${column.sort}, old: $oldSort)';
  }
}

abstract class SamojectListGridOnRowCheckedEvent {
  bool get isAll => runtimeType == SamojectListGridOnRowCheckedAllEvent;

  bool get isRow => runtimeType == SamojectListGridOnRowCheckedOneEvent;

  final SamojectListRow? row;
  final int? rowIdx;
  final bool? isChecked;

  SamojectListGridOnRowCheckedEvent({
    this.row,
    this.rowIdx,
    this.isChecked,
  });

  @override
  String toString() {
    String checkMessage = isAll ? 'All rows ' : 'RowIdx $rowIdx ';
    checkMessage += isChecked == true ? 'checked' : 'unchecked';
    return '[SamojectListGridOnRowCheckedEvent] $checkMessage';
  }
}

class SamojectListGridOnRowDoubleTapEvent {
  final SamojectListRow? row;
  final int? rowIdx;
  final SamojectListCell? cell;

  SamojectListGridOnRowDoubleTapEvent({
    this.row,
    this.rowIdx,
    this.cell,
  });
}

class SamojectListGridOnRowSecondaryTapEvent {
  final SamojectListRow? row;
  final int? rowIdx;
  final SamojectListCell? cell;
  final Offset? offset;

  SamojectListGridOnRowSecondaryTapEvent({
    this.row,
    this.rowIdx,
    this.cell,
    this.offset,
  });
}

class SamojectListGridOnRowsMovedEvent {
  final int? idx;
  final List<SamojectListRow?>? rows;

  SamojectListGridOnRowsMovedEvent({
    required this.idx,
    required this.rows,
  });
}

class SamojectListGridOnRowCheckedOneEvent
    extends SamojectListGridOnRowCheckedEvent {
  SamojectListGridOnRowCheckedOneEvent({
    SamojectListRow? row,
    int? rowIdx,
    bool? isChecked,
  }) : super(row: row, rowIdx: rowIdx, isChecked: isChecked);
}

class SamojectListGridOnRowCheckedAllEvent
    extends SamojectListGridOnRowCheckedEvent {
  SamojectListGridOnRowCheckedAllEvent({
    bool? isChecked,
  }) : super(row: null, rowIdx: null, isChecked: isChecked);
}

class SamojectListScrollBehavior extends MaterialScrollBehavior {
  const SamojectListScrollBehavior() : super();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class SamojectListRowColorContext {
  final SamojectListRow row;

  final int rowIdx;

  final SamojectListGridStateManager stateManager;

  SamojectListRowColorContext({
    required this.row,
    required this.rowIdx,
    required this.stateManager,
  });
}

class SamojectListOptional<T> {
  SamojectListOptional(this.value);

  final T? value;
}

enum SamojectListGridMode {
  /// {@macro table_grid_mode_normal}
  normal,

  /// {@macro table_grid_mode_select}
  select,

  /// {@macro table_grid_mode_select}
  selectWithOneTap,

  /// {@macro table_grid_mode_popup}
  popup,
}

extension SamojectListGridModeExtension on SamojectListGridMode? {
  bool get isNormal => this == SamojectListGridMode.normal;

  bool get isSelect =>
      this == SamojectListGridMode.select ||
      this == SamojectListGridMode.selectWithOneTap;

  bool get isSelectModeWithOneTap =>
      this == SamojectListGridMode.selectWithOneTap;

  bool get isPopup => this == SamojectListGridMode.popup;
}

class SamojectListGridSettings {
  /// If there is a frozen column, the minimum width of the body
  /// (if it is less than the value, the frozen column is released)
  static const double bodyMinWidth = 200.0;

  /// Default column width
  static const double columnWidth = 200.0;

  /// Column width
  static const double minColumnWidth = 80.0;

  /// Frozen column division line (ShadowLine) size
  static const double shadowLineSize = 3.0;

  /// Sum of frozen column division line width
  static const double totalShadowLineWidth =
      SamojectListGridSettings.shadowLineSize * 2;

  /// Grid - padding
  static const double gridPadding = 2.0;

  /// Grid - border width
  static const double gridBorderWidth = 1.0;

  static const double gridInnerSpacing =
      (gridPadding * 2) + (gridBorderWidth * 2);

  /// Row - Default row height
  static const double rowHeight = 45.0;

  /// Row - border width
  static const double rowBorderWidth = 1.0;

  /// Row - total height
  static const double rowTotalHeight = rowHeight + rowBorderWidth;

  /// Cell - padding
  static const EdgeInsets cellPadding = EdgeInsets.symmetric(horizontal: 10);

  /// Column title - padding
  static const EdgeInsets columnTitlePadding =
      EdgeInsets.symmetric(horizontal: 10);

  static const EdgeInsets columnFilterPadding = EdgeInsets.all(5);

  /// Cell - fontSize
  static const double cellFontSize = 14;

  /// Scroll when multi-selection is as close as that value from the edge
  static const double offsetScrollingFromEdge = 10.0;

  /// Size that scrolls from the edge at once when selecting multiple
  static const double offsetScrollingFromEdgeAtOnce = 200.0;

  static const int debounceMillisecondsForColumnFilter = 300;
}

enum _StackName {
  header,
  headerDivider,
  leftFrozenColumns,
  leftFrozenColumnFooters,
  leftFrozenRows,
  leftFrozenDivider,
  bodyColumns,
  bodyColumnFooters,
  bodyRows,
  rightFrozenColumns,
  rightFrozenColumnFooters,
  rightFrozenRows,
  rightFrozenDivider,
  columnRowDivider,
  columnFooterDivider,
  footer,
  footerDivider,
  loading,
}
