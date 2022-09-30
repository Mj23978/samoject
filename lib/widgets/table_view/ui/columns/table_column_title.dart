import 'dart:math';

import 'package:flutter/material.dart';

import '../../helper/show_column_menu.dart';
import '../../manager/event/table_grid_scroll_update_event.dart';
import '../../manager/table_grid_state_manager.dart';
import '../../model/table_column.dart';
import '../../table_grid.dart';
import '../../widgets/table_scaled_checkbox.dart';
import '../../widgets/table_shadow_container.dart';
import '../miscellaneous/table_state_with_change.dart';
import '../ui.dart';

class TableColumnTitle extends TableStatefulWidget {
  final TableGridStateManager stateManager;

  final TableViewColumn column;

  late final double height;

  TableColumnTitle({
    required this.stateManager,
    required this.column,
    double? height,
  })  : height = height ?? stateManager.columnHeight,
        super(key: ValueKey('column_title_${column.key}'));

  @override
  TableColumnTitleState createState() => TableColumnTitleState();
}

class TableColumnTitleState extends TableStateWithChange<TableColumnTitle> {
  late Offset _columnRightPosition;

  bool _isPointMoving = false;

  TableColumnSort _sort = TableColumnSort.none;

  bool get showContextIcon {
    return widget.column.enableContextMenu ||
        widget.column.enableDropToResize ||
        !_sort.isNone;
  }

  bool get enableGesture {
    return widget.column.enableContextMenu || widget.column.enableDropToResize;
  }

  MouseCursor get contextMenuCursor {
    if (enableGesture) {
      return widget.column.enableDropToResize
          ? SystemMouseCursors.resizeLeftRight
          : SystemMouseCursors.click;
    }

    return SystemMouseCursors.basic;
  }

  @override
  TableGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    updateState();
  }

  @override
  void updateState() {
    _sort = update<TableColumnSort>(
      _sort,
      widget.column.sort,
    );
  }

  void _showContextMenu(BuildContext context, Offset position) async {
    final selected = await showColumnMenu(
      context: context,
      position: position,
      backgroundColor: stateManager.style.menuBackgroundColor,
      items: stateManager.columnMenuDelegate.buildMenuItems(
        stateManager: stateManager,
        column: widget.column,
      ),
    );

    stateManager.columnMenuDelegate.onSelected(
      context: context,
      stateManager: stateManager,
      column: widget.column,
      mounted: mounted,
      selected: selected,
    );
  }

  void _handleOnPointDown(PointerDownEvent event) {
    _isPointMoving = false;

    _columnRightPosition = event.position;
  }

  void _handleOnPointMove(PointerMoveEvent event) {
    _isPointMoving =
        (_columnRightPosition - event.position).distanceSquared > 0.5;

    if (!_isPointMoving) {
      return;
    }

    final moveOffset = event.position.dx - _columnRightPosition.dx;

    final bool isLTR = stateManager.isLTR;

    stateManager.resizeColumn(widget.column, isLTR ? moveOffset : -moveOffset);

    _columnRightPosition = event.position;
  }

  void _handleOnPointUp(PointerUpEvent event) {
    if (_isPointMoving) {
      stateManager.updateCorrectScrollOffset();
    } else if (mounted && widget.column.enableContextMenu) {
      _showContextMenu(context, event.position);
    }

    _isPointMoving = false;
  }

  @override
  Widget build(BuildContext context) {
    final style = stateManager.configuration.style;

    final columnWidget = _BuildSortableWidget(
      stateManager: stateManager,
      column: widget.column,
      child: _BuildColumnWidget(
        stateManager: stateManager,
        column: widget.column,
        height: widget.height,
      ),
    );

    final contextMenuIcon = Container(
      height: widget.height,
      alignment: Alignment.center,
      child: IconButton(
        icon: TableGridColumnIcon(
          sort: _sort,
          color: style.iconColor,
          icon: widget.column.enableContextMenu
              ? style.columnContextIcon
              : style.columnResizeIcon,
          ascendingIcon: style.columnAscendingIcon,
          descendingIcon: style.columnDescendingIcon,
        ),
        iconSize: style.iconSize,
        mouseCursor: contextMenuCursor,
        onPressed: null,
      ),
    );

    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: widget.column.enableColumnDrag
              ? _BuildDraggableWidget(
                  stateManager: stateManager,
                  column: widget.column,
                  child: columnWidget,
                )
              : columnWidget,
        ),
        if (showContextIcon)
          Positioned.directional(
            textDirection: stateManager.textDirection,
            end: -3,
            child: enableGesture
                ? Listener(
                    onPointerDown: _handleOnPointDown,
                    onPointerMove: _handleOnPointMove,
                    onPointerUp: _handleOnPointUp,
                    child: contextMenuIcon,
                  )
                : contextMenuIcon,
          ),
      ],
    );
  }
}

