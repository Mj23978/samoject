import 'package:flutter/material.dart';

import '../../model/samoject_table_column_type.dart';
import '../../helper/samoject_table_date_time_helper.dart';
import '../../manager/samoject_table_grid_state_manager.dart';
import '../../model/samoject_table_cell.dart';
import '../../model/samoject_table_column.dart';
import '../../model/samoject_table_row.dart';
import '../../samoject_table_grid_date_picker.dart';
import 'popup_cell.dart';

class SamojectTableDateCell extends StatefulWidget implements PopupCell {
  @override
  final SamojectTableGridStateManager stateManager;

  @override
  final SamojectTableCell cell;

  @override
  final SamojectTableColumn column;

  @override
  final SamojectTableRow row;

  const SamojectTableDateCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  SamojectTableDateCellState createState() => SamojectTableDateCellState();
}

class SamojectTableDateCellState extends State<SamojectTableDateCell>
    with PopupCellState<SamojectTableDateCell> {
  SamojectTableGridStateManager? popupStateManager;

  @override
  List<SamojectTableColumn> popupColumns = [];

  @override
  List<SamojectTableRow> popupRows = [];

  @override
  Icon? icon = const Icon(
    Icons.date_range,
  );

  @override
  void openPopup() {
    if (widget.column.checkReadOnly(widget.row, widget.cell)) {
      return;
    }

    isOpenedPopup = true;

    SamojectTableGridDatePicker(
      context: context,
      initDate: SamojectTableDateTimeHelper.parseOrNullWithFormat(
        widget.cell.value,
        widget.column.type.date.format,
      ),
      startDate: widget.column.type.date.startDate,
      endDate: widget.column.type.date.endDate,
      dateFormat: widget.column.type.date.dateFormat,
      headerDateFormat: widget.column.type.date.headerDateFormat,
      onSelected: onSelected,
      itemHeight: widget.stateManager.rowTotalHeight,
      configuration: widget.stateManager.configuration,
    );
  }
}
