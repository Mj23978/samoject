import 'package:flutter/material.dart';

import '../../model/samoject_list_column_type.dart';
import '../../manager/samoject_list_grid_state_manager.dart';
import '../../model/samoject_list_cell.dart';
import '../../model/samoject_list_column.dart';
import '../../model/samoject_list_row.dart';
import '../../samoject_list_grid.dart';
import 'popup_cell.dart';

class SamojectListSelectCell extends StatefulWidget implements PopupCell {
  @override
  final SamojectListGridStateManager stateManager;

  @override
  final SamojectListCell cell;

  @override
  final SamojectListColumn column;

  @override
  final SamojectListRow row;

  const SamojectListSelectCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  SamojectListSelectCellState createState() => SamojectListSelectCellState();
}

class SamojectListSelectCellState extends State<SamojectListSelectCell>
    with PopupCellState<SamojectListSelectCell> {
  @override
  List<SamojectListColumn> popupColumns = [];

  @override
  List<SamojectListRow> popupRows = [];

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
        SamojectListGridSettings.gridInnerSpacing +
        SamojectListGridSettings.gridBorderWidth;

    fieldOnSelected = widget.column.title;

    popupColumns = [
      SamojectListColumn(
        title: widget.column.title,
        field: widget.column.title,
        readOnly: true,
        type: SamojectListColumnType.text(),
        formatter: widget.column.formatter,
        enableFilterMenuItem: enableColumnFilter,
        enableHideColumnMenuItem: false,
        enableSetColumnsMenuItem: false,
      )
    ];

    popupRows = widget.column.type.select.items.map((dynamic item) {
      return SamojectListRow(
        cells: {
          widget.column.title: SamojectListCell(value: item),
        },
      );
    }).toList();
  }

  @override
  void onLoaded(SamojectListGridOnLoadedEvent event) {
    super.onLoaded(event);

    if (enableColumnFilter) {
      event.stateManager.setShowColumnFilter(true, notify: false);
    }

    event.stateManager.setSelectingMode(SamojectListGridSelectingMode.none);
  }
}
