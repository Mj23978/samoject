import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/table_grid_state_manager.dart';
import '../model/table_column.dart';
import '../model/table_column_group.dart';
import 'ui.dart';

class TableRightFrozenColumns extends TableStatefulWidget {
  final TableGridStateManager stateManager;

  const TableRightFrozenColumns(
    this.stateManager, {
    super.key,
  });

  @override
  TableRightFrozenColumnsState createState() => TableRightFrozenColumnsState();
}

class TableRightFrozenColumnsState
    extends TableStateWithChange<TableRightFrozenColumns> {
  List<TableViewColumn> _columns = [];

  List<TableColumnGroupPair> _columnGroups = [];

  bool _showColumnGroups = false;

  int _itemCount = 0;

  @override
  TableGridStateManager get stateManager => widget.stateManager;

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

    _columns = update<List<TableViewColumn>>(
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

  List<TableViewColumn> _getColumns() {
    return stateManager.isLTR
        ? stateManager.rightFrozenColumns
        : stateManager.rightFrozenColumns.reversed.toList(growable: false);
  }

  int _getItemCount() {
    return _showColumnGroups == true ? _columnGroups.length : _columns.length;
  }

  Widget _buildColumnGroup(TableColumnGroupPair e) {
    return LayoutId(
      id: e.key,
      child: TableBaseColumnGroup(
        stateManager: stateManager,
        columnGroup: e,
        depth: stateManager.columnGroupDepth(stateManager.refColumnGroups!),
      ),
    );
  }

  Widget _buildColumn(e) {
    return LayoutId(
      id: e.field,
      child: TableBaseColumn(
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
        frozen: TableColumnFrozen.end,
      ),
      children: _showColumnGroups == true
          ? _columnGroups.map(_buildColumnGroup).toList()
          : _columns.map(_buildColumn).toList(),
    );
  }
}
