import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show Intl;

import 'helper/show_column_menu.dart';
import 'helper/table_key_manager_event.dart';
import 'manager/table_grid_event_manager.dart';
import 'manager/table_grid_key_manager.dart';
import 'manager/table_grid_state_manager.dart';
import 'model/table_cell.dart';
import 'model/table_column.dart';
import 'model/table_column_group.dart';
import 'model/table_row.dart';
import 'plugin/table_pagination.dart';
import 'table_grid_configuration.dart';
import 'ui/miscellaneous/table_state_with_change.dart';
import 'ui/ui.dart';
import 'widgets/table_linked_scroll_controller.dart';
import 'widgets/table_loading.dart';
import 'widgets/table_shadow_line.dart';

typedef TableOnLoadedEventCallback = void Function(
    TableGridOnLoadedEvent event);

typedef TableOnChangedEventCallback = void Function(
    TableGridOnChangedEvent event);

typedef TableOnSelectedEventCallback = void Function(
    TableGridOnSelectedEvent event);

typedef TableOnSortedEventCallback = void Function(
    TableGridOnSortedEvent event);

typedef TableOnRowCheckedEventCallback = void Function(
    TableGridOnRowCheckedEvent event);

typedef TableOnRowDoubleTapEventCallback = void Function(
    TableGridOnRowDoubleTapEvent event);

typedef TableOnRowSecondaryTapEventCallback = void Function(
    TableGridOnRowSecondaryTapEvent event);

typedef TableOnRowsMovedEventCallback = void Function(
    TableGridOnRowsMovedEvent event);

typedef CreateHeaderCallBack = Widget Function(
    TableGridStateManager stateManager);

typedef CreateFooterCallBack = Widget Function(
    TableGridStateManager stateManager);

typedef TableRowColorCallback = Color Function(
    TableRowColorContext rowColorContext);

/// [TableGrid] is a widget that receives columns and rows and is expressed as a grid-type UI.
///
/// [TableGrid] supports movement and editing with the keyboard,
/// Through various settings, it can be transformed and used in various UIs.
///
/// Pop-ups such as date selection, time selection,
/// and option selection used inside [TableGrid] are created with the API provided outside of [TableGrid].
/// Also, the popup to set the filter or column inside the grid is implemented through the setting of [TableGrid].
class TableGrid extends TableStatefulWidget {
  const TableGrid({
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
    this.mode = TableGridMode.normal,
  }) : super(key: key);

  /// {@template table_grid_property_columns}
  /// The [TableViewColumn] column is delivered as a list and can be added or deleted after grid creation.
  ///
  /// Columns can be added or deleted
  /// with [TableGridStateManager.insertColumns] and [TableGridStateManager.removeColumns].
  ///
  /// Each [TableViewColumn.field] value in [List] must be unique.
  /// [TableViewColumn.field] must be provided to match the map key in [TableViewRow.cells].
  /// should also be provided to match in [TableViewColumnGroup.fields] as well.
  /// {@endtemplate}
  final List<TableViewColumn> columns;

  /// {@template table_grid_property_rows}
  /// [rows] contains a call to the [TableGridStateManager.initializeRows] method
  /// that handles necessary settings when creating a grid or when a new row is added.
  ///
  /// CPU operation is required as much as [rows.length] multiplied by the number of [TableViewRow.cells].
  /// No problem under normal circumstances, but if there are many rows and columns,
  /// the UI may freeze at the start of the grid.
  /// In this case, the grid is started by passing an empty list to rows
  /// and after the [TableGrid.onLoaded] callback is called
  /// Rows initialization can be done asynchronously with [TableGridStateManager.initializeRowsAsync] .
  ///
  /// ```dart
  /// stateManager.setShowLoading(true);
  ///
  /// TableGridStateManager.initializeRowsAsync(
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
  final List<TableViewRow> rows;

  /// {@template table_grid_property_columnGroups}
  /// [columnGroups] can be expressed in UI by grouping columns.
  /// {@endtemplate}
  final List<TableViewColumnGroup>? columnGroups;

