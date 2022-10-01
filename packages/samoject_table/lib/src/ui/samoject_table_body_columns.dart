import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/samoject_table_grid_state_manager.dart';
import '../model/samoject_table_column.dart';
import '../model/samoject_table_column_group.dart';
import 'ui.dart';

class SamojectTableBodyColumns extends SamojectTableStatefulWidget {
  final SamojectTableGridStateManager stateManager;

  const SamojectTableBodyColumns(
    this.stateManager, {
    super.key,
  });

  @override
  SamojectTableBodyColumnsState createState() =>
      SamojectTableBodyColumnsState();
}

class SamojectTableBodyColumnsState
    extends SamojectTableStateWithChange<SamojectTableBodyColumns> {
  List<SamojectTableColumn> _columns = [];

  List<SamojectTableColumnGroupPair> _columnGroups = [];

  bool _showColumnGroups = false;

  int _itemCount = 0;

  late final ScrollController _scroll;

  @override
  SamojectTableGridStateManager get stateManager => widget.stateManager;

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
    final columns = stateManager.showFrozenColumn
        ? stateManager.bodyColumns
        : stateManager.columns;
    return stateManager.isLTR
        ? columns
        : columns.reversed.toList(growable: false);
  }

  int _getItemCount() {
    return _showColumnGroups == true ? _columnGroups.length : _columns.length;
  }

  SamojectTableVisibilityLayoutId _buildColumnGroup(
      SamojectTableColumnGroupPair e) {
    return SamojectTableVisibilityLayoutId(
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

  SamojectTableVisibilityLayoutId _buildColumn(e) {
    return SamojectTableVisibilityLayoutId(
      id: e.field,
      child: SamojectTableBaseColumn(
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
      child: SamojectTableVisibilityLayout(
        delegate: MainColumnLayoutDelegate(
          stateManager: stateManager,
          columns: _columns,
          columnGroups: _columnGroups,
          frozen: SamojectTableColumnFrozen.none,
        ),
        scrollController: _scroll,
        initialViewportDimension: MediaQuery.of(context).size.width,
        textDirection: stateManager.textDirection,
        children: _showColumnGroups == true
            ? _columnGroups.map(_buildColumnGroup).toList()
            : _columns.map(_buildColumn).toList(),
      ),
    );
  }
}

class MainColumnLayoutDelegate extends MultiChildLayoutDelegate {
  final SamojectTableGridStateManager stateManager;

  final List<SamojectTableColumn> columns;

  final List<SamojectTableColumnGroupPair> columnGroups;

  final SamojectTableColumnFrozen frozen;

  MainColumnLayoutDelegate({
    required this.stateManager,
    required this.columns,
    required this.columnGroups,
    required this.frozen,
  }) : super(relayout: stateManager.resizingChangeNotifier);

  double totalColumnsHeight = 0;

  @override
  Size getSize(BoxConstraints constraints) {
    totalColumnsHeight = 0;

    if (stateManager.showColumnGroups) {
      totalColumnsHeight =
          stateManager.columnGroupHeight + stateManager.columnHeight;
    } else {
      totalColumnsHeight = stateManager.columnHeight;
    }

    totalColumnsHeight += stateManager.columnFilterHeight;

    return Size(
      columns.fold(
        0,
        (previousValue, element) => previousValue += element.width,
      ),
      totalColumnsHeight,
    );
  }

  @override
  void performLayout(Size size) {
    if (stateManager.showColumnGroups) {
      double dx = 0;

      for (SamojectTableColumnGroupPair pair in columnGroups) {
        final double width = pair.columns.fold<double>(
          0,
          (previousValue, element) => previousValue + element.width,
        );

        if (hasChild(pair.key)) {
          var boxConstraints = BoxConstraints.tight(
            Size(width, totalColumnsHeight),
          );

          layoutChild(pair.key, boxConstraints);

          positionChild(pair.key, Offset(dx, 0));
        }

        dx += width;
      }
    } else {
      double dx = 0;

      for (SamojectTableColumn col in columns) {
        var width = col.width;

        if (hasChild(col.field)) {
          var boxConstraints = BoxConstraints.tight(
            Size(width, totalColumnsHeight),
          );

          layoutChild(col.field, boxConstraints);

          positionChild(col.field, Offset(dx, 0));
        }

        dx += width;
      }
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
