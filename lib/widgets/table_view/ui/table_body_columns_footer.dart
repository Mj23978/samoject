import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/table_grid_state_manager.dart';
import '../model/table_column.dart';
import 'ui.dart';

class TableBodyColumnsFooter extends TableStatefulWidget {
  final TableGridStateManager stateManager;

  const TableBodyColumnsFooter(
    this.stateManager, {
    super.key,
  });

  @override
  TableBodyColumnsFooterState createState() => TableBodyColumnsFooterState();
}

class TableBodyColumnsFooterState
    extends TableStateWithChange<TableBodyColumnsFooter> {
  List<TableViewColumn> _columns = [];

  int _itemCount = 0;

  late final ScrollController _scroll;

  @override
  TableGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    _scroll = stateManager.scroll!.horizontal!.addAndGet();

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

    _itemCount = update<int>(_itemCount, _getItemCount());
  }

  List<TableViewColumn> _getColumns() {
    final columns = stateManager.showFrozenColumn
        ? stateManager.bodyColumns
        : stateManager.columns;
    return stateManager.isLTR
        ? columns
        : columns.reversed.toList(growable: false);
  }

  int _getItemCount() {
    return _columns.length;
  }

  TableVisibilityLayoutId _buildFooter(e) {
    return TableVisibilityLayoutId(
      id: e.field,
      child: TableBaseColumnFooter(
        stateManager: stateManager,
        column: e,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scroll,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: TableVisibilityLayout(
        delegate: ColumnFooterLayoutDelegate(
          stateManager: stateManager,
          columns: _columns,
        ),
        scrollController: _scroll,
        initialViewportDimension: MediaQuery.of(context).size.width,
        textDirection: stateManager.textDirection,
        children: _columns.map(_buildFooter).toList(),
      ),
    );
  }
}

class ColumnFooterLayoutDelegate extends MultiChildLayoutDelegate {
  final TableGridStateManager stateManager;

  final List<TableViewColumn> columns;

  ColumnFooterLayoutDelegate({
    required this.stateManager,
    required this.columns,
  }) : super(relayout: stateManager.resizingChangeNotifier);

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(
      columns.fold(
        0,
        (previousValue, element) => previousValue += element.width,
      ),
      stateManager.columnFooterHeight,
    );
  }

  @override
  void performLayout(Size size) {
    double dx = 0;
    for (TableViewColumn col in columns) {
      var width = col.width;

      if (hasChild(col.field)) {
        var boxConstraints = BoxConstraints.tight(
          Size(width, stateManager.columnFooterHeight),
        );

        layoutChild(col.field, boxConstraints);

        positionChild(col.field, Offset(dx, 0));
      }
      dx += width;
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
