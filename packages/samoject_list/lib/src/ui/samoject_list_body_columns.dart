import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/samoject_list_grid_state_manager.dart';
import '../model/samoject_list_column.dart';
import '../model/samoject_list_column_group.dart';
import 'ui.dart';

class SamojectListBodyColumns extends SamojectListStatefulWidget {
  final SamojectListGridStateManager stateManager;

  const SamojectListBodyColumns(
    this.stateManager, {
    super.key,
  });

  @override
  SamojectListBodyColumnsState createState() => SamojectListBodyColumnsState();
}

class SamojectListBodyColumnsState
    extends SamojectListStateWithChange<SamojectListBodyColumns> {
  List<SamojectListColumn> _columns = [];

  List<SamojectListColumnGroupPair> _columnGroups = [];

  bool _showColumnGroups = false;

  int _itemCount = 0;

  late final ScrollController _scroll;

  @override
  SamojectListGridStateManager get stateManager => widget.stateManager;

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

  SamojectListVisibilityLayoutId _buildColumnGroup(
      SamojectListColumnGroupPair e) {
    return SamojectListVisibilityLayoutId(
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

  SamojectListVisibilityLayoutId _buildColumn(e) {
    return SamojectListVisibilityLayoutId(
      id: e.field,
      child: SamojectListBaseColumn(
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
      child: SamojectListVisibilityLayout(
        delegate: MainColumnLayoutDelegate(
          stateManager: stateManager,
          columns: _columns,
          columnGroups: _columnGroups,
          frozen: SamojectListColumnFrozen.none,
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
  final SamojectListGridStateManager stateManager;

  final List<SamojectListColumn> columns;

  final List<SamojectListColumnGroupPair> columnGroups;

  final SamojectListColumnFrozen frozen;

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

      for (SamojectListColumnGroupPair pair in columnGroups) {
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

      for (SamojectListColumn col in columns) {
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
