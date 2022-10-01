import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/samoject_table_grid_state_manager.dart';
import '../model/samoject_table_column.dart';
import '../model/samoject_table_column_group.dart';
import 'ui.dart';

class SamojectTableLeftFrozenColumns extends SamojectTableStatefulWidget {
  final SamojectTableGridStateManager stateManager;

  const SamojectTableLeftFrozenColumns(
    this.stateManager, {
    super.key,
  });

  @override
  SamojectTableLeftFrozenColumnsState createState() =>
      SamojectTableLeftFrozenColumnsState();
}

class SamojectTableLeftFrozenColumnsState
    extends SamojectTableStateWithChange<SamojectTableLeftFrozenColumns> {
  List<SamojectTableColumn> _columns = [];

  List<SamojectTableColumnGroupPair> _columnGroups = [];

  bool _showColumnGroups = false;

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
    _showColumnGroups = update<bool>(
      _showColumnGroups,
      stateManager.showColumnGroups,
    );

    _columns = update<List<SamojectTableColumn>>(
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

  List<SamojectTableColumn> _getColumns() {
    return stateManager.isLTR
        ? stateManager.leftFrozenColumns
        : stateManager.leftFrozenColumns.reversed.toList(growable: false);
  }

  int _getItemCount() {
    return _showColumnGroups == true ? _columnGroups.length : _columns.length;
  }

  Widget _buildColumnGroup(SamojectTableColumnGroupPair e) {
    return LayoutId(
      id: e.key,
      child: SamojectTableBaseColumnGroup(
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
      child: SamojectTableBaseColumn(
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
        frozen: SamojectTableColumnFrozen.start,
      ),
      children: _showColumnGroups == true
          ? _columnGroups.map(_buildColumnGroup).toList()
          : _columns.map(_buildColumn).toList(),
    );
  }
}
