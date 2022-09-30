import 'package:flutter/material.dart';

import '../../helper/table_move_direction.dart';
import '../../helper/table_size_helper.dart';
import '../../manager/table_grid_state_manager.dart';
import '../../model/table_cell.dart';
import '../../model/table_column.dart';
import '../../model/table_column_type.dart';
import '../../model/table_row.dart';
import '../../table_dual_grid.dart';
import '../../table_dual_grid_popup.dart';
import '../../table_grid.dart';
import '../../table_grid_configuration.dart';
import 'popup_cell.dart';

class TableTimeCell extends StatefulWidget implements PopupCell {
  @override
  final TableGridStateManager stateManager;

  @override
  final TableViewCell cell;

  @override
  final TableViewColumn column;

  @override
  final TableViewRow row;

  const TableTimeCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  TableTimeCellState createState() => TableTimeCellState();
}

class TableTimeCellState extends State<TableTimeCell>
    with PopupCellState<TableTimeCell> {
  TableGridStateManager? popupStateManager;

  @override
  List<TableViewColumn> popupColumns = [];

  @override
  List<TableViewRow> popupRows = [];

  @override
  Icon? icon = const Icon(
    Icons.access_time,
  );

  String get cellValue =>
      widget.cell.value ?? widget.column.type.time.defaultValue;

  String get cellHour => cellValue.toString().substring(0, 2);

  String get cellMinute => cellValue.toString().substring(3, 5);

  @override
  void openPopup() {
    if (widget.column.readOnly) {
      return;
    }

    isOpenedPopup = true;

    final localeText = widget.stateManager.localeText;

    final style = widget.stateManager.style;

    final configuration = widget.stateManager.configuration.copyWith(
      style: style.copyWith(
        enableColumnBorderVertical: false,
        enableColumnBorderHorizontal: false,
        enableCellBorderVertical: false,
        enableCellBorderHorizontal: false,
        enableRowColorAnimation: false,
        oddRowColor: TableOptional(null),
        evenRowColor: TableOptional(null),
        activatedColor: style.gridBackgroundColor,
        gridBorderColor: style.gridBackgroundColor,
        borderColor: style.gridBackgroundColor,
        activatedBorderColor: style.gridBackgroundColor,
        inactivatedBorderColor: style.gridBackgroundColor,
        rowHeight: style.rowHeight,
        defaultColumnTitlePadding: TableGridSettings.columnTitlePadding,
        defaultCellPadding: const EdgeInsets.symmetric(horizontal: 3),
        gridBorderRadius: style.gridPopupBorderRadius,
      ),
      columnSize: const TableGridColumnSizeConfig(
        autoSizeMode: TableAutoSizeMode.none,
        resizeMode: TableResizeMode.none,
      ),
    );

    TableDualGridPopup(
      context: context,
      onSelected: (TableDualOnSelectedEvent event) {
        isOpenedPopup = false;

        if (event.gridA == null || event.gridB == null) {
          widget.stateManager.setKeepFocus(true);
          textFocus.requestFocus();
          return;
        }

        super.handleSelected(
          '${event.gridA!.cell!.value}:'
          '${event.gridB!.cell!.value}',
        );
      },
      gridPropsA: TableDualGridProps(
        columns: [
          TableViewColumn(
            title: localeText.hour,
            field: 'hour',
            readOnly: true,
            type: TableViewColumnType.text(),
            enableSorting: false,
            enableColumnDrag: false,
            enableContextMenu: false,
            enableDropToResize: false,
            textAlign: TableColumnTextAlign.center,
            titleTextAlign: TableColumnTextAlign.center,
            width: 134,
            renderer: _cellRenderer,
          ),
        ],
        rows: Iterable<int>.generate(24)
            .map((hour) => TableViewRow(cells: {
                  'hour': TableViewCell(
                    value: hour.toString().padLeft(2, '0'),
                  ),
                }))
            .toList(growable: false),
        onLoaded: (TableGridOnLoadedEvent event) {
          final stateManager = event.stateManager;
          final rows = stateManager.refRows;
          final length = rows.length;

          stateManager.setSelectingMode(TableGridSelectingMode.none);

          for (var i = 0; i < length; i += 1) {
            if (rows[i].cells['hour']!.value == cellHour) {
              stateManager.setCurrentCell(rows[i].cells['hour'], i);

              stateManager.moveScrollByRow(
                TableMoveDirection.up,
                i + 1 + offsetOfScrollRowIdx,
              );

              return;
            }
          }
        },
        configuration: configuration,
      ),
      gridPropsB: TableDualGridProps(
        columns: [
          TableViewColumn(
            title: localeText.minute,
            field: 'minute',
            readOnly: true,
            type: TableViewColumnType.text(),
            enableSorting: false,
            enableColumnDrag: false,
            enableContextMenu: false,
            enableDropToResize: false,
            textAlign: TableColumnTextAlign.center,
            titleTextAlign: TableColumnTextAlign.center,
            width: 134,
            renderer: _cellRenderer,
          ),
        ],
        rows: Iterable<int>.generate(60)
            .map((minute) => TableViewRow(cells: {
                  'minute': TableViewCell(
                    value: minute.toString().padLeft(2, '0'),
                  ),
                }))
            .toList(growable: false),
        onLoaded: (TableGridOnLoadedEvent event) {
          final stateManager = event.stateManager;
          final rows = stateManager.refRows;
          final length = rows.length;

          stateManager.setSelectingMode(TableGridSelectingMode.none);

          for (var i = 0; i < length; i += 1) {
            if (rows[i].cells['minute']!.value == cellMinute) {
              stateManager.setCurrentCell(rows[i].cells['minute'], i);

              stateManager.moveScrollByRow(
                TableMoveDirection.up,
                i + 1 + offsetOfScrollRowIdx,
              );

              return;
            }
          }
        },
        configuration: configuration,
      ),
      mode: TableGridMode.select,
      width: 276,
      height: 300,
      divider: const TableDualGridDivider(
        show: false,
      ),
    );
  }

  Widget _cellRenderer(TableColumnRendererContext renderContext) {
    final cell = renderContext.cell;

    final isCurrentCell = renderContext.stateManager.isCurrentCell(cell);

    final cellColor = isCurrentCell && renderContext.stateManager.hasFocus
        ? widget.stateManager.style.activatedBorderColor
        : widget.stateManager.style.gridBackgroundColor;

    final textColor = isCurrentCell && renderContext.stateManager.hasFocus
        ? widget.stateManager.style.gridBackgroundColor
        : widget.stateManager.style.cellTextStyle.color;

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: cellColor,
        shape: BoxShape.circle,
        border: !isCurrentCell
            ? null
            : !renderContext.stateManager.hasFocus
                ? Border.all(
                    color: widget.stateManager.style.activatedBorderColor,
                    width: 1,
                  )
                : null,
      ),
      child: Center(
        child: Text(
          cell.value,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
