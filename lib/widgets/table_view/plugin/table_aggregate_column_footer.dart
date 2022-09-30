import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helper/table_aggregate_helper.dart';
import '../manager/table_grid_state_manager.dart';
import '../model/table_cell.dart';
import '../model/table_column.dart';
import '../model/table_row.dart';
import '../table_grid.dart';
import '../ui/miscellaneous/table_state_with_change.dart';
import '../ui/ui.dart';

/// {@template table_aggregate_filter}
/// Returns whether to be filtered according to the value of [TableViewCell.value].
/// {@endtemplate}
typedef TableAggregateFilter = bool Function(TableViewCell);

/// {@template table_aggregate_column_type}
/// Determine the aggregate type.
///
/// [sum] Returns the sum of all values.
///
/// [average] Returns the result of adding up all values and dividing by the number of elements.
///
/// [min] Returns the smallest value among all values.
///
/// [max] Returns the largest value out of all values.
///
/// [count] Returns the total count.
/// {@endtemplate}
enum TableAggregateColumnType {
  sum,
  average,
  min,
  max,
  count,
}

/// Widget for outputting the sum, average, minimum,
/// and maximum values of all values in a column.
///
/// Example) [TableViewColumn.footerRenderer] Implement column footer as return value of callback
/// ```dart
/// TableViewColumn(
///   title: 'column',
///   field: 'column',
///   type: TableViewColumnType.number(format: '#,###.###'),
///   textAlign: TableColumnTextAlign.right,
///   footerRenderer: (rendererContext) {
///     return TableAggregateColumnFooter(
///       rendererContext: rendererContext,
///       type: TableAggregateColumnType.sum,
///       format: 'Sum : #,###.###',
///       alignment: Alignment.center,
///     );
///   },
/// ),
/// ```
///
/// [TableAggregateColumnFooter]
/// You can also return a [Widget] you wrote yourself instead of a widget.
/// However, you must implement the process
/// of updating according to the value change yourself.
class TableAggregateColumnFooter extends TableStatefulWidget {
  /// Contains information needed to implement the widget.
  final TableColumnFooterRendererContext rendererContext;

  /// {@macro table_aggregate_column_type}
  final TableAggregateColumnType type;

  /// {@macro table_aggregate_filter}
  ///
  /// Example) Only when the value of [TableViewCell.value] is Android,
  /// it is included in the aggregate list.
  /// ```dart
  /// filter: (cell) => cell.value == 'Android',
  /// ```
  final TableAggregateFilter? filter;

  /// Set the format of aggregated result values.
  ///
  /// Example)
  /// ```dart
  /// format: 'Android: #,###', // Android: 100 (if the result is 100)
  /// format: '#,###.###', // 1,000,000.123 (expressed to 3 decimal places)
  /// ```
  final String format;

  /// Setting the locale of the resulting value.
  ///
  /// Example)
  /// ```dart
  /// locale: 'da_DK',
  /// ```
  final String? locale;

  /// You can customize the resulting values.
  ///
  /// Example)
  /// ```dart
  /// titleSpanBuilder: (text) {
  ///   return [
  ///     const TextSpan(
  ///       text: 'Sum',
  ///       style: TextStyle(color: Colors.red),
  ///     ),
  ///     const TextSpan(text: ' : '),
  ///     TextSpan(text: text),
  ///   ];
  /// },
  /// ```
  final List<InlineSpan> Function(String)? titleSpanBuilder;

  final AlignmentGeometry? alignment;

  final EdgeInsets? padding;

  final bool formatAsCurrency;

  const TableAggregateColumnFooter({
    required this.rendererContext,
    required this.type,
    this.filter,
    this.format = '#,###',
    this.locale,
    this.titleSpanBuilder,
    this.alignment,
    this.padding,
    this.formatAsCurrency = false,
    super.key,
  });

  @override
  TableAggregateColumnFooterState createState() =>
      TableAggregateColumnFooterState();
}

class TableAggregateColumnFooterState
    extends TableStateWithChange<TableAggregateColumnFooter> {
  @override
  TableGridStateManager get stateManager => widget.rendererContext.stateManager;

  TableViewColumn get column => widget.rendererContext.column;

  num? _aggregatedValue;

  late final NumberFormat _numberFormat;

  late final num? Function({
    required List<TableViewRow> rows,
    required TableViewColumn column,
    TableAggregateFilter? filter,
  }) _aggregator;

  @override
  void initState() {
    super.initState();

    _numberFormat = widget.formatAsCurrency
        ? NumberFormat.simpleCurrency(locale: widget.locale)
        : NumberFormat(widget.format, widget.locale);

    _setAggregator();

    updateState();
  }

  void _setAggregator() {
    switch (widget.type) {
      case TableAggregateColumnType.sum:
        _aggregator = TableAggregateHelper.sum;
        break;
      case TableAggregateColumnType.average:
        _aggregator = TableAggregateHelper.average;
        break;
      case TableAggregateColumnType.min:
        _aggregator = TableAggregateHelper.min;
        break;
      case TableAggregateColumnType.max:
        _aggregator = TableAggregateHelper.max;
        break;
      case TableAggregateColumnType.count:
        _aggregator = TableAggregateHelper.count;
        break;
    }
  }

  @override
  void updateState() {
    _aggregatedValue = update<num?>(
      _aggregatedValue,
      _aggregator(
        rows: stateManager.refRows,
        column: column,
        filter: widget.filter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasTitleSpan = widget.titleSpanBuilder != null;

    final formattedValue =
        _aggregatedValue == null ? '' : _numberFormat.format(_aggregatedValue);

    final text = hasTitleSpan ? null : formattedValue;

    final children =
        hasTitleSpan ? widget.titleSpanBuilder!(formattedValue) : null;

    return Container(
      padding: widget.padding ?? TableGridSettings.columnTitlePadding,
      alignment: widget.alignment ?? AlignmentDirectional.centerStart,
      child: Text.rich(
        TextSpan(
          text: text,
          children: children,
        ),
        style: stateManager.configuration.style.cellTextStyle.copyWith(
          decoration: TextDecoration.none,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
