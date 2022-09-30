import 'package:flutter/material.dart';

import '../../model/table_column_type.dart';
import '../../manager/table_grid_state_manager.dart';
import '../../model/table_cell.dart';
import '../../model/table_column.dart';
import '../../model/table_row.dart';
import '../../table_grid.dart';
import 'popup_cell.dart';

class TableSelectCell extends StatefulWidget implements PopupCell {
  @override
  final TableGridStateManager stateManager;

  @override
  final TableViewCell cell;

  @override
  final TableViewColumn column;

  @override
  final TableViewRow row;

  const TableSelectCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  TableSelectCellState createState() => TableSelectCellState();
}

class TableSelectCellState extends State<TableSelectCell>
    with PopupCellState<TableSelectCell> {
  @override
  List<TableViewColumn> popupColumns = [];

  @override
  List<TableViewRow> popupRows = [];

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
        TableGridSettings.gridInnerSpacing +
        TableGridSettings.gridBorderWidth;

    fieldOnSelected = widget.column.title;

    popupColumns = [
      TableViewColumn(
        title: widget.column.title,
        field: widget.column.title,
        readOnly: true,
        type: TableViewColumnType.text(),
        formatter: widget.column.formatter,
        enableFilterMenuItem: enableColumnFilter,
        enableHideColumnMenuItem: false,
        enableSetColumnsMenuItem: false,
      )
    ];

    popupRows = widget.column.type.select.items.map((dynamic item) {
      return TableViewRow(
        cells: {
          widget.column.title: TableViewCell(value: item),
        },
      );
    }).toList();
  }

  @override
  void onLoaded(TableGridOnLoadedEvent event) {
    super.onLoaded(event);

    if (enableColumnFilter) {
      event.stateManager.setShowColumnFilter(true, notify: false);
    }

    event.stateManager.setSelectingMode(TableGridSelectingMode.none);
  }
}
