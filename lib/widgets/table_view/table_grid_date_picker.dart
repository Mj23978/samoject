import 'dart:async';
import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'helper/table_date_time_helper.dart';
import 'helper/table_move_direction.dart';
import 'helper/table_size_helper.dart';
import 'manager/event/table_grid_cannot_move_current_cell_event.dart';
import 'manager/event/table_grid_event.dart';
import 'manager/table_grid_state_manager.dart';
import 'model/table_cell.dart';
import 'model/table_column.dart';
import 'model/table_column_type.dart';
import 'model/table_row.dart';
import 'table_grid.dart';
import 'table_grid_configuration.dart';
import 'table_grid_popup.dart';
import 'ui/ui.dart';

/// [TableGridDatePicker] Calls the popup for date selection.
/// Select the date by using the keyboard action of [TableGrid].
class TableGridDatePicker {
  final BuildContext context;

  final intl.DateFormat dateFormat;

  final intl.DateFormat headerDateFormat;

  final DateTime? initDate;

  final DateTime? startDate;

  final DateTime? endDate;

  final TableOnLoadedEventCallback? onLoaded;

  final TableOnSelectedEventCallback? onSelected;

  final double itemHeight;

  final TableGridConfiguration configuration;

  TableGridDatePicker({
    required this.context,
    required this.dateFormat,
    required this.headerDateFormat,
    this.initDate,
    this.startDate,
    this.endDate,
    this.onLoaded,
    this.onSelected,
    this.itemHeight = TableGridSettings.rowTotalHeight,
    this.configuration = const TableGridConfiguration(),
  }) {
    open();
  }

  static double dateCellWidth = 45.0;

  late final TableGridStateManager datePickerStateManager;

  late final StreamSubscription keyboardStream;

  late int currentYear;

  late int currentMonth;

  Future<void> open() async {
    double rowsHeight = 6 * itemHeight;

    // itemHeight * 2 = Header Height + Column Height
    double popupHeight = (itemHeight * 2) +
        rowsHeight +
        TableGridSettings.totalShadowLineWidth +
        TableGridSettings.gridInnerSpacing;

    final popupColumns = _buildColumns();

    final defaultDate = _getDefaultDate();

    currentYear = defaultDate.year;

    currentMonth = defaultDate.month;

    final List<DateTime> days = TableDateTimeHelper.getDaysInBetween(
      DateTime(defaultDate.year, defaultDate.month, 1),
      DateTime(defaultDate.year, defaultDate.month + 1, 0),
    );

    final popupRows = _buildRows(days);

    TableGridPopup(
      context: context,
      mode: TableGridMode.select,
      onLoaded: _onLoaded,
      onSelected: _onSelected,
      columns: popupColumns,
      rows: popupRows,
      width: popupColumns.fold<double>(0, (previous, column) {
            return previous + column.width;
          }) +
          1,
      height: popupHeight,
      createHeader: _createHeader,
      configuration: configuration.copyWith(
        style: configuration.style.copyWith(
          enableColumnBorderVertical: false,
          enableColumnBorderHorizontal: false,
          enableCellBorderVertical: false,
          enableCellBorderHorizontal: false,
          enableRowColorAnimation: false,
          oddRowColor: TableOptional(null),
          evenRowColor: TableOptional(null),
          activatedColor: configuration.style.gridBackgroundColor,
          gridBorderColor: configuration.style.gridBackgroundColor,
          borderColor: configuration.style.gridBackgroundColor,
          activatedBorderColor: configuration.style.gridBackgroundColor,
          inactivatedBorderColor: configuration.style.gridBackgroundColor,
          rowHeight: configuration.style.rowHeight,
          defaultColumnTitlePadding: TableGridSettings.columnTitlePadding,
          defaultCellPadding: const EdgeInsets.symmetric(horizontal: 3),
          gridBorderRadius: configuration.style.gridPopupBorderRadius,
        ),
        columnSize: const TableGridColumnSizeConfig(
          autoSizeMode: TableAutoSizeMode.none,
          resizeMode: TableResizeMode.none,
        ),
      ),
    );
  }

  void keyboardListener(TableGridEvent event) {
    if (event is! TableGridCannotMoveCurrentCellEvent) {
      return;
    }

    switch (event.direction) {
      case TableMoveDirection.left:
        _updateRows(-12);
        break;
      case TableMoveDirection.right:
        _updateRows(12);
        break;
      case TableMoveDirection.up:
        _updateRows(-1);
        break;
      case TableMoveDirection.down:
        _updateRows(1);
        break;
    }
  }

