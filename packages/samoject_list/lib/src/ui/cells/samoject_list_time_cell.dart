import 'package:flutter/material.dart';

import '../../helper/samoject_list_move_direction.dart';
import '../../helper/samoject_list_size_helper.dart';
import '../../manager/samoject_list_grid_state_manager.dart';
import '../../model/samoject_list_cell.dart';
import '../../model/samoject_list_column.dart';
import '../../model/samoject_list_column_type.dart';
import '../../model/samoject_list_row.dart';
import '../../samoject_list_dual_grid.dart';
import '../../samoject_list_dual_grid_popup.dart';
import '../../samoject_list_grid.dart';
import '../../samoject_list_grid_configuration.dart';
import 'popup_cell.dart';

class SamojectListTimeCell extends StatefulWidget implements PopupCell {
  @override
  final SamojectListGridStateManager stateManager;

  @override
  final SamojectListCell cell;

  @override
  final SamojectListColumn column;

  @override
  final SamojectListRow row;

  const SamojectListTimeCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  SamojectListTimeCellState createState() => SamojectListTimeCellState();
}

class SamojectListTimeCellState extends State<SamojectListTimeCell>
    with PopupCellState<SamojectListTimeCell> {
  SamojectListGridStateManager? popupStateManager;

  @override
  List<SamojectListColumn> popupColumns = [];

  @override
  List<SamojectListRow> popupRows = [];

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
        oddRowColor: SamojectListOptional(null),
        evenRowColor: SamojectListOptional(null),
        activatedColor: style.gridBackgroundColor,
        gridBorderColor: style.gridBackgroundColor,
        borderColor: style.gridBackgroundColor,
        activatedBorderColor: style.gridBackgroundColor,
        inactivatedBorderColor: style.gridBackgroundColor,
        rowHeight: style.rowHeight,
        defaultColumnTitlePadding: SamojectListGridSettings.columnTitlePadding,
        defaultCellPadding: const EdgeInsets.symmetric(horizontal: 3),
        gridBorderRadius: style.gridPopupBorderRadius,
      ),
      columnSize: const SamojectListGridColumnSizeConfig(
        autoSizeMode: SamojectListAutoSizeMode.none,
        resizeMode: SamojectListResizeMode.none,
      ),
    );

    SamojectListDualGridPopup(
      context: context,
      onSelected: (SamojectListDualOnSelectedEvent event) {
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
      gridPropsA: SamojectListDualGridProps(
        columns: [
          SamojectListColumn(
            title: localeText.hour,
            field: 'hour',
            readOnly: true,
            type: SamojectListColumnType.text(),
            enableSorting: false,
            enableColumnDrag: false,
            enableContextMenu: false,
            enableDropToResize: false,
            textAlign: SamojectListColumnTextAlign.center,
            titleTextAlign: SamojectListColumnTextAlign.center,
            width: 134,
            renderer: _cellRenderer,
          ),
        ],
        rows: Iterable<int>.generate(24)
            .map((hour) => SamojectListRow(cells: {
                  'hour': SamojectListCell(
                    value: hour.toString().padLeft(2, '0'),
                  ),
                }))
            .toList(growable: false),
        onLoaded: (SamojectListGridOnLoadedEvent event) {
          final stateManager = event.stateManager;
          final rows = stateManager.refRows;
          final length = rows.length;

          stateManager.setSelectingMode(SamojectListGridSelectingMode.none);

          for (var i = 0; i < length; i += 1) {
            if (rows[i].cells['hour']!.value == cellHour) {
              stateManager.setCurrentCell(rows[i].cells['hour'], i);

              stateManager.moveScrollByRow(
                SamojectListMoveDirection.up,
                i + 1 + offsetOfScrollRowIdx,
              );

              return;
            }
          }
        },
        configuration: configuration,
      ),
      gridPropsB: SamojectListDualGridProps(
        columns: [
          SamojectListColumn(
            title: localeText.minute,
            field: 'minute',
            readOnly: true,
            type: SamojectListColumnType.text(),
            enableSorting: false,
            enableColumnDrag: false,
            enableContextMenu: false,
            enableDropToResize: false,
            textAlign: SamojectListColumnTextAlign.center,
            titleTextAlign: SamojectListColumnTextAlign.center,
            width: 134,
            renderer: _cellRenderer,
          ),
        ],
        rows: Iterable<int>.generate(60)
            .map((minute) => SamojectListRow(cells: {
                  'minute': SamojectListCell(
                    value: minute.toString().padLeft(2, '0'),
                  ),
                }))
            .toList(growable: false),
        onLoaded: (SamojectListGridOnLoadedEvent event) {
          final stateManager = event.stateManager;
          final rows = stateManager.refRows;
          final length = rows.length;

          stateManager.setSelectingMode(SamojectListGridSelectingMode.none);

          for (var i = 0; i < length; i += 1) {
            if (rows[i].cells['minute']!.value == cellMinute) {
              stateManager.setCurrentCell(rows[i].cells['minute'], i);

              stateManager.moveScrollByRow(
                SamojectListMoveDirection.up,
                i + 1 + offsetOfScrollRowIdx,
              );

              return;
            }
          }
        },
        configuration: configuration,
      ),
      mode: SamojectListGridMode.select,
      width: 276,
      height: 300,
      divider: const SamojectListDualGridDivider(
        show: false,
      ),
    );
  }

  Widget _cellRenderer(SamojectListColumnRendererContext renderContext) {
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
