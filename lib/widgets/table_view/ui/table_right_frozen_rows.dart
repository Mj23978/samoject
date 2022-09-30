import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/table_grid_state_manager.dart';
import '../model/table_column.dart';
import '../model/table_row.dart';
import 'ui.dart';

class TableRightFrozenRows extends TableStatefulWidget {
  final TableGridStateManager stateManager;

  const TableRightFrozenRows(
    this.stateManager, {
    super.key,
  });

  @override
  TableRightFrozenRowsState createState() => TableRightFrozenRowsState();
}

class TableRightFrozenRowsState
    extends TableStateWithChange<TableRightFrozenRows> {
  List<TableViewColumn> _columns = [];

  List<TableViewRow> _rows = [];

  late final ScrollController _scroll;

  @override
  TableGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    _scroll = stateManager.scroll!.vertical!.addAndGet();

    updateState();
  }

  @override
  void dispose() {
    _scroll.dispose();

    super.dispose();
  }

  @override
  void updateState() {
    _columns = update<List<TableViewColumn>>(
      _columns,
      _getColumns(),
      compare: listEquals,
    );

    _rows = [
      ...update<List<TableViewRow>>(
        _rows,
        stateManager.refRows,
        compare: listEquals,
      )
    ];
  }

  List<TableViewColumn> _getColumns() {
    return stateManager.isLTR
        ? stateManager.rightFrozenColumns
        : stateManager.rightFrozenColumns.reversed.toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scroll,
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      itemCount: _rows.length,
      itemExtent: stateManager.rowTotalHeight,
      itemBuilder: (ctx, i) {
        return TableBaseRow(
          key: ValueKey('right_frozen_row_${_rows[i].key}'),
          rowIdx: i,
          row: _rows[i],
          columns: _columns,
          stateManager: stateManager,
        );
      },
    );
  }
}
