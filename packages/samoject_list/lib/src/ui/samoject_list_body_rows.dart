import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/samoject_list_grid_state_manager.dart';
import '../model/samoject_list_column.dart';
import '../model/samoject_list_row.dart';
import '../widgets/samoject_list_scrollbar.dart';
import 'ui.dart';

class SamojectListBodyRows extends SamojectListStatefulWidget {
  final SamojectListGridStateManager stateManager;

  const SamojectListBodyRows(
    this.stateManager, {
    super.key,
  });

  @override
  SamojectListBodyRowsState createState() => SamojectListBodyRowsState();
}

class SamojectListBodyRowsState
    extends SamojectListStateWithChange<SamojectListBodyRows> {
  List<SamojectListColumn> _columns = [];

  List<SamojectListRow> _rows = [];

  late final ScrollController _verticalScroll;

  late final ScrollController _horizontalScroll;

  @override
  SamojectListGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    _horizontalScroll = stateManager.scroll!.horizontal!.addAndGet();

    stateManager.scroll!.setBodyRowsHorizontal(_horizontalScroll);

    _verticalScroll = stateManager.scroll!.vertical!.addAndGet();

    stateManager.scroll!.setBodyRowsVertical(_verticalScroll);

    updateState();
  }

  @override
  void dispose() {
    _verticalScroll.dispose();

    _horizontalScroll.dispose();

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
    final columns = stateManager.showFrozenColumn == true
        ? stateManager.bodyColumns
        : stateManager.columns;
    return stateManager.isLTR
        ? columns
        : columns.reversed.toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    final scrollbarConfig = stateManager.configuration.scrollbar;

    return SamojectListScrollbar(
      verticalController:
          scrollbarConfig.draggableScrollbar ? _verticalScroll : null,
      horizontalController:
          scrollbarConfig.draggableScrollbar ? _horizontalScroll : null,
      isAlwaysShown: scrollbarConfig.isAlwaysShown,
      thickness: scrollbarConfig.scrollbarThickness,
      thicknessWhileDragging: scrollbarConfig.scrollbarThicknessWhileDragging,
      radius: scrollbarConfig.scrollbarRadius,
      radiusWhileDragging: scrollbarConfig.scrollbarRadiusWhileDragging,
      child: SingleChildScrollView(
        controller: _horizontalScroll,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: CustomSingleChildLayout(
          delegate: ListResizeDelegate(stateManager, _columns),
          child: ListView.builder(
            controller: _verticalScroll,
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            itemCount: _rows.length,
            itemExtent: stateManager.rowTotalHeight,
            addRepaintBoundaries: false,
            itemBuilder: (ctx, i) {
              return SamojectListBaseRow(
                key: ValueKey('body_row_${_rows[i].key}'),
                rowIdx: i,
                row: _rows[i],
                columns: _columns,
                stateManager: stateManager,
                visibilityLayout: true,
              );
            },
          ),
        ),
      ),
    );
  }
}

class ListResizeDelegate extends SingleChildLayoutDelegate {
  SamojectListGridStateManager stateManager;

  List<SamojectListColumn> columns;

  ListResizeDelegate(this.stateManager, this.columns)
      : super(relayout: stateManager.resizingChangeNotifier);

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }

  double _getWidth() {
    return columns.fold(
      0,
      (previousValue, element) => previousValue + element.width,
    );
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return constraints.tighten(width: _getWidth()).biggest;
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return const Offset(0, 0);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(width: _getWidth());
  }
}
