import 'package:flutter/material.dart';

import '../../model/samoject_list_column_type.dart';
import '../../helper/samoject_list_date_time_helper.dart';
import '../../manager/samoject_list_grid_state_manager.dart';
import '../../model/samoject_list_cell.dart';
import '../../model/samoject_list_column.dart';
import '../../model/samoject_list_row.dart';
import '../../samoject_list_grid_date_picker.dart';
import 'popup_cell.dart';

class SamojectListDateCell extends StatefulWidget implements PopupCell {
  @override
  final SamojectListGridStateManager stateManager;

  @override
  final SamojectListCell cell;

  @override
  final SamojectListColumn column;

  @override
  final SamojectListRow row;

  const SamojectListDateCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  SamojectListDateCellState createState() => SamojectListDateCellState();
}

class SamojectListDateCellState extends State<SamojectListDateCell>
    with PopupCellState<SamojectListDateCell> {
  SamojectListGridStateManager? popupStateManager;

  @override
  List<SamojectListColumn> popupColumns = [];

  @override
  List<SamojectListRow> popupRows = [];

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

    SamojectListGridDatePicker(
      context: context,
      initDate: SamojectListDateTimeHelper.parseOrNullWithFormat(
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