class TableGridColumnIcon extends StatelessWidget {
  final TableColumnSort? sort;

  final Color color;

  final IconData icon;

  final Icon? ascendingIcon;

  final Icon? descendingIcon;

  const TableGridColumnIcon({
    this.sort,
    this.color = Colors.black26,
    this.icon = Icons.dehaze,
    this.ascendingIcon,
    this.descendingIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (sort) {
      case TableColumnSort.ascending:
        return ascendingIcon == null
            ? Transform.rotate(
                angle: 90 * pi / 90,
                child: const Icon(
                  Icons.sort,
                  color: Colors.green,
                ),
              )
            : ascendingIcon!;
      case TableColumnSort.descending:
        return descendingIcon == null
            ? const Icon(
                Icons.sort,
                color: Colors.red,
              )
            : descendingIcon!;
      default:
        return Icon(
          icon,
          color: color,
        );
    }
  }
}

class _BuildDraggableWidget extends StatelessWidget {
  final TableGridStateManager stateManager;

  final TableViewColumn column;

  final Widget child;

  const _BuildDraggableWidget({
    required this.stateManager,
    required this.column,
    required this.child,
    Key? key,
  }) : super(key: key);

  void _handleOnPointerMove(PointerMoveEvent event) {
    stateManager.eventManager!.addEvent(TableGridScrollUpdateEvent(
      offset: event.position,
      scrollDirection: TableGridScrollUpdateDirection.horizontal,
    ));
  }

