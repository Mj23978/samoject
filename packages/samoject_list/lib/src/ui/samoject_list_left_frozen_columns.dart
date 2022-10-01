import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/samoject_list_grid_state_manager.dart';
import '../model/samoject_list_column.dart';
import '../model/samoject_list_column_group.dart';
import 'ui.dart';

class SamojectListLeftFrozenColumns extends SamojectListStatefulWidget {
  final SamojectListGridStateManager stateManager;

  const SamojectListLeftFrozenColumns(
    this.stateManager, {
    super.key,
  });

  @override
  SamojectListLeftFrozenColumnsState createState() =>
      SamojectListLeftFrozenColumnsState();
}

class SamojectListLeftFrozenColumnsState
    extends SamojectListStateWithChange<SamojectListLeftFrozenColumns> {
  List<SamojectListColumn> _columns = [];

  List<SamojectListColumnGroupPair> _columnGroups = [];

  bool _showColumnGroups = false;

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
    _showColumnGroups = update<bool>(
      _showColumnGroups,
      stateManager.showColumnGroups,
    );

    _columns = update<List<SamojectListColumn>>(
      _columns,
      _getColumns(),
      compare: listEquals,
    );

    if (changed && _showColumnGroups == true) {
      _columnGroups = stateManager.separateLinkedGroup(
        columnGroupList: stateManager.refColumnGroups!,
        columns: _columns,
      );
    }

    _itemCount = update<int>(_itemCount, _getItemCount());
  }

  List<SamojectListColumn> _getColumns() {
    return stateManager.isLTR
        ? stateManager.leftFrozenColumns
        : stateManager.leftFrozenColumns.reversed.toList(growable: false);
  }

  int _getItemCount() {
    return _showColumnGroups == true ? _columnGroups.length : _columns.length;
  }

  Widget _buildColumnGroup(SamojectListColumnGroupPair e) {
    return LayoutId(
      id: e.key,
      child: SamojectListBaseColumnGroup(
        stateManager: stateManager,
        columnGroup: e,
        depth: stateManager.columnGroupDepth(
          stateManager.refColumnGroups!,
        ),
      ),
    );
  }

  Widget _buildColumn(e) {
    return LayoutId(
      id: e.field,
      child: SamojectListBaseColumn(
        stateManager: stateManager,
        column: e,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: MainColumnLayoutDelegate(
        stateManager: stateManager,
        columns: _columns,
        columnGroups: _columnGroups,
        frozen: SamojectListColumnFrozen.start,
      ),
      children: _showColumnGroups == true
          ? _columnGroups.map(_buildColumnGroup).toList()
          : _columns.map(_buildColumn).toList(),
    );
  }
}
