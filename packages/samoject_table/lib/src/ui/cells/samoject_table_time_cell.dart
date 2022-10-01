import 'package:flutter/material.dart';

import '../../helper/samoject_table_move_direction.dart';
import '../../helper/samoject_table_size_helper.dart';
import '../../manager/samoject_table_grid_state_manager.dart';
import '../../model/samoject_table_cell.dart';
import '../../model/samoject_table_column.dart';
import '../../model/samoject_table_column_type.dart';
import '../../model/samoject_table_row.dart';
import '../../samoject_table_dual_grid.dart';
import '../../samoject_table_dual_grid_popup.dart';
import '../../samoject_table_grid.dart';
import '../../samoject_table_grid_configuration.dart';
import 'popup_cell.dart';

class SamojectTableTimeCell extends StatefulWidget implements PopupCell {
  @override
  final SamojectTableGridStateManager stateManager;

  @override
  final SamojectTableCell cell;

  @override
  final SamojectTableColumn column;

  @override
  final SamojectTableRow row;

  const SamojectTableTimeCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  SamojectTableTimeCellState createState() => SamojectTableTimeCellState();
}

class SamojectTableTimeCellState extends State<SamojectTableTimeCell>
    with PopupCellState<SamojectTableTimeCell> {
  SamojectTableGridStateManager? popupStateManager;

  @override
  List<SamojectTableColumn> popupColumns = [];

  @override
  List<SamojectTableRow> popupRows = [];

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
        oddRowColor: SamojectTableOptional(null),
        evenRowColor: SamojectTableOptional(null),
        activatedColor: style.gridBackgroundColor,
        gridBorderColor: style.gridBackgroundColor,
        borderColor: style.gridBackgroundColor,
        activatedBorderColor: style.gridBackgroundColor,
        inactivatedBorderColor: style.gridBackgroundColor,
        rowHeight: style.rowHeight,
        defaultColumnTitlePadding: SamojectTableGridSettings.columnTitlePadding,
        defaultCellPadding: const EdgeInsets.symmetric(horizontal: 3),
        gridBorderRadius: style.gridPopupBorderRadius,
      ),
      columnSize: const SamojectTableGridColumnSizeConfig(
        autoSizeMode: SamojectTableAutoSizeMode.none,
        resizeMode: SamojectTableResizeMode.none,
      ),
    );

    SamojectTableDualGridPopup(
      context: context,
      onSelected: (SamojectTableDualOnSelectedEvent event) {
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
      gridPropsA: SamojectTableDualGridProps(
        columns: [
          SamojectTableColumn(
            title: localeText.hour,
            field: 'hour',
            readOnly: true,
            type: SamojectTableColumnType.text(),
            enableSorting: false,
            enableColumnDrag: false,
            enableContextMenu: false,
            enableDropToResize: false,
            textAlign: SamojectTableColumnTextAlign.center,
            titleTextAlign: SamojectTableColumnTextAlign.center,
            width: 134,
            renderer: _cellRenderer,
          ),
        ],
        rows: Iterable<int>.generate(24)
            .map((hour) => SamojectTableRow(cells: {
                  'hour': SamojectTableCell(
                    value: hour.toString().padLeft(2, '0'),
                  ),
                }))
            .toList(growable: false),
        onLoaded: (SamojectTableGridOnLoadedEvent event) {
          final stateManager = event.stateManager;
          final rows = stateManager.refRows;
          final length = rows.length;

          stateManager.setSelectingMode(SamojectTableGridSelectingMode.none);

          for (var i = 0; i < length; i += 1) {
            if (rows[i].cells['hour']!.value == cellHour) {
              stateManager.setCurrentCell(rows[i].cells['hour'], i);

              stateManager.moveScrollByRow(
                SamojectTableMoveDirection.up,
                i + 1 + offsetOfScrollRowIdx,
              );

              return;
            }
          }
        },
        configuration: configuration,
      ),
      gridPropsB: SamojectTableDualGridProps(
        columns: [
          SamojectTableColumn(
            title: localeText.minute,
            field: 'minute',
            readOnly: true,
            type: SamojectTableColumnType.text(),
            enableSorting: false,
            enableColumnDrag: false,
            enableContextMenu: false,
            enableDropToResize: false,
            textAlign: SamojectTableColumnTextAlign.center,
            titleTextAlign: SamojectTableColumnTextAlign.center,
            width: 134,
            renderer: _cellRenderer,
          ),
        ],
        rows: Iterable<int>.generate(60)
            .map((minute) => SamojectTableRow(cells: {
                  'minute': SamojectTableCell(
                    value: minute.toString().padLeft(2, '0'),
                  ),
                }))
            .toList(growable: false),
        onLoaded: (SamojectTableGridOnLoadedEvent event) {
          final stateManager = event.stateManager;
          final rows = stateManager.refRows;
          final length = rows.length;

          stateManager.setSelectingMode(SamojectTableGridSelectingMode.none);

          for (var i = 0; i < length; i += 1) {
            if (rows[i].cells['minute']!.value == cellMinute) {
              stateManager.setCurrentCell(rows[i].cells['minute'], i);

              stateManager.moveScrollByRow(
                SamojectTableMoveDirection.up,
                i + 1 + offsetOfScrollRowIdx,
              );

              return;
            }
          }
        },
        configuration: configuration,
      ),
      mode: SamojectTableGridMode.select,
      width: 276,
      height: 300,
      divider: const SamojectTableDualGridDivider(
        show: false,
      ),
    );
  }

  Widget _cellRenderer(SamojectTableColumnRendererContext renderContext) {
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
