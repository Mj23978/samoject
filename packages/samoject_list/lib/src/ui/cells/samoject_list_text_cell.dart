import 'package:flutter/material.dart';

import '../../manager/samoject_list_grid_state_manager.dart';
import '../../model/samoject_list_cell.dart';
import '../../model/samoject_list_column.dart';
import '../../model/samoject_list_row.dart';
import 'text_cell.dart';

class SamojectListTextCell extends StatefulWidget implements TextCell {
  @override
  final SamojectListGridStateManager stateManager;

  @override
  final SamojectListCell cell;

  @override
  final SamojectListColumn column;

  @override
  final SamojectListRow row;

  const SamojectListTextCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  SamojectListTextCellState createState() => SamojectListTextCellState();
}

class SamojectListTextCellState extends State<SamojectListTextCell>
    with TextCellState<SamojectListTextCell> {}
