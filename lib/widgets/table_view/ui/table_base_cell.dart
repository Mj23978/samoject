import 'package:flutter/material.dart';

import '../model/table_column_type.dart';
import '../manager/event/table_grid_cell_gesture_event.dart';
import '../manager/table_grid_state_manager.dart';
import '../model/table_cell.dart';
import '../model/table_column.dart';
import '../model/table_row.dart';
import 'ui.dart';

class TableBaseCell extends StatelessWidget
    implements TableVisibilityLayoutChild {
  final TableViewCell cell;

  final TableViewColumn column;

  final int rowIdx;

  final TableViewRow row;

  final TableGridStateManager stateManager;

  const TableBaseCell({
    Key? key,
    required this.cell,
    required this.column,
    required this.rowIdx,
    required this.row,
    required this.stateManager,
  }) : super(key: key);

  @override
  double get width => column.width;

  @override
  double get startPosition => column.startPosition;

  @override
  bool get keepAlive => stateManager.currentCell == cell;

  void _addGestureEvent(TableGridGestureType gestureType, Offset offset) {
    stateManager.eventManager!.addEvent(
      TableGridCellGestureEvent(
        gestureType: gestureType,
        offset: offset,
        cell: cell,
        column: column,
        rowIdx: rowIdx,
      ),
    );
  }

  void _handleOnTapUp(TapUpDetails details) {
    _addGestureEvent(TableGridGestureType.onTapUp, details.globalPosition);
  }

  void _handleOnLongPressStart(LongPressStartDetails details) {
    if (stateManager.selectingMode.isNone) {
      return;
    }

    _addGestureEvent(
      TableGridGestureType.onLongPressStart,
      details.globalPosition,
    );
  }

  void _handleOnLongPressMoveUpdate(LongPressMoveUpdateDetails details) {
    if (stateManager.selectingMode.isNone) {
      return;
    }

    _addGestureEvent(
      TableGridGestureType.onLongPressMoveUpdate,
      details.globalPosition,
    );
  }

  void _handleOnLongPressEnd(LongPressEndDetails details) {
    if (stateManager.selectingMode.isNone) {
      return;
    }

    _addGestureEvent(
      TableGridGestureType.onLongPressEnd,
      details.globalPosition,
    );
  }

  void _handleOnDoubleTap() {
    _addGestureEvent(TableGridGestureType.onDoubleTap, Offset.zero);
  }

  void _handleOnSecondaryTap(TapDownDetails details) {
    _addGestureEvent(
      TableGridGestureType.onSecondaryTap,
      details.globalPosition,
    );
  }

  void Function()? _onDoubleTapOrNull() {
    return stateManager.onRowDoubleTap == null ? null : _handleOnDoubleTap;
  }

  void Function(TapDownDetails details)? _onSecondaryTapOrNull() {
    return stateManager.onRowSecondaryTap == null
        ? null
        : _handleOnSecondaryTap;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      // Essential gestures.
      onTapUp: _handleOnTapUp,
      onLongPressStart: _handleOnLongPressStart,
      onLongPressMoveUpdate: _handleOnLongPressMoveUpdate,
      onLongPressEnd: _handleOnLongPressEnd,
      // Optional gestures.
      onDoubleTap: _onDoubleTapOrNull(),
      onSecondaryTapDown: _onSecondaryTapOrNull(),
      child: _CellContainer(
        cell: cell,
        rowIdx: rowIdx,
        row: row,
        column: column,
        cellPadding: column.cellPadding ??
            stateManager.configuration.style.defaultCellPadding,
        stateManager: stateManager,
        child: _BuildCell(
          stateManager: stateManager,
          rowIdx: rowIdx,
          column: column,
          row: row,
          cell: cell,
        ),
      ),
    );
  }
}

class _CellContainer extends TableStatefulWidget {
  final TableViewCell cell;

  final TableViewRow row;

  final int rowIdx;

  final TableViewColumn column;

  final EdgeInsets cellPadding;

  final TableGridStateManager stateManager;

  final Widget child;

  const _CellContainer({
    required this.cell,
    required this.row,
    required this.rowIdx,
    required this.column,
    required this.cellPadding,
    required this.stateManager,
    required this.child,
  });

  @override
  State<_CellContainer> createState() => _CellContainerState();
}

class _CellContainerState extends TableStateWithChange<_CellContainer> {
  BoxDecoration _decoration = const BoxDecoration();

