import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/samoject_table_grid_state_manager.dart';
import '../model/samoject_table_column.dart';
import 'ui.dart';

class SamojectTableRightFrozenColumnsFooter
    extends SamojectTableStatefulWidget {
  final SamojectTableGridStateManager stateManager;

  const SamojectTableRightFrozenColumnsFooter(
    this.stateManager, {
    super.key,
  });

  @override
  SamojectTableRightFrozenColumnsFooterState createState() =>
      SamojectTableRightFrozenColumnsFooterState();
}

class SamojectTableRightFrozenColumnsFooterState
    extends SamojectTableStateWithChange<
        SamojectTableRightFrozenColumnsFooter> {
  List<SamojectTableColumn> _columns = [];

  int _itemCount = 0;

  @override
  SamojectTableGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    updateState();
  }

  @override
  void updateState() {
    _columns = update<List<SamojectTableColumn>>(
      _columns,
      _getColumns(),
      compare: listEquals,
    );

    _itemCount = update<int>(_itemCount, _getItemCount());
  }

  List<SamojectTableColumn> _getColumns() {
    return stateManager.isLTR
        ? stateManager.rightFrozenColumns
        : stateManager.rightFrozenColumns.reversed.toList(growable: false);
  }

  int _getItemCount() {
    return _columns.length;
  }

  Widget _buildColumn(e) {
    return LayoutId(
      id: e.field,
      child: SamojectTableBaseColumnFooter(
        stateManager: stateManager,
        column: e,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: ColumnFooterLayoutDelegate(
        stateManager: stateManager,
        columns: _columns,
      ),
      children: _columns.map(_buildColumn).toList(),
    );
  }
}
