import 'package:flutter/material.dart';

import '../manager/samoject_list_grid_state_manager.dart';
import '../model/samoject_list_column.dart';
import 'ui.dart';

class SamojectListBaseColumn extends SamojectListStatefulWidget
    implements SamojectListVisibilityLayoutChild {
  final SamojectListGridStateManager stateManager;

  final SamojectListColumn column;

  final double? columnTitleHeight;

  SamojectListBaseColumn({
    required this.stateManager,
    required this.column,
    this.columnTitleHeight,
  }) : super(key: column.key);

  @override
  SamojectListBaseColumnState createState() => SamojectListBaseColumnState();

  @override
  double get width => column.width;

  @override
  double get startPosition => column.startPosition;

  @override
  bool get keepAlive => false;
}

class SamojectListBaseColumnState
    extends SamojectListStateWithChange<SamojectListBaseColumn> {
  bool _showColumnFilter = false;

  @override
  SamojectListGridStateManager get stateManager => widget.stateManager;

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
          child: SamojectListColumnTitle(
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
            child: SamojectListColumnFilter(
              stateManager: stateManager,
              column: widget.column,
            ),
          ),
      ],
    );
  }
}
