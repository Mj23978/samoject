import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../model/samoject_list_column_type.dart';
import '../../manager/samoject_list_grid_state_manager.dart';
import '../../model/samoject_list_cell.dart';
import '../../model/samoject_list_column.dart';
import '../../model/samoject_list_row.dart';
import 'decimal_input_formatter.dart';
import 'text_cell.dart';

class SamojectListNumberCell extends StatefulWidget implements TextCell {
  @override
  final SamojectListGridStateManager stateManager;

  @override
  final SamojectListCell cell;

  @override
  final SamojectListColumn column;

  @override
  final SamojectListRow row;

  const SamojectListNumberCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  SamojectListNumberCellState createState() => SamojectListNumberCellState();
}

class SamojectListNumberCellState extends State<SamojectListNumberCell>
    with TextCellState<SamojectListNumberCell> {
  late final int decimalRange;

  late final bool activatedNegative;

  late final bool allowFirstDot;

  late final String decimalSeparator;

  @override
  late final TextInputType keyboardType;

  @override
  late final List<TextInputFormatter>? inputFormatters;

  @override
  void initState() {
    super.initState();

    final numberColumn = widget.column.type.number;

    decimalRange = numberColumn.decimalPoint;

    activatedNegative = numberColumn.negative;

    allowFirstDot = numberColumn.allowFirstDot;

    decimalSeparator = numberColumn.numberFormat.symbols.DECIMAL_SEP;

    inputFormatters = [
      DecimalTextInputFormatter(
        decimalRange: decimalRange,
        activatedNegativeValues: activatedNegative,
        allowFirstDot: allowFirstDot,
        decimalSeparator: decimalSeparator,
      ),
    ];

    keyboardType = TextInputType.numberWithOptions(
      decimal: decimalRange > 0,
      signed: activatedNegative,
    );
  }
}