  void _onLoaded(TableGridOnLoadedEvent event) {
    datePickerStateManager = event.stateManager;

    datePickerStateManager.setSelectingMode(TableGridSelectingMode.none);

    keyboardStream = datePickerStateManager.eventManager!.listener(
      keyboardListener,
    );

    if (initDate != null) {
      final rows = datePickerStateManager.rows;

      final initDateString = dateFormat.format(initDate!);

      for (var i = 0; i < rows.length; i += 1) {
        for (var entry in rows[i].cells.entries) {
          if (rows[i].cells[entry.key]!.value == initDateString) {
            datePickerStateManager.setCurrentCell(
                datePickerStateManager.refRows[i].cells[entry.key], i);
            break;
          }
        }
      }
    }

    if (onLoaded != null) {
      onLoaded!(event);
    }
  }

  void _onSelected(TableGridOnSelectedEvent event) {
    keyboardStream.cancel();

    if (onSelected != null) {
      onSelected!(event);
    }
  }

  DateTime _getDefaultDate() {
    DateTime defaultDate = DateTime.now();

    if (initDate != null && _isValidRange(initDate!)) {
      return initDate!;
    }

    if (startDate != null) {
      return startDate!;
    }

    if (endDate != null) {
      return endDate!;
    }

    return defaultDate;
  }

  void _updateRows(int offset) {
    final offsetDate = DateTime(currentYear, currentMonth + offset);

    if (false ==
        TableDateTimeHelper.isValidRangeInMonth(
          date: offsetDate,
          start: startDate,
          end: endDate,
        )) {
      return;
    }

    TableGridCellPosition? currentCellPosition =
        datePickerStateManager.currentCellPosition;

    TableGridCellPosition? cellPosition;

    currentYear = offsetDate.year;

    currentMonth = offsetDate.month;

    final List<DateTime> days = TableDateTimeHelper.getDaysInBetween(
      DateTime(offsetDate.year, offsetDate.month, 1),
      DateTime(offsetDate.year, offsetDate.month + 1, 0),
    );

    final popupRows = _buildRows(days);

    datePickerStateManager.removeAllRows(notify: false);

    datePickerStateManager.insertRows(0, popupRows, notify: false);

    switch (offset) {
      case -12:
        cellPosition = TableGridCellPosition(
          columnIdx: datePickerStateManager.refColumns.length - 1,
          rowIdx: min(currentCellPosition?.rowIdx ?? 0,
              datePickerStateManager.refRows.length - 1),
        );
        break;
      case 12:
        cellPosition = TableGridCellPosition(
          columnIdx: 0,
          rowIdx: min(currentCellPosition?.rowIdx ?? 0,
              datePickerStateManager.refRows.length - 1),
        );
        break;
      case -1:
        cellPosition = TableGridCellPosition(
          columnIdx: currentCellPosition?.columnIdx ?? 0,
          rowIdx: datePickerStateManager.refRows.length - 1,
        );
        break;
      case 1:
        cellPosition = TableGridCellPosition(
          columnIdx: currentCellPosition?.columnIdx ?? 0,
          rowIdx: 0,
        );
        break;
    }

    if (cellPosition != null) {
      final TableViewCell cell = datePickerStateManager
          .refRows[cellPosition.rowIdx!].cells.entries
          .elementAt(cellPosition.columnIdx!)
          .value;

      datePickerStateManager.setCurrentCell(
        cell,
        cellPosition.rowIdx,
        notify: false,
      );
    }

    datePickerStateManager.notifyListeners();
  }

  Widget _createHeader(TableGridStateManager? stateManager) {
    return _DateCellHeader(
      stateManager: stateManager!,
      dateFormat: dateFormat,
      headerDateFormat: headerDateFormat,
      changeMonth: (offset) => _updateRows(offset),
    );
  }

  String _dateFormatter(dynamic value) {
    if (value == null || value.toString().isEmpty) {
      return '';
    }

    var dateTime = dateFormat.parse(
      value.toString(),
    );

    return dateTime.day.toString();
  }

  bool _isValidRange(DateTime date) {
    return TableDateTimeHelper.isValidRange(
      date: date,
      start: startDate,
      end: endDate,
    );
  }

