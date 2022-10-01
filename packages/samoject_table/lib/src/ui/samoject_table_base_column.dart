import 'package:flutter/material.dart';

import '../manager/samoject_table_grid_state_manager.dart';
import '../model/samoject_table_column.dart';
import 'ui.dart';

class SamojectTableBaseColumn extends SamojectTableStatefulWidget
    implements SamojectTableVisibilityLayoutChild {
  final SamojectTableGridStateManager stateManager;

  final SamojectTableColumn column;

  final double? columnTitleHeight;

  SamojectTableBaseColumn({
    required this.stateManager,
    required this.column,
    this.columnTitleHeight,
  }) : super(key: column.key);

  @override
  SamojectTableBaseColumnState createState() => SamojectTableBaseColumnState();

  @override
  double get width => column.width;

  @override
  double get startPosition => column.startPosition;

  @override
  bool get keepAlive => false;
}

class SamojectTableBaseColumnState
    extends SamojectTableStateWithChange<SamojectTableBaseColumn> {
  bool _showColumnFilter = false;

  @override
  SamojectTableGridStateManager get stateManager => widget.stateManager;

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
          child: SamojectTableColumnTitle(
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
            child: SamojectTableColumnFilter(
              stateManager: stateManager,
              column: widget.column,
            ),
          ),
      ],
    );
  }
}
