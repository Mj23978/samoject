import 'dart:async';
import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../helper/filtered_list.dart';
import '../helper/show_column_menu.dart';
import '../model/table_column.dart';
import '../model/table_column_group.dart';
import '../model/table_column_type.dart';
import '../model/table_row.dart';
import '../table_grid.dart';
import '../table_grid_configuration.dart';
import '../widgets/table_linked_scroll_controller.dart';
import 'state/cell_state.dart';
import 'state/column_group_state.dart';
import 'state/column_sizing_state.dart';
import 'state/column_state.dart';
import 'state/dragging_row_state.dart';
import 'state/editing_state.dart';
import 'state/filtering_row_state.dart';
import 'state/focus_state.dart';
import 'state/grid_state.dart';
import 'state/keyboard_state.dart';
import 'state/layout_state.dart';
import 'state/pagination_row_state.dart';
import 'state/row_state.dart';
import 'state/scroll_state.dart';
import 'state/selecting_state.dart';
import 'state/visibility_layout_state.dart';
import 'table_change_notifier.dart';

abstract class ITableGridState
    implements
        TableChangeNotifier,
        ICellState,
        IColumnGroupState,
        IColumnSizingState,
        IColumnState,
        IDraggingRowState,
        IEditingState,
        IFilteringRowState,
        IFocusState,
        IGridState,
        IKeyboardState,
        ILayoutState,
        IPaginationRowState,
        IRowState,
        IScrollState,
        ISelectingState,
        IVisibilityLayoutState {}

class TableGridStateChangeNotifier extends TableChangeNotifier
    with
        CellState,
        ColumnGroupState,
        ColumnSizingState,
        ColumnState,
        DraggingRowState,
        EditingState,
        FilteringRowState,
        FocusState,
        GridState,
        KeyboardState,
        LayoutState,
        PaginationRowState,
        RowState,
        ScrollState,
        SelectingState,
        VisibilityLayoutState {}

/// It manages the state of the [TableGrid] and contains methods used by the grid.
///
/// An instance of [TableGridStateManager] can be returned
/// through the [onLoaded] callback of the [TableGrid] constructor.
/// ```dart
/// TableGridStateManager stateManager;
///
/// TableGrid(
///   onLoaded: (TableGridOnLoadedEvent event) => stateManager = event.stateManager,
/// )
/// ```
/// {@template initialize_rows_sync_or_async}
/// It is created when [TableGrid] is first created,
/// and the state required for the grid is set for `List<TableViewRow> rows`.
/// [TableGridStateManager.initializeRows], which operates at this time, works synchronously,
/// and if there are many rows, the UI may freeze when starting the grid.
///
/// To prevent UI from freezing when passing many rows to [TableGrid],
/// you can set rows asynchronously as follows.
/// After passing an empty list when creating [TableGrid],
/// add rows initialized with [initializeRowsAsync] as shown below.
///
/// ```dart
/// TableGridStateManager.initializeRowsAsync(
///   columns,
///   fetchedRows,
/// ).then((value) {
///   stateManager.refRows.addAll(FilteredList(initialList: value));
///   stateManager.notifyListeners();
/// });
/// {@endtemplate}
/// ```
class TableGridStateManager extends TableGridStateChangeNotifier {
  TableGridStateManager({
    required List<TableViewColumn> columns,
    required List<TableViewRow> rows,
    required FocusNode? gridFocusNode,
    required TableGridScrollController? scroll,
    List<TableViewColumnGroup>? columnGroups,
    TableGridMode? mode,
    TableOnChangedEventCallback? onChangedEventCallback,
    TableOnSelectedEventCallback? onSelectedEventCallback,
    TableOnSortedEventCallback? onSortedEventCallback,
    TableOnRowCheckedEventCallback? onRowCheckedEventCallback,
    TableOnRowDoubleTapEventCallback? onRowDoubleTapEventCallback,
    TableOnRowSecondaryTapEventCallback? onRowSecondaryTapEventCallback,
    TableOnRowsMovedEventCallback? onRowsMovedEventCallback,
    TableRowColorCallback? onRowColorCallback,
    TableColumnMenuDelegate? columnMenuDelegate,
    CreateHeaderCallBack? createHeader,
    CreateFooterCallBack? createFooter,
    TableGridConfiguration? configuration,
  }) {
    refColumns = FilteredList(initialList: columns);
    refColumnGroups = FilteredList(initialList: columnGroups);
    refRows = FilteredList(initialList: rows);
    setGridFocusNode(gridFocusNode);
    setScroll(scroll);
    setGridMode(mode);
    setOnChanged(onChangedEventCallback);
    setOnSelected(onSelectedEventCallback);
    setOnSorted(onSortedEventCallback);
    setOnRowChecked(onRowCheckedEventCallback);
    setOnRowDoubleTap(onRowDoubleTapEventCallback);
    setOnRowSecondaryTap(onRowSecondaryTapEventCallback);
    setOnRowsMoved(onRowsMovedEventCallback);
    setRowColorCallback(onRowColorCallback);
    setColumnMenuDelegate(columnMenuDelegate);
    setCreateHeader(createHeader);
    setCreateFooter(createFooter);
    setConfiguration(configuration);
    setShowColumnFooter(
      columns.any((element) => element.footerRenderer != null),
    );
    setGridKey(GlobalKey());
  }

