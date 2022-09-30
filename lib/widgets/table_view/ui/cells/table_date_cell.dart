import 'package:flutter/material.dart';

import '../../model/table_column_type.dart';
import '../../helper/table_date_time_helper.dart';
import '../../manager/table_grid_state_manager.dart';
import '../../model/table_cell.dart';
import '../../model/table_column.dart';
import '../../model/table_row.dart';
import '../../table_grid_date_picker.dart';
import 'popup_cell.dart';

class TableDateCell extends StatefulWidget implements PopupCell {
  @override
  final TableGridStateManager stateManager;

  @override
  final TableViewCell cell;

  @override
  final TableViewColumn column;

  @override
  final TableViewRow row;

  const TableDateCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  TableDateCellState createState() => TableDateCellState();
}

class TableDateCellState extends State<TableDateCell>
    with PopupCellState<TableDateCell> {
  TableGridStateManager? popupStateManager;

  @override
  List<TableViewColumn> popupColumns = [];

  @override
  List<TableViewRow> popupRows = [];

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

    TableGridDatePicker(
      context: context,
      initDate: TableDateTimeHelper.parseOrNullWithFormat(
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
