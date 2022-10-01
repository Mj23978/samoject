import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/samoject_list_grid_state_manager.dart';
import '../model/samoject_list_column.dart';
import '../model/samoject_list_row.dart';
import 'ui.dart';

class SamojectListRightFrozenRows extends SamojectListStatefulWidget {
  final SamojectListGridStateManager stateManager;

  const SamojectListRightFrozenRows(
    this.stateManager, {
    super.key,
  });

  @override
  SamojectListRightFrozenRowsState createState() =>
      SamojectListRightFrozenRowsState();
}

class SamojectListRightFrozenRowsState
    extends SamojectListStateWithChange<SamojectListRightFrozenRows> {
  List<SamojectListColumn> _columns = [];

  List<SamojectListRow> _rows = [];

  late final ScrollController _scroll;

  @override
  SamojectListGridStateManager get stateManager => widget.stateManager;

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
    _columns = update<List<SamojectListColumn>>(
      _columns,
      _getColumns(),
      compare: listEquals,
    );

    _rows = [
      ...update<List<SamojectListRow>>(
        _rows,
        stateManager.refRows,
        compare: listEquals,
      )
    ];
  }

  List<SamojectListColumn> _getColumns() {
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
        return SamojectListBaseRow(
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