  @override
  TableGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    updateState();
  }

  @override
  void updateState() {
    final style = stateManager.style;

    final isCurrentCell = stateManager.isCurrentCell(widget.cell);

    _decoration = update(
      _decoration,
      _boxDecoration(
        hasFocus: stateManager.hasFocus,
        readOnly: widget.column.checkReadOnly(widget.row, widget.cell),
        isEditing: stateManager.isEditing,
        isCurrentCell: isCurrentCell,
        isSelectedCell: stateManager.isSelectedCell(
          widget.cell,
          widget.column,
          widget.rowIdx,
        ),
        enableCellVerticalBorder: style.enableCellBorderVertical,
        borderColor: style.borderColor,
        activatedBorderColor: style.activatedBorderColor,
        activatedColor: style.activatedColor,
        inactivatedBorderColor: style.inactivatedBorderColor,
        gridBackgroundColor: style.gridBackgroundColor,
        cellColorInEditState: style.cellColorInEditState,
        cellColorInReadOnlyState: style.cellColorInReadOnlyState,
        selectingMode: stateManager.selectingMode,
      ),
    );
  }

  Color? _currentCellColor({
    required bool readOnly,
    required bool hasFocus,
    required bool isEditing,
    required Color activatedColor,
    required Color gridBackgroundColor,
    required Color cellColorInEditState,
    required Color cellColorInReadOnlyState,
    required TableGridSelectingMode selectingMode,
  }) {
    if (!hasFocus) {
      return gridBackgroundColor;
    }

    if (!isEditing) {
      return selectingMode.isRow ? activatedColor : null;
    }

    return readOnly == true ? cellColorInReadOnlyState : cellColorInEditState;
  }

  BoxDecoration _boxDecoration({
    required bool hasFocus,
    required bool readOnly,
    required bool isEditing,
    required bool isCurrentCell,
    required bool isSelectedCell,
    required bool enableCellVerticalBorder,
    required Color borderColor,
    required Color activatedBorderColor,
    required Color activatedColor,
    required Color inactivatedBorderColor,
    required Color gridBackgroundColor,
    required Color cellColorInEditState,
    required Color cellColorInReadOnlyState,
    required TableGridSelectingMode selectingMode,
  }) {
    if (isCurrentCell) {
      return BoxDecoration(
        color: _currentCellColor(
          hasFocus: hasFocus,
          isEditing: isEditing,
          readOnly: readOnly,
          gridBackgroundColor: gridBackgroundColor,
          activatedColor: activatedColor,
          cellColorInReadOnlyState: cellColorInReadOnlyState,
          cellColorInEditState: cellColorInEditState,
          selectingMode: selectingMode,
        ),
        border: Border.all(
          color: hasFocus ? activatedBorderColor : inactivatedBorderColor,
          width: 1,
        ),
      );
    } else if (isSelectedCell) {
      return BoxDecoration(
        color: activatedColor,
        border: Border.all(
          color: hasFocus ? activatedBorderColor : inactivatedBorderColor,
          width: 1,
        ),
      );
    } else {
      return enableCellVerticalBorder
          ? BoxDecoration(
              border: BorderDirectional(
                end: BorderSide(
                  color: borderColor,
                  width: 1.0,
                ),
              ),
            )
          : const BoxDecoration();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration,
      padding: widget.cellPadding,
      child: widget.child,
    );
  }
}

class _BuildCell extends TableStatefulWidget {
  final TableGridStateManager stateManager;

  final int rowIdx;

  final TableViewRow row;

  final TableViewColumn column;

  final TableViewCell cell;

  const _BuildCell({
    required this.stateManager,
    required this.rowIdx,
    required this.row,
    required this.column,
    required this.cell,
    Key? key,
  }) : super(key: key);

  @override
  State<_BuildCell> createState() => _BuildCellState();
}

class _BuildCellState extends TableStateWithChange<_BuildCell> {
  bool _showTypedCell = false;

  @override
  TableGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    updateState();
  }

  @override
  void updateState() {
    super.updateState();

    _showTypedCell = update<bool>(
      _showTypedCell,
      stateManager.isEditing && stateManager.isCurrentCell(widget.cell),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_showTypedCell && widget.column.enableEditingMode == true) {
      if (widget.column.type.isSelect) {
        return TableSelectCell(
          stateManager: stateManager,
          cell: widget.cell,
          column: widget.column,
          row: widget.row,
        );
      } else if (widget.column.type.isNumber) {
        return TableNumberCell(
          stateManager: stateManager,
          cell: widget.cell,
          column: widget.column,
          row: widget.row,
        );
      } else if (widget.column.type.isDate) {
        return TableDateCell(
          stateManager: stateManager,
          cell: widget.cell,
          column: widget.column,
          row: widget.row,
        );
      } else if (widget.column.type.isTime) {
        return TableTimeCell(
          stateManager: stateManager,
          cell: widget.cell,
          column: widget.column,
          row: widget.row,
        );
      } else if (widget.column.type.isText) {
        return TableTextCell(
          stateManager: stateManager,
          cell: widget.cell,
          column: widget.column,
          row: widget.row,
        );
      } else if (widget.column.type.isCurrency) {
        return TableCurrencyCell(
          stateManager: stateManager,
          cell: widget.cell,
          column: widget.column,
          row: widget.row,
        );
      }
    }

    return TableDefaultCell(
      cell: widget.cell,
      column: widget.column,
      rowIdx: widget.rowIdx,
      row: widget.row,
      stateManager: stateManager,
    );
  }
}