  /// {@template table_grid_property_onLoaded}
  /// [TableGrid] completes setting and passes [TableGridStateManager] to [event].
  ///
  /// When the [TableGrid] starts,
  /// the desired setting can be made through [TableGridStateManager].
  ///
  /// ex) Change the selection mode to cell selection.
  /// ```dart
  /// onLoaded: (TableGridOnLoadedEvent event) {
  ///   event.stateManager.setSelectingMode(TableGridSelectingMode.cell);
  /// },
  /// ```
  /// {@endtemplate}
  final TableOnLoadedEventCallback? onLoaded;

  /// {@template table_grid_property_onChanged}
  /// [onChanged] is called when the cell value changes.
  ///
  /// When changing the cell value directly programmatically
  /// with the [TableGridStateManager.changeCellValue] method
  /// When changing the value by calling [callOnChangedEvent]
  /// as false as the parameter of [TableGridStateManager.changeCellValue]
  /// The [onChanged] callback is not called.
  /// {@endtemplate}
  final TableOnChangedEventCallback? onChanged;

  /// {@template table_grid_property_onSelected}
  /// [onSelected] can receive a response only if [TableGrid.mode] is set to [TableGridMode.select] .
  ///
  /// When a row is tapped or the Enter key is pressed, the row information can be returned.
  /// When [TableGrid] is used for row selection, you can use [TableGridMode.select] .
  /// Basically, in [TableGridMode.select], the [onLoaded] callback works
  /// when the current selected row is tapped or the Enter key is pressed.
  /// This will require a double tap if no row is selected.
  /// In [TableGridMode.selectWithOneTap], the [onLoaded] callback works when the unselected row is tapped once.
  /// {@endtemplate}
  final TableOnSelectedEventCallback? onSelected;

  /// {@template table_grid_property_onSorted}
  /// [onSorted] is a callback that is called when column sorting is changed.
  /// {@endtemplate}
  final TableOnSortedEventCallback? onSorted;

  /// {@template table_grid_property_onRowChecked}
  /// [onRowChecked] can receive the check status change of the checkbox
  /// when [TableViewColumn.enableRowChecked] is enabled.
  /// {@endtemplate}
  final TableOnRowCheckedEventCallback? onRowChecked;

  /// {@template table_grid_property_onRowDoubleTap}
  /// [onRowDoubleTap] is called when a row is tapped twice in a row.
  /// {@endtemplate}
  final TableOnRowDoubleTapEventCallback? onRowDoubleTap;

  /// {@template table_grid_property_onRowSecondaryTap}
  /// [onRowSecondaryTap] is called when a mouse right-click event occurs.
  /// {@endtemplate}
  final TableOnRowSecondaryTapEventCallback? onRowSecondaryTap;

  /// {@template table_grid_property_onRowsMoved}
  /// [onRowsMoved] is called after the row is dragged and moved if [TableViewColumn.enableRowDrag] is enabled.
  /// {@endtemplate}
  final TableOnRowsMovedEventCallback? onRowsMoved;

  /// {@template table_grid_property_createHeader}
  /// [createHeader] is a user-definable area located above the upper column area of [TableGrid].
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
  /// register the callback in [TableGridStateManager.addListener]
  /// and update the UI with [StatefulWidget.setState], etc.
  /// The listener callback registered with [TableGridStateManager.addListener]
  /// must remove the listener callback with [TableGridStateManager.removeListener]
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
  ///   return TablePagination(stateManager);
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
  /// rowColorCallback = (TableRowColorContext rowColorContext) {
  ///   return rowColorContext.row.cells['column2']?.value == 'green'
  ///       ? const Color(0xFFE2F6DF)
  ///       : Colors.white;
  /// }
  /// ```
  /// {@endtemplate}
  final TableRowColorCallback? rowColorCallback;

  /// {@template table_grid_property_columnMenuDelegate}
  /// Column menu can be customized.
  ///
  /// See the demo example link below.
  /// https://github.com/bosskmk/table_grid/blob/master/demo/lib/screen/feature/column_menu_screen.dart
  /// {@endtemplate}
  final TableColumnMenuDelegate? columnMenuDelegate;

  /// {@template table_grid_property_configuration}
  /// In [configuration], you can change the style and settings or text used in [TableGrid].
  /// {@endtemplate}
  final TableGridConfiguration? configuration;

