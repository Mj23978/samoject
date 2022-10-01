import 'dart:async';
import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'helper/samoject_list_date_time_helper.dart';
import 'helper/samoject_list_move_direction.dart';
import 'helper/samoject_list_size_helper.dart';
import 'manager/event/samoject_list_grid_cannot_move_current_cell_event.dart';
import 'manager/event/samoject_list_grid_event.dart';
import 'manager/samoject_list_grid_state_manager.dart';
import 'model/samoject_list_cell.dart';
import 'model/samoject_list_column.dart';
import 'model/samoject_list_column_type.dart';
import 'model/samoject_list_row.dart';
import 'samoject_list_grid.dart';
import 'samoject_list_grid_configuration.dart';
import 'samoject_list_grid_popup.dart';
import 'ui/ui.dart';

/// [SamojectListGridDatePicker] Calls the popup for date selection.
/// Select the date by using the keyboard action of [SamojectListGrid].
class SamojectListGridDatePicker {
  final BuildContext context;

  final intl.DateFormat dateFormat;

  final intl.DateFormat headerDateFormat;

  final DateTime? initDate;

  final DateTime? startDate;

  final DateTime? endDate;

  final SamojectListOnLoadedEventCallback? onLoaded;

  final SamojectListOnSelectedEventCallback? onSelected;

  final double itemHeight;

  final SamojectListGridConfiguration configuration;

  SamojectListGridDatePicker({
    required this.context,
    required this.dateFormat,
    required this.headerDateFormat,
    this.initDate,
    this.startDate,
    this.endDate,
    this.onLoaded,
    this.onSelected,
    this.itemHeight = SamojectListGridSettings.rowTotalHeight,
    this.configuration = const SamojectListGridConfiguration(),
  }) {
    open();
  }

  static double dateCellWidth = 45.0;

  late final SamojectListGridStateManager datePickerStateManager;

  late final StreamSubscription keyboardStream;

  late int currentYear;

  late int currentMonth;

