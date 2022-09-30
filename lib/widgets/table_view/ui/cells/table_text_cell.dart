import 'package:flutter/material.dart';

import '../../manager/table_grid_state_manager.dart';
import '../../model/table_cell.dart';
import '../../model/table_column.dart';
import '../../model/table_row.dart';
import 'text_cell.dart';

class TableTextCell extends StatefulWidget implements TextCell {
  @override
  final TableGridStateManager stateManager;

  @override
  final TableViewCell cell;

  @override
  final TableViewColumn column;

  @override
  final TableViewRow row;

  const TableTextCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  TableTextCellState createState() => TableTextCellState();
}

class TableTextCellState extends State<TableTextCell>
    with TextCellState<TableTextCell> {}
