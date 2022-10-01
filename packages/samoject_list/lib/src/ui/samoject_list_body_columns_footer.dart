import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/samoject_list_grid_state_manager.dart';
import '../model/samoject_list_column.dart';
import 'ui.dart';

class SamojectListBodyColumnsFooter extends SamojectListStatefulWidget {
  final SamojectListGridStateManager stateManager;

  const SamojectListBodyColumnsFooter(
    this.stateManager, {
    super.key,
  });

  @override
  SamojectListBodyColumnsFooterState createState() =>
      SamojectListBodyColumnsFooterState();
}

class SamojectListBodyColumnsFooterState
    extends SamojectListStateWithChange<SamojectListBodyColumnsFooter> {
  List<SamojectListColumn> _columns = [];

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
    _columns = update<List<SamojectListColumn>>(
      _columns,
      _getColumns(),
      compare: listEquals,
    );

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
    return _columns.length;
  }

  SamojectListVisibilityLayoutId _buildFooter(e) {
    return SamojectListVisibilityLayoutId(
      id: e.field,
      child: SamojectListBaseColumnFooter(
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
  final SamojectListGridStateManager stateManager;

  final List<SamojectListColumn> columns;

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
    for (SamojectListColumn col in columns) {
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
