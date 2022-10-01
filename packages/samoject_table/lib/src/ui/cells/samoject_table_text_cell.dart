import 'package:flutter/material.dart';

import '../../manager/samoject_table_grid_state_manager.dart';
import '../../model/samoject_table_cell.dart';
import '../../model/samoject_table_column.dart';
import '../../model/samoject_table_row.dart';
import 'text_cell.dart';

class SamojectTableTextCell extends StatefulWidget implements TextCell {
  @override
  final SamojectTableGridStateManager stateManager;

  @override
  final SamojectTableCell cell;

  @override
  final SamojectTableColumn column;

  @override
  final SamojectTableRow row;

  const SamojectTableTextCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  SamojectTableTextCellState createState() => SamojectTableTextCellState();
}

class SamojectTableTextCellState extends State<SamojectTableTextCell>
    with TextCellState<SamojectTableTextCell> {}