  /// Execution mode of [TableGrid].
  ///
  /// [TableGridMode.normal]
  /// {@template table_grid_mode_normal}
  /// Basic mode with most functions not limited, such as editing and selection.
  /// {@endtemplate}
  ///
  /// [TableGridMode.select], [TableGridMode.selectWithOneTap]
  /// {@template table_grid_mode_select}
  /// Mode for selecting one list from a specific list.
  /// Tap a row or press Enter to select the current row.
  ///
  /// [select]
  /// Call the [TableGrid.onSelected] callback when the selected row is tapped.
  /// To select an unselected row, select the row and then tap once more.
  /// [selectWithOneTap]
  /// Same as [select], but calls [TableGrid.onSelected] with one tap.
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
  /// [TableGridMode.popup]
  /// {@template table_grid_mode_popup}
  /// This is a mode for popup type.
  /// It is used when calling a popup for filtering or column setting
  /// inside [TableGrid], and it is not a mode for users.
  ///
  /// If the user wants to run [TableGrid] as a popup,
  /// use [TableGridPopup] or [TableGridDualGridPopup].
  /// {@endtemplate}
  final TableGridMode? mode;

  /// [setDefaultLocale] sets locale when [Intl] package is used in [TableGrid].
  ///
  /// {@template intl_default_locale}
  /// ```dart
  /// TableGrid.setDefaultLocale('es_ES');
  /// TableGrid.initializeDateFormat();
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
  TableGridState createState() => TableGridState();
}

class TableGridState extends TableStateWithChange<TableGrid> {
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

  late final TableGridStateManager _stateManager;

  late final TableGridKeyManager _keyManager;

  late final TableGridEventManager _eventManager;

