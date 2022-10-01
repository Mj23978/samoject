import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/samoject_table_grid_state_manager.dart';
import '../model/samoject_table_column.dart';
import '../model/samoject_table_row.dart';
import 'ui.dart';

class SamojectTableLeftFrozenRows extends SamojectTableStatefulWidget {
  final SamojectTableGridStateManager stateManager;

  const SamojectTableLeftFrozenRows(
    this.stateManager, {
    super.key,
  });

  @override
  SamojectTableLeftFrozenRowsState createState() =>
      SamojectTableLeftFrozenRowsState();
}

class SamojectTableLeftFrozenRowsState
    extends SamojectTableStateWithChange<SamojectTableLeftFrozenRows> {
  List<SamojectTableColumn> _columns = [];

  List<SamojectTableRow> _rows = [];

  late final ScrollController _scroll;

  @override
  SamojectTableGridStateManager get stateManager => widget.stateManager;

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
    _columns = update<List<SamojectTableColumn>>(
      _columns,
      _getColumns(),
      compare: listEquals,
    );

    _rows = [
      ...update<List<SamojectTableRow>>(
        _rows,
        stateManager.refRows,
        compare: listEquals,
      )
    ];
  }

  List<SamojectTableColumn> _getColumns() {
    return stateManager.isLTR
        ? stateManager.leftFrozenColumns
        : stateManager.leftFrozenColumns.reversed.toList(growable: false);
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
        return SamojectTableBaseRow(
          key: ValueKey('left_frozen_row_${_rows[i].key}'),
          rowIdx: i,
          row: _rows[i],
          columns: _columns,
          stateManager: stateManager,
        );
      },
    );
  }
}
