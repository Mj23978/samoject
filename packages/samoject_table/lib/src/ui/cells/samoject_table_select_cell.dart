import 'package:flutter/material.dart';

import '../../model/samoject_table_column_type.dart';
import '../../manager/samoject_table_grid_state_manager.dart';
import '../../model/samoject_table_cell.dart';
import '../../model/samoject_table_column.dart';
import '../../model/samoject_table_row.dart';
import '../../samoject_table_grid.dart';
import 'popup_cell.dart';

class SamojectTableSelectCell extends StatefulWidget implements PopupCell {
  @override
  final SamojectTableGridStateManager stateManager;

  @override
  final SamojectTableCell cell;

  @override
  final SamojectTableColumn column;

  @override
  final SamojectTableRow row;

  const SamojectTableSelectCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  SamojectTableSelectCellState createState() => SamojectTableSelectCellState();
}

class SamojectTableSelectCellState extends State<SamojectTableSelectCell>
    with PopupCellState<SamojectTableSelectCell> {
  @override
  List<SamojectTableColumn> popupColumns = [];

  @override
  List<SamojectTableRow> popupRows = [];

  @override
  Icon? icon = const Icon(
    Icons.arrow_drop_down,
  );

  late bool enableColumnFilter;

  @override
  void initState() {
    super.initState();

    enableColumnFilter = widget.column.type.select.enableColumnFilter;

    final columnFilterHeight = enableColumnFilter
        ? widget.stateManager.configuration.style.columnFilterHeight
        : 0;

    final rowsHeight = widget.column.type.select.items.length *
        widget.stateManager.rowTotalHeight;

    popupHeight = widget.stateManager.configuration.style.columnHeight +
        columnFilterHeight +
        rowsHeight +
        SamojectTableGridSettings.gridInnerSpacing +
        SamojectTableGridSettings.gridBorderWidth;

    fieldOnSelected = widget.column.title;

    popupColumns = [
      SamojectTableColumn(
        title: widget.column.title,
        field: widget.column.title,
        readOnly: true,
        type: SamojectTableColumnType.text(),
        formatter: widget.column.formatter,
        enableFilterMenuItem: enableColumnFilter,
        enableHideColumnMenuItem: false,
        enableSetColumnsMenuItem: false,
      )
    ];

    popupRows = widget.column.type.select.items.map((dynamic item) {
      return SamojectTableRow(
        cells: {
          widget.column.title: SamojectTableCell(value: item),
        },
      );
    }).toList();
  }

  @override
  void onLoaded(SamojectTableGridOnLoadedEvent event) {
    super.onLoaded(event);

    if (enableColumnFilter) {
      event.stateManager.setShowColumnFilter(true, notify: false);
    }

    event.stateManager.setSelectingMode(SamojectTableGridSelectingMode.none);
  }
}