  @override
  TableGridStateManager get stateManager => _stateManager;

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
    _stateManager = TableGridStateManager(
      columns: widget.columns,
      rows: widget.rows,
      gridFocusNode: _gridFocusNode,
      scroll: TableGridScrollController(
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
    _keyManager = TableGridKeyManager(
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
    _eventManager = TableGridEventManager(
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
      widget.onLoaded!(TableGridOnLoadedEvent(
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

    if (_header is TablePagination || _footer is TablePagination) {
      _stateManager.setPage(1, notify: false);
    }
  }

  KeyEventResult _handleGridFocusOnKey(FocusNode focusNode, RawKeyEvent event) {
    if (_keyManager.eventResult.isSkip == false) {
      _keyManager.subject.add(TableKeyManagerEvent(
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
            delegate: TableGridLayoutDelegate(_stateManager),
            children: [
              /// Body columns and rows.
              LayoutId(
                id: _StackName.bodyRows,
                child: TableBodyRows(_stateManager),
              ),
              LayoutId(
                id: _StackName.bodyColumns,
                child: TableBodyColumns(_stateManager),
              ),

              /// Body columns footer.
              if (showColumnFooter)
                LayoutId(
                  id: _StackName.bodyColumnFooters,
                  child: TableBodyColumnsFooter(stateManager),
                ),

              /// Left columns and rows.
              if (showLeftFrozen) ...[
                LayoutId(
                  id: _StackName.leftFrozenColumns,
                  child: TableLeftFrozenColumns(_stateManager),
                ),
                LayoutId(
                    id: _StackName.leftFrozenRows,
                    child: TableLeftFrozenRows(_stateManager)),
                LayoutId(
                  id: _StackName.leftFrozenDivider,
                  child: TableShadowLine(
                    axis: Axis.vertical,
                    color: style.gridBorderColor,
                    shadow: style.enableGridBorderShadow,
                  ),
                ),
                if (showColumnFooter)
                  LayoutId(
                    id: _StackName.leftFrozenColumnFooters,
                    child: TableLeftFrozenColumnsFooter(stateManager),
                  ),
              ],

              /// Right columns and rows.
              if (showRightFrozen) ...[
                LayoutId(
                  id: _StackName.rightFrozenColumns,
                  child: TableRightFrozenColumns(_stateManager),
                ),
                LayoutId(
                    id: _StackName.rightFrozenRows,
                    child: TableRightFrozenRows(_stateManager)),
                LayoutId(
                  id: _StackName.rightFrozenDivider,
                  child: TableShadowLine(
                    axis: Axis.vertical,
                    color: style.gridBorderColor,
                    shadow: style.enableGridBorderShadow,
                    reverse: true,
                  ),
                ),
                if (showColumnFooter)
                  LayoutId(
                    id: _StackName.rightFrozenColumnFooters,
                    child: TableRightFrozenColumnsFooter(stateManager),
                  ),
              ],

              /// Column and row divider.
              if (showColumnRowDivider)
                LayoutId(
                  id: _StackName.columnRowDivider,
                  child: TableShadowLine(
                    axis: Axis.horizontal,
                    color: style.gridBorderColor,
                    shadow: style.enableGridBorderShadow,
                  ),
                ),

              /// Header and divider.
              if (_stateManager.showHeader) ...[
                LayoutId(
                  id: _StackName.headerDivider,
                  child: TableShadowLine(
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
                  child: TableShadowLine(
                    axis: Axis.horizontal,
                    color: style.gridBorderColor,
                    shadow: style.enableGridBorderShadow,
                  ),
                ),

              /// Footer and divider.
              if (_stateManager.showFooter) ...[
                LayoutId(
                  id: _StackName.footerDivider,
                  child: TableShadowLine(
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
                  child: TableLoading(
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

class TableGridLayoutDelegate extends MultiChildLayoutDelegate {
  final TableGridStateManager _stateManager;

  TableGridLayoutDelegate(this._stateManager)
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
          Size(size.width, TableGridSettings.gridBorderWidth),
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
          Size(size.width, TableGridSettings.gridBorderWidth),
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
            TableGridSettings.gridBorderWidth,
            size.height - columnsTopOffset - bodyRowsBottomOffset,
          ),
        ),
      );

      final double posX = isLTR
          ? bodyLeftOffset
          : size.width - bodyRightOffset - TableGridSettings.gridBorderWidth;

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

      final double posX =
          isLTR ? size.width - s.width + TableGridSettings.gridBorderWidth : 0;

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
            TableGridSettings.gridBorderWidth,
            size.height - columnsTopOffset - bodyRowsBottomOffset,
          ),
        ),
      );

      final double posX = isLTR
          ? size.width - bodyRightOffset - TableGridSettings.gridBorderWidth
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
          Size(size.width, TableGridSettings.gridBorderWidth),
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
          Size(size.width, TableGridSettings.gridBorderWidth),
        ),
      );

      positionChild(
        _StackName.columnRowDivider,
        Offset(0, bodyRowsTopOffset),
      );

      bodyRowsTopOffset += s.height;
    } else {
      bodyRowsTopOffset += TableGridSettings.gridBorderWidth;
    }

    if (hasChild(_StackName.leftFrozenRows)) {
      final double offset = isLTR ? bodyLeftOffset : bodyRightOffset;
      final double posX = isLTR
          ? 0
          : size.width - bodyRightOffset + TableGridSettings.gridBorderWidth;

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
          : size.width - bodyRightOffset + TableGridSettings.gridBorderWidth;

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
          ? size.width - bodyRightOffset + TableGridSettings.gridBorderWidth
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

      final double posX =
          isLTR ? size.width - s.width + TableGridSettings.gridBorderWidth : 0;

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
  final TableGridStateManager stateManager;

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
        behavior: const TableScrollBehavior().copyWith(
          scrollbars: false,
        ),
        child: Container(
          padding: const EdgeInsets.all(TableGridSettings.gridPadding),
          decoration: BoxDecoration(
            color: style.gridBackgroundColor,
            borderRadius: style.gridBorderRadius,
            border: Border.all(
              color: style.gridBorderColor,
              width: TableGridSettings.gridBorderWidth,
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

class TableGridOnLoadedEvent {
  final TableGridStateManager stateManager;

  const TableGridOnLoadedEvent({
    required this.stateManager,
  });
}

/// Event called when the value of [TableViewCell] is changed.
///
/// Notice.
/// [columnIdx], [rowIdx] are the values in the current screen state.
/// Values in their current state, not actual data values
/// with filtering, sorting, or pagination applied.
/// This value is from
/// [TableGridStateManager.columns] and [TableGridStateManager.rows].
///
/// All data is in
/// [TableGridStateManager.refColumns.originalList]
/// [TableGridStateManager.refRows.originalList]
class TableGridOnChangedEvent {
  final int? columnIdx;
  final TableViewColumn? column;
  final int? rowIdx;
  final TableViewRow? row;
  final dynamic value;
  final dynamic oldValue;

  TableGridOnChangedEvent({
    this.columnIdx,
    this.column,
    this.rowIdx,
    this.row,
    this.value,
    this.oldValue,
  });

  @override
  String toString() {
    String out = '[TableOnChangedEvent] ';
    out += 'ColumnIndex : $columnIdx, RowIndex : $rowIdx\n';
    out += '::: oldValue : $oldValue\n';
    out += '::: newValue : $value';
    return out;
  }
}

class TableGridOnSelectedEvent {
  final TableViewRow? row;
  final int? rowIdx;
  final TableViewCell? cell;

  TableGridOnSelectedEvent({
    this.row,
    this.rowIdx,
    this.cell,
  });
}

class TableGridOnSortedEvent {
  final TableViewColumn column;

  final TableColumnSort oldSort;

  TableGridOnSortedEvent({
    required this.column,
    required this.oldSort,
  });

  @override
  String toString() {
    return '[TableGridOnSortedEvent] ${column.title} (changed: ${column.sort}, old: $oldSort)';
  }
}

abstract class TableGridOnRowCheckedEvent {
  bool get isAll => runtimeType == TableGridOnRowCheckedAllEvent;

  bool get isRow => runtimeType == TableGridOnRowCheckedOneEvent;

  final TableViewRow? row;
  final int? rowIdx;
  final bool? isChecked;

  TableGridOnRowCheckedEvent({
    this.row,
    this.rowIdx,
    this.isChecked,
  });

  @override
  String toString() {
    String checkMessage = isAll ? 'All rows ' : 'RowIdx $rowIdx ';
    checkMessage += isChecked == true ? 'checked' : 'unchecked';
    return '[TableGridOnRowCheckedEvent] $checkMessage';
  }
}

class TableGridOnRowDoubleTapEvent {
  final TableViewRow? row;
  final int? rowIdx;
  final TableViewCell? cell;

  TableGridOnRowDoubleTapEvent({
    this.row,
    this.rowIdx,
    this.cell,
  });
}

class TableGridOnRowSecondaryTapEvent {
  final TableViewRow? row;
  final int? rowIdx;
  final TableViewCell? cell;
  final Offset? offset;

  TableGridOnRowSecondaryTapEvent({
    this.row,
    this.rowIdx,
    this.cell,
    this.offset,
  });
}

class TableGridOnRowsMovedEvent {
  final int? idx;
  final List<TableViewRow?>? rows;

  TableGridOnRowsMovedEvent({
    required this.idx,
    required this.rows,
  });
}

class TableGridOnRowCheckedOneEvent extends TableGridOnRowCheckedEvent {
  TableGridOnRowCheckedOneEvent({
    TableViewRow? row,
    int? rowIdx,
    bool? isChecked,
  }) : super(row: row, rowIdx: rowIdx, isChecked: isChecked);
}

class TableGridOnRowCheckedAllEvent extends TableGridOnRowCheckedEvent {
  TableGridOnRowCheckedAllEvent({
    bool? isChecked,
  }) : super(row: null, rowIdx: null, isChecked: isChecked);
}

class TableScrollBehavior extends MaterialScrollBehavior {
  const TableScrollBehavior() : super();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class TableRowColorContext {
  final TableViewRow row;

  final int rowIdx;

  final TableGridStateManager stateManager;

  TableRowColorContext({
    required this.row,
    required this.rowIdx,
    required this.stateManager,
  });
}

class TableOptional<T> {
  TableOptional(this.value);

  final T? value;
}

enum TableGridMode {
  /// {@macro table_grid_mode_normal}
  normal,

  /// {@macro table_grid_mode_select}
  select,

  /// {@macro table_grid_mode_select}
  selectWithOneTap,

  /// {@macro table_grid_mode_popup}
  popup,
}

extension TableGridModeExtension on TableGridMode? {
  bool get isNormal => this == TableGridMode.normal;

  bool get isSelect =>
      this == TableGridMode.select || this == TableGridMode.selectWithOneTap;

  bool get isSelectModeWithOneTap => this == TableGridMode.selectWithOneTap;

  bool get isPopup => this == TableGridMode.popup;
}

class TableGridSettings {
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
      TableGridSettings.shadowLineSize * 2;

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