  static List<TableGridSelectingMode> get selectingModes =>
      TableGridSelectingMode.values;

  /// It handles the necessary settings when [rows] are first set or added to the [TableGrid].
  ///
  /// {@template initialize_rows_params}
  /// [forceApplySortIdx] determines whether to force TableViewRow.sortIdx to be set.
  /// [TableViewRow.sortIdx] does not reset if the value is already set.
  /// Set [forceApplySortIdx] to true to reset this value.
  ///
  /// [increase] determines whether to increment or decrement when initializing [sortIdx].
  /// For example, if a row is added before an existing row,
  /// the [sortIdx] value should be set to a negative number than the row being added.
  ///
  /// [start] sets the starting value when initializing [sortIdx].
  /// For example, if sortIdx is set from 0 to 9 in the previous 10 rows,
  /// [start] is set to 10, which sets the sortIdx of the row added at the end.
  /// {@endtemplate}
  ///
  /// {@macro initialize_rows_sync_or_async}
  static List<TableViewRow> initializeRows(
    List<TableViewColumn> refColumns,
    List<TableViewRow> refRows, {
    bool forceApplySortIdx = false,
    bool increase = true,
    int start = 0,
  }) {
    if (refColumns.isEmpty || refRows.isEmpty) {
      return refRows;
    }

    _ApplyList applyList = _ApplyList([
      _ApplyCellForSetColumnRow(refColumns),
      _ApplyCellForFormat(refColumns),
      _ApplyRowForSortIdx(
        forceApply: forceApplySortIdx,
        increase: increase,
        start: start,
        firstRow: refRows.first,
      ),
    ]);

    if (!applyList.apply) {
      return refRows;
    }

    var rowLength = refRows.length;

    for (var rowIdx = 0; rowIdx < rowLength; rowIdx += 1) {
      applyList.execute(refRows[rowIdx]);
    }

    return refRows;
  }

  /// An asynchronous version of [TableGridStateManager.initializeRows].
  ///
  /// [TableGridStateManager.initializeRowsAsync] repeats [Timer] every [duration],
  /// Process the setting of [refRows] by the size of [chunkSize].
  /// [Isolate] is a good way to handle CPU heavy work, but
  /// The condition that List<TableViewRow> cannot be passed to Isolate
  /// solves the problem of UI freezing by dividing the work with Timer.
  ///
  /// {@macro initialize_rows_params}
  ///
  /// [chunkSize] determines the number of lists processed at one time when setting rows.
  ///
  /// [duration] determines the processing interval when setting rows.
  ///
  /// If pagination is set, [TableGridStateManager.setPage] must be called
  /// after Future is completed before Rows appear on the screen.
  ///
  /// ```dart
  /// TableGridStateManager.initializeRowsAsync(columns, fetchedRows).then((initializedRows) {
  ///   stateManager.refRows.addAll(FilteredList(initialList: initializedRows));
  ///   stateManager.setPage(1, notify: false);
  ///   stateManager.notifyListeners();
  /// });
  /// ```
  ///
  /// {@macro initialize_rows_sync_or_async}
  static Future<List<TableViewRow>> initializeRowsAsync(
    List<TableViewColumn> refColumns,
    List<TableViewRow> refRows, {
    bool forceApplySortIdx = false,
    bool increase = true,
    int start = 0,
    int chunkSize = 100,
    Duration duration = const Duration(milliseconds: 1),
  }) {
    if (refColumns.isEmpty || refRows.isEmpty) {
      return Future.value(refRows);
    }

    assert(chunkSize > 0);

    final Completer<List<TableViewRow>> completer = Completer();

    SplayTreeMap<int, List<TableViewRow>> splayMapRows = SplayTreeMap();

    final Iterable<List<TableViewRow>> chunks = refRows.slices(chunkSize);

    final chunksLength = chunks.length;

    final List<int> chunksIndexes = List.generate(
      chunksLength,
      (index) => index,
    );

    Timer.periodic(duration, (timer) {
      if (chunksIndexes.isEmpty) {
        return;
      }

      final chunkIndex = chunksIndexes.removeLast();

      final chunk = chunks.elementAt(chunkIndex);

      Future(() {
        return TableGridStateManager.initializeRows(
          refColumns,
          chunk,
          forceApplySortIdx: forceApplySortIdx,
          increase: increase,
          start: start + (chunkIndex * chunkSize),
        );
      }).then((value) {
        splayMapRows[chunkIndex] = value;

        if (splayMapRows.length == chunksLength) {
          completer.complete(
            splayMapRows.values.expand((element) => element).toList(),
          );

          timer.cancel();
        }
      });
    });

    return completer.future;
  }
}

/// This is a class for handling horizontal and vertical scrolling of columns and rows of [TableGrid].
class TableGridScrollController {
  LinkedScrollControllerGroup? vertical;

  LinkedScrollControllerGroup? horizontal;

