import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/samoject_list_grid_state_manager.dart';
import '../model/samoject_list_column.dart';
import 'ui.dart';

class SamojectListLeftFrozenColumnsFooter extends SamojectListStatefulWidget {
  final SamojectListGridStateManager stateManager;

  const SamojectListLeftFrozenColumnsFooter(
    this.stateManager, {
    super.key,
  });

  @override
  SamojectListLeftFrozenColumnsFooterState createState() =>
      SamojectListLeftFrozenColumnsFooterState();
}

class SamojectListLeftFrozenColumnsFooterState
    extends SamojectListStateWithChange<SamojectListLeftFrozenColumnsFooter> {
  List<SamojectListColumn> _columns = [];

  int _itemCount = 0;

  @override
  SamojectListGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    updateState();
  }

  @override
  void updateState() {
    _columns = update<List<SamojectListColumn>>(
      _columns,
      _getColumns(),
      compare: listEquals,
    );

    _itemCount = update<int>(_itemCount, _getItemCount());
  }

  List<SamojectListColumn> _getColumns() {
    return stateManager.isLTR
        ? stateManager.leftFrozenColumns
        : stateManager.leftFrozenColumns.reversed.toList(growable: false);
  }

  int _getItemCount() {
    return _columns.length;
  }

  Widget _buildColumn(e) {
    return LayoutId(
      id: e.field,
      child: SamojectListBaseColumnFooter(
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
