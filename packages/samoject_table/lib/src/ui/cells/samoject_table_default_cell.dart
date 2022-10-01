import 'package:flutter/material.dart';

import '../../manager/event/samoject_table_grid_scroll_update_event.dart';
import '../../manager/samoject_table_grid_state_manager.dart';
import '../../model/samoject_table_cell.dart';
import '../../model/samoject_table_column.dart';
import '../../model/samoject_table_row.dart';
import '../../samoject_table_grid.dart';
import '../../widgets/samoject_table_scaled_checkbox.dart';
import '../../widgets/samoject_table_shadow_container.dart';
import '../miscellaneous/samoject_table_state_with_change.dart';
import '../ui.dart';

typedef DragUpdatedCallback = Function(Offset offset);

class SamojectTableDefaultCell extends SamojectTableStatefulWidget {
  final SamojectTableCell cell;

  final SamojectTableColumn column;

  final int rowIdx;

  final SamojectTableRow row;

  final SamojectTableGridStateManager stateManager;

  const SamojectTableDefaultCell({
    required this.cell,
    required this.column,
    required this.rowIdx,
    required this.row,
    required this.stateManager,
    Key? key,
  }) : super(key: key);

  @override
  State<SamojectTableDefaultCell> createState() =>
      _SamojectTableDefaultCellState();
}

class _SamojectTableDefaultCellState
    extends SamojectTableStateWithChange<SamojectTableDefaultCell> {
  bool _hasFocus = false;

  bool _canRowDrag = false;

  bool _isCurrentCell = false;

  String _text = '';

  @override
  SamojectTableGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    updateState();
  }

  @override
  void updateState() {
    _hasFocus = update<bool>(
      _hasFocus,
      stateManager.hasFocus,
    );

    _canRowDrag = update<bool>(
      _canRowDrag,
      widget.column.enableRowDrag && stateManager.canRowDrag,
    );

    _isCurrentCell = update<bool>(
      _isCurrentCell,
      stateManager.isCurrentCell(widget.cell),
    );

    _text = update<String>(
      _text,
      widget.column.formattedValueForDisplay(widget.cell.value),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cellWidget = _BuildDefaultCellWidget(
      stateManager: stateManager,
      rowIdx: widget.rowIdx,
      row: widget.row,
      column: widget.column,
      cell: widget.cell,
    );

    return Row(
      children: [
        if (_canRowDrag)
          _RowDragIconWidget(
            column: widget.column,
            row: widget.row,
            rowIdx: widget.rowIdx,
            stateManager: stateManager,
            feedbackWidget: cellWidget,
            dragIcon: Icon(
              Icons.drag_indicator,
              size: stateManager.configuration.style.iconSize,
              color: stateManager.configuration.style.iconColor,
            ),
          ),
        if (widget.column.enableRowChecked)
          _CheckboxSelectionWidget(
            column: widget.column,
            row: widget.row,
            rowIdx: widget.rowIdx,
            stateManager: stateManager,
          ),
        Expanded(
          child: cellWidget,
        ),
      ],
    );
  }
}

class _RowDragIconWidget extends StatelessWidget {
  final SamojectTableColumn column;

  final SamojectTableRow row;

  final int rowIdx;

  final SamojectTableGridStateManager stateManager;

  final Widget dragIcon;

  final Widget feedbackWidget;

  const _RowDragIconWidget({
    required this.column,
    required this.row,
    required this.rowIdx,
    required this.stateManager,
    required this.dragIcon,
    required this.feedbackWidget,
    Key? key,
  }) : super(key: key);

  List<SamojectTableRow> get _draggingRows {
    if (stateManager.currentSelectingRows.isEmpty) {
      return [row];
    }

    if (stateManager.isSelectedRow(row.key)) {
      return stateManager.currentSelectingRows;
    }

    // In case there are selected rows,
    // if the dragging row is not included in it,
    // the selection of rows is invalidated.
    stateManager.clearCurrentSelecting(notify: false);

    return [row];
  }

  void _handleOnPointerDown(PointerDownEvent event) {
    stateManager.setIsDraggingRow(true, notify: false);

    stateManager.setDragRows(_draggingRows);
  }