  TableGridScrollController({
    this.vertical,
    this.horizontal,
  });

  ScrollController? get bodyRowsHorizontal => _bodyRowsHorizontal;

  ScrollController? _bodyRowsHorizontal;

  ScrollController? get bodyRowsVertical => _bodyRowsVertical;

  ScrollController? _bodyRowsVertical;

  double get maxScrollHorizontal {
    assert(_bodyRowsHorizontal != null);

    return _bodyRowsHorizontal!.position.maxScrollExtent;
  }

  double get maxScrollVertical {
    assert(_bodyRowsVertical != null);

    return _bodyRowsVertical!.position.maxScrollExtent;
  }

  double get verticalOffset => vertical!.offset;

  double get horizontalOffset => horizontal!.offset;

  void setBodyRowsHorizontal(ScrollController? scrollController) {
    _bodyRowsHorizontal = scrollController;
  }

  void setBodyRowsVertical(ScrollController? scrollController) {
    _bodyRowsVertical = scrollController;
  }
}

class TableGridCellPosition {
  int? columnIdx;
  int? rowIdx;

  TableGridCellPosition({
    this.columnIdx,
    this.rowIdx,
  });

  @override
  bool operator ==(covariant TableGridCellPosition other) {
    return columnIdx == other.columnIdx && rowIdx == other.rowIdx;
  }

  @override
  int get hashCode => Object.hash(columnIdx, rowIdx);
}

class TableGridSelectingCellPosition {
  String? field;
  int? rowIdx;

  TableGridSelectingCellPosition({
    this.field,
    this.rowIdx,
  });

  @override
  bool operator ==(covariant TableGridSelectingCellPosition other) {
    return field == other.field && rowIdx == other.rowIdx;
  }

  @override
  int get hashCode => Object.hash(field, rowIdx);
}

class TableGridKeyPressed {
  bool shift;

  bool ctrl;

  TableGridKeyPressed({
    this.shift = false,
    this.ctrl = false,
  });

  void reset() {
    shift = false;
    ctrl = false;
  }
}

/// A type of selection mode when you select a row or cell in a grid
/// by tapping and holding, then moving the pointer
/// or selecting a row or cell in the grid with controls or shift and tap.
///
/// [TableGridSelectingMode.cell] selects each cell.
///
/// [TableGridSelectingMode.row] selects row by row.
///
/// [TableGridSelectingMode.none] does nothing.
enum TableGridSelectingMode {
  cell,
  row,
  none,

  /// using only internal
  horizontal;

  bool get isCell => this == TableGridSelectingMode.cell;

  bool get isRow => this == TableGridSelectingMode.row;

  bool get isNone => this == TableGridSelectingMode.none;

  /// using only internal
  bool get isHorizontal => this == TableGridSelectingMode.horizontal;
}

abstract class _Apply {
  bool get apply;

  void execute(TableViewRow row);
}

class _ApplyList implements _Apply {
  final List<_Apply> list;

  _ApplyList(this.list) {
    list.removeWhere((element) => !element.apply);
  }

  @override
  bool get apply => list.isNotEmpty;

  @override
  void execute(TableViewRow row) {
    var len = list.length;

    for (var i = 0; i < len; i += 1) {
      list[i].execute(row);
    }
  }
}

class _ApplyCellForSetColumnRow implements _Apply {
  final List<TableViewColumn> refColumns;

  _ApplyCellForSetColumnRow(this.refColumns);

  @override
  bool get apply => true;

  @override
  void execute(TableViewRow row) {
    for (var element in refColumns) {
      row.cells[element.field]!
        ..setColumn(element)
        ..setRow(row);
    }
  }
}

class _ApplyCellForFormat implements _Apply {
  final List<TableViewColumn> refColumns;

  _ApplyCellForFormat(
    this.refColumns,
  ) {
    assert(refColumns.isNotEmpty);

    columnsToApply = refColumns.where(
      (element) => element.type.applyFormatOnInit,
    );
  }

  late Iterable<TableViewColumn> columnsToApply;

  @override
  bool get apply => columnsToApply.isNotEmpty;

  @override
  void execute(TableViewRow row) {
    for (var column in columnsToApply) {
      var value = column.type.applyFormat(row.cells[column.field]!.value);

      if (column.type is TableColumnTypeWithNumberFormat) {
        value =
            (column.type as TableColumnTypeWithNumberFormat).toNumber(value);
      }

      row.cells[column.field]!.value = value;
    }
  }
}

class _ApplyRowForSortIdx implements _Apply {
  final bool forceApply;

  final bool increase;

  final int start;

  final TableViewRow? firstRow;

  _ApplyRowForSortIdx({
    required this.forceApply,
    required this.increase,
    required this.start,
    required this.firstRow,
  }) {
    assert(firstRow != null);

    _sortIdx = start;
  }

  late int _sortIdx;

  @override
  bool get apply => forceApply == true || firstRow!.sortIdx == null;

  @override
  void execute(TableViewRow? row) {
    row!.sortIdx = _sortIdx;

    _sortIdx = increase ? ++_sortIdx : --_sortIdx;
  }
}
