import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../model/samoject_list_column_type.dart';
import '../../manager/samoject_list_grid_state_manager.dart';
import '../../model/samoject_list_cell.dart';
import '../../model/samoject_list_column.dart';
import '../../model/samoject_list_row.dart';
import 'decimal_input_formatter.dart';
import 'text_cell.dart';

class SamojectListCurrencyCell extends StatefulWidget implements TextCell {
  @override
  final SamojectListGridStateManager stateManager;

  @override
  final SamojectListCell cell;

  @override
  final SamojectListColumn column;

  @override
  final SamojectListRow row;

  const SamojectListCurrencyCell({
    required this.stateManager,
    required this.cell,
    required this.column,
    required this.row,
    Key? key,
  }) : super(key: key);

  @override
  SamojectListCurrencyCellState createState() =>
      SamojectListCurrencyCellState();
}

class SamojectListCurrencyCellState extends State<SamojectListCurrencyCell>
    with TextCellState<SamojectListCurrencyCell> {
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

    final currencyColumn = widget.column.type.currency;

    decimalRange = currencyColumn.decimalPoint;

    activatedNegative = currencyColumn.negative;

    allowFirstDot = currencyColumn.allowFirstDot;

    decimalSeparator = currencyColumn.numberFormat.symbols.DECIMAL_SEP;

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
