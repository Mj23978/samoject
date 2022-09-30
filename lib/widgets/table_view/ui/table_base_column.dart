import 'package:flutter/material.dart';

import '../manager/table_grid_state_manager.dart';
import '../model/table_column.dart';
import 'ui.dart';

class TableBaseColumn extends TableStatefulWidget
    implements TableVisibilityLayoutChild {
  final TableGridStateManager stateManager;

  final TableViewColumn column;

  final double? columnTitleHeight;

  TableBaseColumn({
    required this.stateManager,
    required this.column,
    this.columnTitleHeight,
  }) : super(key: column.key);

  @override
  TableBaseColumnState createState() => TableBaseColumnState();

  @override
  double get width => column.width;

  @override
  double get startPosition => column.startPosition;

  @override
  bool get keepAlive => false;
}

class TableBaseColumnState extends TableStateWithChange<TableBaseColumn> {
  bool _showColumnFilter = false;

  @override
  TableGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    updateState();
  }

  @override
  void updateState() {
    _showColumnFilter = update<bool>(
      _showColumnFilter,
      stateManager.showColumnFilter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: _showColumnFilter ? stateManager.columnFilterHeight : 0,
          child: TableColumnTitle(
            stateManager: stateManager,
            column: widget.column,
            height: widget.columnTitleHeight ?? stateManager.columnHeight,
          ),
        ),
        if (_showColumnFilter)
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: TableColumnFilter(
              stateManager: stateManager,
              column: widget.column,
            ),
          ),
      ],
    );
  }
}