  void _handleOnPointerUp(PointerUpEvent event) {
    TableGridScrollUpdateEvent.stopScroll(
      stateManager,
      TableGridScrollUpdateDirection.horizontal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: _handleOnPointerMove,
      onPointerUp: _handleOnPointerUp,
      child: Draggable<TableViewColumn>(
        data: column,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        feedback: FractionalTranslation(
          translation: const Offset(-0.5, -0.5),
          child: TableShadowContainer(
            alignment: column.titleTextAlign.alignmentValue,
            width: TableGridSettings.minColumnWidth,
            height: stateManager.columnHeight,
            backgroundColor:
                stateManager.configuration.style.gridBackgroundColor,
            borderColor: stateManager.configuration.style.gridBorderColor,
            child: Text(
              column.title,
              style: stateManager.configuration.style.columnTextStyle.copyWith(
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}

class _BuildSortableWidget extends StatelessWidget {
  final TableGridStateManager? stateManager;

  final TableViewColumn? column;

  final Widget? child;

  const _BuildSortableWidget({
    Key? key,
    this.stateManager,
    this.column,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return column!.enableSorting
        ? InkWell(
            onTap: () {
              stateManager!.toggleSortColumn(column!);
            },
            child: child,
          )
        : child!;
  }
}

class _BuildColumnWidget extends StatelessWidget {
  final TableGridStateManager stateManager;

  final TableViewColumn column;

  final double height;

  const _BuildColumnWidget({
    required this.stateManager,
    required this.column,
    required this.height,
    Key? key,
  }) : super(key: key);

  EdgeInsets get padding =>
      column.titlePadding ??
      stateManager.configuration.style.defaultColumnTitlePadding;

  bool get showSizedBoxForIcon =>
      column.isShowRightIcon &&
      (column.titleTextAlign.isRight || stateManager.isRTL);

  @override
  Widget build(BuildContext context) {
    return DragTarget<TableViewColumn>(
      onWillAccept: (TableViewColumn? columnToDrag) {
        return columnToDrag != null &&
            columnToDrag.key != column.key &&
            !stateManager.limitMoveColumn(
              column: columnToDrag,
              targetColumn: column,
            );
      },
      onAccept: (TableViewColumn columnToMove) {
        if (columnToMove.key != column.key) {
          stateManager.moveColumn(column: columnToMove, targetColumn: column);
        }
      },
      builder: (dragContext, candidate, rejected) {
        final bool noDragTarget = candidate.isEmpty;

        final style = stateManager.style;

        return Container(
          width: column.width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: noDragTarget
                ? column.backgroundColor
                : style.dragTargetColumnColor,
            border: BorderDirectional(
              end: style.enableColumnBorderVertical
                  ? BorderSide(color: style.borderColor, width: 1.0)
                  : BorderSide.none,
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                if (column.enableRowChecked)
                  _CheckboxAllSelectionWidget(
                    column: column,
                    stateManager: stateManager,
                  ),
                Expanded(
                  child: _ColumnTextWidget(
                    column: column,
                    stateManager: stateManager,
                    height: height,
                  ),
                ),
                if (showSizedBoxForIcon) SizedBox(width: style.iconSize),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CheckboxAllSelectionWidget extends TableStatefulWidget {
  final TableGridStateManager stateManager;

  final TableViewColumn? column;

  const _CheckboxAllSelectionWidget({
    required this.stateManager,
    this.column,
    Key? key,
  }) : super(key: key);

  @override
  _CheckboxAllSelectionWidgetState createState() =>
      _CheckboxAllSelectionWidgetState();
}

class _CheckboxAllSelectionWidgetState
    extends TableStateWithChange<_CheckboxAllSelectionWidget> {
  bool? _checked;

  @override
  TableGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    updateState();
  }

  @override
  void updateState() {
    _checked = update<bool?>(
      _checked,
      stateManager.tristateCheckedRow,
    );
  }

  void _handleOnChanged(bool? changed) {
    if (changed == _checked) {
      return;
    }

    changed ??= false;

    if (_checked == null) {
      changed = true;
    }

    stateManager.toggleAllRowChecked(changed);

    if (stateManager.onRowChecked != null) {
      stateManager.onRowChecked!(
        TableGridOnRowCheckedAllEvent(isChecked: changed),
      );
    }

    setState(() {
      _checked = changed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableScaledCheckbox(
      value: _checked,
      handleOnChanged: _handleOnChanged,
      tristate: true,
      scale: 0.86,
      unselectedColor: stateManager.configuration.style.iconColor,
      activeColor: stateManager.configuration.style.activatedBorderColor,
      checkColor: stateManager.configuration.style.activatedColor,
    );
  }
}

class _ColumnTextWidget extends TableStatefulWidget {
  final TableGridStateManager stateManager;

  final TableViewColumn column;

  final double height;

  const _ColumnTextWidget({
    required this.stateManager,
    required this.column,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  _ColumnTextWidgetState createState() => _ColumnTextWidgetState();
}

class _ColumnTextWidgetState extends TableStateWithChange<_ColumnTextWidget> {
  bool _isFilteredList = false;

  @override
  TableGridStateManager get stateManager => widget.stateManager;

  @override
  void initState() {
    super.initState();

    updateState();
  }

  @override
  void updateState() {
    _isFilteredList = update<bool>(
      _isFilteredList,
      stateManager.isFilteredColumn(widget.column),
    );
  }

  void _handleOnPressedFilter() {
    stateManager.showFilterPopup(
      context,
      calledColumn: widget.column,
    );
  }

  String? get _title =>
      widget.column.titleSpan == null ? widget.column.title : null;

  List<InlineSpan> get _children => [
        if (widget.column.titleSpan != null) widget.column.titleSpan!,
        if (_isFilteredList)
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: IconButton(
              icon: Icon(
                Icons.filter_alt_outlined,
                color: stateManager.configuration.style.iconColor,
                size: stateManager.configuration.style.iconSize,
              ),
              onPressed: _handleOnPressedFilter,
              constraints: BoxConstraints(
                maxHeight:
                    widget.height + (TableGridSettings.rowBorderWidth * 2),
              ),
            ),
          ),
      ];

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: _title,
        children: _children,
      ),
      style: stateManager.configuration.style.columnTextStyle,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      maxLines: 1,
      textAlign: widget.column.titleTextAlign.value,
    );
  }
}
