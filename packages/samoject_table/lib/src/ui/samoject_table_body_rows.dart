import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/samoject_table_grid_state_manager.dart';
import '../model/samoject_table_column.dart';
import '../model/samoject_table_row.dart';
import '../widgets/samoject_table_scrollbar.dart';
import 'ui.dart';

class SamojectTableBodyRows extends SamojectTableStatefulWidget {
  final SamojectTableGridStateManager stateManager;

  const SamojectTableBodyRows(
    this.stateManager, {
    super.key,
  });

  @override
  SamojectTableBodyRowsState createState() => SamojectTableBodyRowsState();
}

class SamojectTableBodyRowsState
    extends SamojectTableStateWithChange<SamojectTableBodyRows> {
  List<SamojectTableColumn> _columns = [];

  List<SamojectTableRow> _rows = [];

  late final ScrollController _verticalScroll;

  late final ScrollController _horizontalScroll;

  @override
  SamojectTableGridStateManager get stateManager => widget.stateManager;

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

    return SamojectTableScrollbar(
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
              return SamojectTableBaseRow(
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
  SamojectTableGridStateManager stateManager;

  List<SamojectTableColumn> columns;

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