  Future<void> open() async {
    double rowsHeight = 6 * itemHeight;

    // itemHeight * 2 = Header Height + Column Height
    double popupHeight = (itemHeight * 2) +
        rowsHeight +
        SamojectListGridSettings.totalShadowLineWidth +
        SamojectListGridSettings.gridInnerSpacing;

    final popupColumns = _buildColumns();

    final defaultDate = _getDefaultDate();

    currentYear = defaultDate.year;

    currentMonth = defaultDate.month;

    final List<DateTime> days = SamojectListDateTimeHelper.getDaysInBetween(
      DateTime(defaultDate.year, defaultDate.month, 1),
      DateTime(defaultDate.year, defaultDate.month + 1, 0),
    );

    final popupRows = _buildRows(days);

    SamojectListGridPopup(
      context: context,
      mode: SamojectListGridMode.select,
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
          oddRowColor: SamojectListOptional(null),
          evenRowColor: SamojectListOptional(null),
          activatedColor: configuration.style.gridBackgroundColor,
          gridBorderColor: configuration.style.gridBackgroundColor,
          borderColor: configuration.style.gridBackgroundColor,
          activatedBorderColor: configuration.style.gridBackgroundColor,
          inactivatedBorderColor: configuration.style.gridBackgroundColor,
          rowHeight: configuration.style.rowHeight,
          defaultColumnTitlePadding:
              SamojectListGridSettings.columnTitlePadding,
          defaultCellPadding: const EdgeInsets.symmetric(horizontal: 3),
          gridBorderRadius: configuration.style.gridPopupBorderRadius,
        ),
        columnSize: const SamojectListGridColumnSizeConfig(
          autoSizeMode: SamojectListAutoSizeMode.none,
          resizeMode: SamojectListResizeMode.none,
        ),
      ),
    );
  }

  void keyboardListener(SamojectListGridEvent event) {
    if (event is! SamojectListGridCannotMoveCurrentCellEvent) {
      return;
    }

    switch (event.direction) {
      case SamojectListMoveDirection.left:
        _updateRows(-12);
        break;
      case SamojectListMoveDirection.right:
        _updateRows(12);
        break;
      case SamojectListMoveDirection.up:
        _updateRows(-1);
        break;
      case SamojectListMoveDirection.down:
        _updateRows(1);
        break;
    }
  }

  void _onLoaded(SamojectListGridOnLoadedEvent event) {
    datePickerStateManager = event.stateManager;

    datePickerStateManager.setSelectingMode(SamojectListGridSelectingMode.none);

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

  void _onSelected(SamojectListGridOnSelectedEvent event) {
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
        SamojectListDateTimeHelper.isValidRangeInMonth(
          date: offsetDate,
          start: startDate,
          end: endDate,
        )) {
      return;
    }

    SamojectListGridCellPosition? currentCellPosition =
        datePickerStateManager.currentCellPosition;

    SamojectListGridCellPosition? cellPosition;

    currentYear = offsetDate.year;

    currentMonth = offsetDate.month;

    final List<DateTime> days = SamojectListDateTimeHelper.getDaysInBetween(
      DateTime(offsetDate.year, offsetDate.month, 1),
      DateTime(offsetDate.year, offsetDate.month + 1, 0),
    );

    final popupRows = _buildRows(days);

    datePickerStateManager.removeAllRows(notify: false);

    datePickerStateManager.insertRows(0, popupRows, notify: false);

    switch (offset) {
      case -12:
        cellPosition = SamojectListGridCellPosition(
          columnIdx: datePickerStateManager.refColumns.length - 1,
          rowIdx: min(currentCellPosition?.rowIdx ?? 0,
              datePickerStateManager.refRows.length - 1),
        );
        break;
      case 12:
        cellPosition = SamojectListGridCellPosition(
          columnIdx: 0,
          rowIdx: min(currentCellPosition?.rowIdx ?? 0,
              datePickerStateManager.refRows.length - 1),
        );
        break;
      case -1:
        cellPosition = SamojectListGridCellPosition(
          columnIdx: currentCellPosition?.columnIdx ?? 0,
          rowIdx: datePickerStateManager.refRows.length - 1,
        );
        break;
      case 1:
        cellPosition = SamojectListGridCellPosition(
          columnIdx: currentCellPosition?.columnIdx ?? 0,
          rowIdx: 0,
        );
        break;
    }

    if (cellPosition != null) {
      final SamojectListCell cell = datePickerStateManager
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

  Widget _createHeader(SamojectListGridStateManager? stateManager) {
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
    return SamojectListDateTimeHelper.isValidRange(
      date: date,
      start: startDate,
      end: endDate,
    );
  }

  Widget _cellRenderer(SamojectListColumnRendererContext renderContext) {
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

  List<SamojectListColumn> _buildColumns() {
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
      return SamojectListColumn(
        title: e[0],
        field: e[1],
        readOnly: true,
        type: SamojectListColumnType.text(),
        width: dateCellWidth,
        enableColumnDrag: false,
        enableSorting: false,
        enableContextMenu: false,
        enableDropToResize: false,
        textAlign: SamojectListColumnTextAlign.center,
        titleTextAlign: SamojectListColumnTextAlign.center,
        renderer: _cellRenderer,
      );
    }).toList(growable: false);
  }

  List<SamojectListRow> _buildRows(List<DateTime> days) {
    List<SamojectListRow> rows = [];

    while (days.isNotEmpty) {
      final Map<String, SamojectListCell> cells = Map.fromIterable(
        <String>['7', '1', '2', '3', '4', '5', '6'],
        key: (dynamic e) => e.toString(),
        value: (dynamic e) {
          if (days.isEmpty) {
            return SamojectListCell(value: '');
          }

          if (days.first.weekday.toString() != e) {
            return SamojectListCell(value: '');
          }

          final DateTime day = days.removeAt(0);

          return SamojectListCell(
            value: dateFormat.format(day),
          );
        },
      );

      rows.add(SamojectListRow(cells: cells));
    }

    return rows;
  }
}

class _DateCellHeader extends SamojectListStatefulWidget {
  final SamojectListGridStateManager stateManager;

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
    extends SamojectListStateWithChange<_DateCellHeader> {
  SamojectListCell? _currentCell;

  int _currentYear = 0;

  int _currentMonth = 0;

  late final ScrollController _scroll;

  @override
  SamojectListGridStateManager get stateManager => widget.stateManager;

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
    _currentCell = update<SamojectListCell?>(
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
      padding: SamojectListGridSettings.cellPadding,
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
