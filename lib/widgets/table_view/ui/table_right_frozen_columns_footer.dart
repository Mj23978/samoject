import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/table_grid_state_manager.dart';
import '../model/table_column.dart';
import 'ui.dart';

class TableRightFrozenColumnsFooter extends TableStatefulWidget {
  final TableGridStateManager stateManager;

  const TableRightFrozenColumnsFooter(
    this.stateManager, {
    super.key,
  });

  @override
  TableRightFrozenColumnsFooterState createState() =>
      TableRightFrozenColumnsFooterState();
}

class TableRightFrozenColumnsFooterState
    extends TableStateWithChange<TableRightFrozenColumnsFooter> {
  List<TableViewColumn> _columns = [];

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
    _columns = update<List<TableViewColumn>>(
      _columns,
      _getColumns(),
      compare: listEquals,
    );

    _itemCount = update<int>(_itemCount, _getItemCount());
  }

  List<TableViewColumn> _getColumns() {
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
      child: TableBaseColumnFooter(
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