  Widget _cellRenderer(TableColumnRendererContext renderContext) {
    final cell = renderContext.cell;

    final isCurrentCell = renderContext.stateManager.isCurrentCell(cell);

    final isValidDate = cell.value.toString().isNotEmpty &&
        _isValidRange(dateFormat.parse(cell.value));

    final cellColor = isCurrentCell
        ? isValidDate
            ? configuration.style.activatedBorderColor
            : configuration.style.cellColorInReadOnlyState
        : configuration.style.gridBackgroundColor;

    final textColor = isCurrentCell
        ? configuration.style.gridBackgroundColor
        : isValidDate
            ? configuration.style.cellTextStyle.color
            : configuration.style.cellColorInReadOnlyState;

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: cellColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          _dateFormatter(cell.value),
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  List<TableViewColumn> _buildColumns() {
    final localeText = configuration.localeText;

    return [
      [localeText.sunday, '7'],
      [localeText.monday, '1'],
      [localeText.tuesday, '2'],
      [localeText.wednesday, '3'],
      [localeText.thursday, '4'],
      [localeText.friday, '5'],
      [localeText.saturday, '6'],
    ].map((e) {
      return TableViewColumn(
        title: e[0],
        field: e[1],
        readOnly: true,
        type: TableViewColumnType.text(),
        width: dateCellWidth,
        enableColumnDrag: false,
        enableSorting: false,
        enableContextMenu: false,
        enableDropToResize: false,
        textAlign: TableColumnTextAlign.center,
        titleTextAlign: TableColumnTextAlign.center,
        renderer: _cellRenderer,
      );
    }).toList(growable: false);
  }

  List<TableViewRow> _buildRows(List<DateTime> days) {
    List<TableViewRow> rows = [];

    while (days.isNotEmpty) {
      final Map<String, TableViewCell> cells = Map.fromIterable(
        <String>['7', '1', '2', '3', '4', '5', '6'],
        key: (dynamic e) => e.toString(),
        value: (dynamic e) {
          if (days.isEmpty) {
            return TableViewCell(value: '');
          }

          if (days.first.weekday.toString() != e) {
            return TableViewCell(value: '');
          }

          final DateTime day = days.removeAt(0);

          return TableViewCell(
            value: dateFormat.format(day),
          );
        },
      );

      rows.add(TableViewRow(cells: cells));
    }

    return rows;
  }
}

class _DateCellHeader extends TableStatefulWidget {
  final TableGridStateManager stateManager;

  final intl.DateFormat dateFormat;

  final intl.DateFormat headerDateFormat;

  final Function(int offset) changeMonth;

  const _DateCellHeader({
    required this.stateManager,
    required this.dateFormat,
    required this.headerDateFormat,
    required this.changeMonth,
  });

  @override
  _DateCellHeaderState createState() => _DateCellHeaderState();
}

abstract class _DateCellHeaderStateWithChange
    extends TableStateWithChange<_DateCellHeader> {
  TableViewCell? _currentCell;

  int _currentYear = 0;

  int _currentMonth = 0;

  late final ScrollController _scroll;

  @override
  TableGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    _scroll = stateManager.scroll!.horizontal!.addAndGet();

    updateState();
  }

  @override
  void dispose() {
    _scroll.dispose();

    super.dispose();
  }

  @override
  void updateState() {
    _currentCell = update<TableViewCell?>(
      _currentCell,
      stateManager.currentCell,
      compare: identical,
    );

    final date = widget.dateFormat.parse(
      stateManager.rows[1].cells.entries.first.value.value,
    );

    _currentYear = update<int>(
      _currentYear,
      date.year,
    );

    _currentMonth = update<int>(
      _currentMonth,
      date.month,
    );
  }
}

class _DateCellHeaderState extends _DateCellHeaderStateWithChange {
  Color? get textColor =>
      stateManager.configuration.style.columnTextStyle.color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: stateManager.rowTotalHeight,
      padding: TableGridSettings.cellPadding,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        controller: _scroll,
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              iconSize: stateManager.configuration.style.iconSize,
              onPressed: () => widget.changeMonth(-12),
              icon: Icon(
                Icons.navigate_before,
                color: stateManager.configuration.style.iconColor,
              ),
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              iconSize: stateManager.configuration.style.iconSize,
              onPressed: () => widget.changeMonth(12),
              icon: Icon(
                Icons.navigate_next,
                color: stateManager.configuration.style.iconColor,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              widget.headerDateFormat.format(
                DateTime(_currentYear, _currentMonth),
              ),
              style: TextStyle(
                color: textColor,
                fontSize:
                    stateManager.configuration.style.columnTextStyle.fontSize,
                fontWeight:
                    stateManager.configuration.style.columnTextStyle.fontWeight,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 10),
            RotatedBox(
              quarterTurns: 3,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                iconSize: stateManager.configuration.style.iconSize,
                onPressed: () => widget.changeMonth(-1),
                icon: Icon(
                  Icons.navigate_next,
                  color: stateManager.configuration.style.iconColor,
                ),
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                iconSize: stateManager.configuration.style.iconSize,
                onPressed: () => widget.changeMonth(1),
                icon: Icon(
                  Icons.navigate_before,
                  color: stateManager.configuration.style.iconColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