  void _handleOnPointerMove(PointerMoveEvent event) {
    // Do not drag while rows are selected.
    if (stateManager.isSelecting) {
      stateManager.setIsDraggingRow(false);

      return;
    }

    stateManager.eventManager!.addEvent(SamojectTableGridScrollUpdateEvent(
      offset: event.position,
    ));

    int? targetRowIdx = stateManager.getRowIdxByOffset(
      event.position.dy,
    );

    stateManager.setDragTargetRowIdx(targetRowIdx);
  }

  void _handleOnPointerUp(PointerUpEvent event) {
    stateManager.setIsDraggingRow(false);

    SamojectTableGridScrollUpdateEvent.stopScroll(
      stateManager,
      SamojectTableGridScrollUpdateDirection.all,
    );
  }

  @override
  Widget build(BuildContext context) {
    final translationX = stateManager.isRTL ? -0.92 : -0.08;

    return Listener(
      onPointerDown: _handleOnPointerDown,
      onPointerMove: _handleOnPointerMove,
      onPointerUp: _handleOnPointerUp,
      child: Draggable<SamojectTableRow>(
        data: row,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        feedback: FractionalTranslation(
          translation: Offset(translationX, -0.5),
          child: Material(
            child: SamojectTableShadowContainer(
              width: column.width,
              height: stateManager.rowHeight,
              backgroundColor:
                  stateManager.configuration.style.gridBackgroundColor,
              borderColor:
                  stateManager.configuration.style.activatedBorderColor,
              child: Row(
                children: [
                  dragIcon,
                  Expanded(
                    child: feedbackWidget,
                  ),
                ],
              ),
            ),
          ),
        ),
        child: dragIcon,
      ),
    );
  }
}

class _CheckboxSelectionWidget extends SamojectTableStatefulWidget {
  final SamojectTableGridStateManager stateManager;

  final SamojectTableColumn column;

  final SamojectTableRow row;

  final int rowIdx;

  const _CheckboxSelectionWidget({
    required this.stateManager,
    required this.column,
    required this.row,
    required this.rowIdx,
  });

  @override
  _CheckboxSelectionWidgetState createState() =>
      _CheckboxSelectionWidgetState();
}

class _CheckboxSelectionWidgetState
    extends SamojectTableStateWithChange<_CheckboxSelectionWidget> {
  bool? _checked;

  @override
  SamojectTableGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    updateState();
  }

  @override
  void updateState() {
    _checked = update<bool?>(
      _checked,
      widget.row.checked == true,
    );
  }

  void _handleOnChanged(bool? changed) {
    if (changed == _checked) {
      return;
    }

    stateManager.setRowChecked(widget.row, changed == true);

    if (stateManager.onRowChecked != null) {
      stateManager.onRowChecked!(
        SamojectTableGridOnRowCheckedOneEvent(
          row: widget.row,
          rowIdx: widget.rowIdx,
          isChecked: changed,
        ),
      );
    }

    setState(() {
      _checked = changed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SamojectTableScaledCheckbox(
      value: _checked,
      handleOnChanged: _handleOnChanged,
      scale: 0.86,
      unselectedColor: stateManager.configuration.style.iconColor,
      activeColor: stateManager.configuration.style.activatedBorderColor,
      checkColor: stateManager.configuration.style.activatedColor,
    );
  }
}

class _BuildDefaultCellWidget extends StatelessWidget {
  final SamojectTableGridStateManager stateManager;

  final int rowIdx;

  final SamojectTableRow row;

  final SamojectTableColumn column;

  final SamojectTableCell cell;

  const _BuildDefaultCellWidget({
    required this.stateManager,
    required this.rowIdx,
    required this.row,
    required this.column,
    required this.cell,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (column.hasRenderer) {
      return column.renderer!(SamojectTableColumnRendererContext(
        column: column,
        rowIdx: rowIdx,
        row: row,
        cell: cell,
        stateManager: stateManager,
      ));
    }

    return Text(
      column.formattedValueForDisplay(cell.value),
      style: stateManager.configuration.style.cellTextStyle.copyWith(
        decoration: TextDecoration.none,
        fontWeight: FontWeight.normal,
      ),
      overflow: TextOverflow.ellipsis,
      textAlign: column.textAlign.value,
    );
  }
}
