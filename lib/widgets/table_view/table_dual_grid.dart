import 'package:flutter/material.dart';

import 'helper/show_column_menu.dart';
import 'manager/event/table_grid_cannot_move_current_cell_event.dart';
import 'manager/event/table_grid_event.dart';
import 'manager/table_grid_state_manager.dart';
import 'model/table_column.dart';
import 'model/table_column_group.dart';
import 'model/table_row.dart';
import 'table_grid.dart';
import 'table_grid_configuration.dart';

typedef TableDualOnSelectedEventCallback = void Function(
    TableDualOnSelectedEvent event);

/// In [TableDualGrid], set the separation widget between the two grids.
class TableDualGridDivider {
  /// If [show] is set to true, a separator widget appears between the grids,
  /// and you can change the width of two grids by dragging them.
  final bool show;

  /// Set the background color.
  final Color backgroundColor;

  /// Set the icon color in the center of the separator widget.
  final Color indicatorColor;

  /// Set the background color when dragging the separator widget.
  final Color draggingColor;

  const TableDualGridDivider({
    this.show = true,
    this.backgroundColor = Colors.white,
    this.indicatorColor = const Color(0xFFA1A5AE),
    this.draggingColor = const Color(0xFFDCF5FF),
  });

  const TableDualGridDivider.dark({
    this.show = true,
    this.backgroundColor = const Color(0xFF111111),
    this.indicatorColor = const Color(0xFF000000),
    this.draggingColor = const Color(0xFF313131),
  });
}

/// [TableDualGrid] can connect the keyboard movement between the two grids
/// by arranging two [TableGrid] left and right.
class TableDualGrid extends StatefulWidget {
  final TableDualGridProps gridPropsA;

  final TableDualGridProps gridPropsB;

  final TableGridMode? mode;

  final TableDualOnSelectedEventCallback? onSelected;

  /// [TableDualGridDisplayRatio]
  /// Set the width of the two grids by specifying the ratio of the left grid.
  /// 0.5 is 5(left grid):5(right grid).
  /// 0.8 is 8(left grid):2(right grid).
  ///
  /// [TableDualGridDisplayFixedAndExpanded]
  /// Fix the width of the left grid.
  ///
  /// [TableDualGridDisplayExpandedAndFixed]
  /// Fix the width of the right grid.
  final TableDualGridDisplay? display;

  final TableDualGridDivider divider;

  const TableDualGrid({
    required this.gridPropsA,
    required this.gridPropsB,
    this.mode,
    this.onSelected,
    this.display,
    this.divider = const TableDualGridDivider(),
    Key? key,
  }) : super(key: key);

  static const double dividerWidth = 10;

  @override
  TableDualGridState createState() => TableDualGridState();
}

class TableDualGridResizeNotifier extends ChangeNotifier {
  resize() {
    notifyListeners();
  }
}

class TableDualGridState extends State<TableDualGrid> {
  final TableDualGridResizeNotifier resizeNotifier =
      TableDualGridResizeNotifier();

  late final TableDualGridDisplay display;

  TableGridStateManager? _stateManagerA;

  TableGridStateManager? _stateManagerB;

  @override
  void initState() {
    super.initState();

    display = widget.display ?? TableDualGridDisplayRatio();
  }

  Widget _buildGrid({
    required TableDualGridProps props,
    TableGridMode? mode,
    double? width,
    bool? isGridA,
  }) {
    return LayoutId(
      id: isGridA == true ? _TableDualGridId.gridA : _TableDualGridId.gridB,
      child: SizedBox(
        width: width,
        child: TableGrid(
          columns: props.columns,
          rows: props.rows,
          columnGroups: props.columnGroups,
          onLoaded: (TableGridOnLoadedEvent onLoadedEvent) {
            if (isGridA!) {
              _stateManagerA = onLoadedEvent.stateManager;
            } else {
              _stateManagerB = onLoadedEvent.stateManager;
            }

            onLoadedEvent.stateManager.eventManager!
                .listener((TableGridEvent tableEvent) {
              if (tableEvent is TableGridCannotMoveCurrentCellEvent) {
                if (isGridA == true && tableEvent.direction.isRight) {
                  _stateManagerA!.setKeepFocus(false);
                  _stateManagerB!.setKeepFocus(true);
                } else if (isGridA != true && tableEvent.direction.isLeft) {
                  _stateManagerA!.setKeepFocus(true);
                  _stateManagerB!.setKeepFocus(false);
                }
              }
            });

            if (props.onLoaded != null) {
              props.onLoaded!(onLoadedEvent);
            }
          },
          onChanged: props.onChanged,
          onSelected: (TableGridOnSelectedEvent onSelectedEvent) {
            if (onSelectedEvent.row == null || onSelectedEvent.cell == null) {
              widget.onSelected!(
                TableDualOnSelectedEvent(
                  gridA: null,
                  gridB: null,
                ),
              );
            } else {
              widget.onSelected!(
                TableDualOnSelectedEvent(
                  gridA: TableGridOnSelectedEvent(
                    row: _stateManagerA!.currentRow,
                    rowIdx: _stateManagerA!.currentRowIdx,
                    cell: _stateManagerA!.currentCell,
                  ),
                  gridB: TableGridOnSelectedEvent(
                    row: _stateManagerB!.currentRow,
                    rowIdx: _stateManagerB!.currentRowIdx,
                    cell: _stateManagerB!.currentCell,
                  ),
                ),
              );
            }
          },
          onSorted: props.onSorted,
          onRowChecked: props.onRowChecked,
          onRowDoubleTap: props.onRowDoubleTap,
          onRowSecondaryTap: props.onRowSecondaryTap,
          onRowsMoved: props.onRowsMoved,
          createHeader: props.createHeader,
          createFooter: props.createFooter,
          rowColorCallback: props.rowColorCallback,
          columnMenuDelegate: props.columnMenuDelegate,
          configuration: props.configuration,
          mode: mode,
          key: props.key,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isLTR = Directionality.of(context) == TextDirection.ltr;

    return CustomMultiChildLayout(
      delegate: TableDualGridLayoutDelegate(
        notifier: resizeNotifier,
        display: display,
        showDraggableDivider: widget.divider.show,
        isLTR: isLTR,
      ),
      children: [
        _buildGrid(
          props: widget.gridPropsA,
          mode: widget.mode,
          width: 100,
          isGridA: true,
        ),
        if (widget.divider.show == true)
          LayoutId(
            id: _TableDualGridId.divider,
            child: TableDualGridDividerWidget(
              backgroundColor: widget.divider.backgroundColor,
              indicatorColor: widget.divider.indicatorColor,
              draggingColor: widget.divider.draggingColor,
              dragCallback: (details) {
                final RenderBox object =
                    context.findRenderObject() as RenderBox;

                display.offset = object
                    .globalToLocal(Offset(
                      details.globalPosition.dx,
                      details.globalPosition.dy,
                    ))
                    .dx;

                resizeNotifier.resize();
              },
            ),
          ),
        _buildGrid(
          props: widget.gridPropsB,
          mode: widget.mode,
          width: 100,
          isGridA: false,
        ),
      ],
    );
  }
}

class TableDualGridDividerWidget extends StatefulWidget {
  final Color backgroundColor;

  final Color indicatorColor;

  final Color draggingColor;

  final void Function(DragUpdateDetails) dragCallback;

  const TableDualGridDividerWidget({
    required this.backgroundColor,
    required this.indicatorColor,
    required this.draggingColor,
    required this.dragCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<TableDualGridDividerWidget> createState() =>
      TableDualGridDividerWidgetState();
}

class TableDualGridDividerWidgetState
    extends State<TableDualGridDividerWidget> {
  bool isDragging = false;

  void onHorizontalDragStart(DragStartDetails details) {
    if (isDragging == false) {
      setState(() {
        isDragging = true;
      });
    }
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    widget.dragCallback(details);

    if (isDragging == false) {
      setState(() {
        isDragging = true;
      });
    }
  }

  void onHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      isDragging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (layoutContext, size) {
        return GestureDetector(
          onHorizontalDragStart: onHorizontalDragStart,
          onHorizontalDragUpdate: onHorizontalDragUpdate,
          onHorizontalDragEnd: onHorizontalDragEnd,
          child: ColoredBox(
            color: isDragging ? widget.draggingColor : widget.backgroundColor,
            child: Stack(
              children: [
                Positioned(
                  top: (size.maxHeight / 2) - 18,
                  left: -4,
                  child: Icon(
                    Icons.drag_indicator,
                    color: widget.indicatorColor,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum _TableDualGridId {
  gridA,
  gridB,
  divider,
}

class TableDualGridLayoutDelegate extends MultiChildLayoutDelegate {
  TableDualGridLayoutDelegate({
    required ChangeNotifier notifier,
    required this.display,
    required this.showDraggableDivider,
    required this.isLTR,
  }) : super(relayout: notifier);

  final TableDualGridDisplay display;

  final bool showDraggableDivider;

  final bool isLTR;

  @override
  void performLayout(Size size) {
    final BoxConstraints constrains = BoxConstraints(
      maxWidth: size.width,
      maxHeight: size.height,
    );

    final dividerHalf =
        showDraggableDivider ? TableDualGrid.dividerWidth / 2 : 0;

    final dividerWidth = dividerHalf * 2;

    double gridAWidth = showDraggableDivider
        ? display.offset == null
            ? display.gridAWidth(constrains) - dividerHalf
            : display.offset! - dividerHalf
        : display.gridAWidth(constrains) - dividerHalf;
    double gridBWidth = size.width - gridAWidth - dividerWidth;

    if (!isLTR) {
      final savedGridBWidth = gridBWidth;
      gridBWidth = gridAWidth;
      gridAWidth = savedGridBWidth;
    }

    if (gridAWidth < 0) {
      gridAWidth = 0;
    } else if (gridAWidth > size.width - dividerWidth) {
      gridAWidth = size.width - dividerWidth;
    }

    if (gridBWidth < 0) {
      gridBWidth = 0;
    } else if (gridBWidth > size.width - dividerWidth) {
      gridBWidth = size.width - dividerWidth;
    }

    if (hasChild(_TableDualGridId.gridA)) {
      layoutChild(
        _TableDualGridId.gridA,
        BoxConstraints.tight(
          Size(gridAWidth, size.height),
        ),
      );

      final double posX = isLTR ? 0 : gridBWidth + dividerWidth;

      positionChild(_TableDualGridId.gridA, Offset(posX, 0));
    }

    if (hasChild(_TableDualGridId.divider)) {
      layoutChild(
        _TableDualGridId.divider,
        BoxConstraints.tight(
          Size(TableDualGrid.dividerWidth, size.height),
        ),
      );

      final double posX = isLTR ? gridAWidth : gridBWidth;

      positionChild(_TableDualGridId.divider, Offset(posX, 0));
    }

    if (hasChild(_TableDualGridId.gridB)) {
      layoutChild(
        _TableDualGridId.gridB,
        BoxConstraints.tight(
          Size(gridBWidth, size.height),
        ),
      );

      final double posX = isLTR ? gridAWidth + dividerWidth : 0;

      positionChild(_TableDualGridId.gridB, Offset(posX, 0));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}

class TableDualOnSelectedEvent {
  TableGridOnSelectedEvent? gridA;

  TableGridOnSelectedEvent? gridB;

  TableDualOnSelectedEvent({
    this.gridA,
    this.gridB,
  });
}

abstract class TableDualGridDisplay {
  double gridAWidth(BoxConstraints size);

  double gridBWidth(BoxConstraints size);

  double? offset;
}

class TableDualGridDisplayRatio implements TableDualGridDisplay {
  final double ratio;

  TableDualGridDisplayRatio({
    this.ratio = 0.5,
  }) : assert(0 < ratio && ratio < 1);

  @override
  double? offset;

  @override
  double gridAWidth(BoxConstraints size) => size.maxWidth * ratio;

  @override
  double gridBWidth(BoxConstraints size) => size.maxWidth * (1 - ratio);
}

class TableDualGridDisplayFixedAndExpanded implements TableDualGridDisplay {
  final double width;

  TableDualGridDisplayFixedAndExpanded({
    this.width = 206.0,
  });

  @override
  double? offset;

  @override
  double gridAWidth(BoxConstraints size) => width;

  @override
  double gridBWidth(BoxConstraints size) => size.maxWidth - width;
}

class TableDualGridDisplayExpandedAndFixed implements TableDualGridDisplay {
  final double width;

  TableDualGridDisplayExpandedAndFixed({
    this.width = 206.0,
  });

  @override
  double? offset;

  @override
  double gridAWidth(BoxConstraints size) => size.maxWidth - width;

  @override
  double gridBWidth(BoxConstraints size) => width;
}

class TableDualGridProps {
  /// {@macro table_grid_property_columns}
  final List<TableViewColumn> columns;

  /// {@macro table_grid_property_rows}
  final List<TableViewRow> rows;

  /// {@macro table_grid_property_columnGroups}
  final List<TableViewColumnGroup>? columnGroups;

  /// {@macro table_grid_property_onLoaded}
  final TableOnLoadedEventCallback? onLoaded;

  /// {@macro table_grid_property_onChanged}
  final TableOnChangedEventCallback? onChanged;

  /// {@macro table_grid_property_onSorted}
  final TableOnSortedEventCallback? onSorted;

  /// {@macro table_grid_property_onRowChecked}
  final TableOnRowCheckedEventCallback? onRowChecked;

  /// {@macro table_grid_property_onRowDoubleTap}
  final TableOnRowDoubleTapEventCallback? onRowDoubleTap;

  /// {@macro table_grid_property_onRowSecondaryTap}
  final TableOnRowSecondaryTapEventCallback? onRowSecondaryTap;

  /// {@macro table_grid_property_onRowsMoved}
  final TableOnRowsMovedEventCallback? onRowsMoved;

  /// {@macro table_grid_property_createHeader}
  final CreateHeaderCallBack? createHeader;

  /// {@macro table_grid_property_createFooter}
  final CreateFooterCallBack? createFooter;

  /// {@macro table_grid_property_rowColorCallback}
  final TableRowColorCallback? rowColorCallback;

  /// {@macro table_grid_property_columnMenuDelegate}
  final TableColumnMenuDelegate? columnMenuDelegate;

  /// {@macro table_grid_property_configuration}
  final TableGridConfiguration configuration;

  /// Execution mode of [TableGrid].
  ///
  /// [TableGridMode.normal]
  /// {@macro table_grid_mode_normal}
  ///
  /// [TableGridMode.select], [TableGridMode.selectWithOneTap]
  /// {@macro table_grid_mode_select}
  ///
  /// [TableGridMode.popup]
  /// {@macro table_grid_mode_popup}
  final TableGridMode? mode;

  final Key? key;

  const TableDualGridProps({
    required this.columns,
    required this.rows,
    this.columnGroups,
    this.onLoaded,
    this.onChanged,
    this.onSorted,
    this.onRowChecked,
    this.onRowDoubleTap,
    this.onRowSecondaryTap,
    this.onRowsMoved,
    this.createHeader,
    this.createFooter,
    this.rowColorCallback,
    this.columnMenuDelegate,
    this.configuration = const TableGridConfiguration(),
    this.mode,
    this.key,
  });

  TableDualGridProps copyWith({
    List<TableViewColumn>? columns,
    List<TableViewRow>? rows,
    TableOptional<List<TableViewColumnGroup>?>? columnGroups,
    TableOptional<TableOnLoadedEventCallback?>? onLoaded,
    TableOptional<TableOnChangedEventCallback?>? onChanged,
    TableOptional<TableOnSortedEventCallback?>? onSorted,
    TableOptional<TableOnRowCheckedEventCallback?>? onRowChecked,
    TableOptional<TableOnRowDoubleTapEventCallback?>? onRowDoubleTap,
    TableOptional<TableOnRowSecondaryTapEventCallback?>? onRowSecondaryTap,
    TableOptional<TableOnRowsMovedEventCallback?>? onRowsMoved,
    TableOptional<CreateHeaderCallBack?>? createHeader,
    TableOptional<CreateFooterCallBack?>? createFooter,
    TableOptional<TableRowColorCallback?>? rowColorCallback,
    TableOptional<TableColumnMenuDelegate?>? columnMenuDelegate,
    TableGridConfiguration? configuration,
    TableOptional<TableGridMode?>? mode,
    Key? key,
  }) {
    return TableDualGridProps(
      columns: columns ?? this.columns,
      rows: rows ?? this.rows,
      columnGroups:
          columnGroups == null ? this.columnGroups : columnGroups.value,
      onLoaded: onLoaded == null ? this.onLoaded : onLoaded.value,
      onChanged: onChanged == null ? this.onChanged : onChanged.value,
      onSorted: onSorted == null ? this.onSorted : onSorted.value,
      onRowChecked:
          onRowChecked == null ? this.onRowChecked : onRowChecked.value,
      onRowDoubleTap:
          onRowDoubleTap == null ? this.onRowDoubleTap : onRowDoubleTap.value,
      onRowSecondaryTap: onRowSecondaryTap == null
          ? this.onRowSecondaryTap
          : onRowSecondaryTap.value,
      onRowsMoved: onRowsMoved == null ? this.onRowsMoved : onRowsMoved.value,
      createHeader:
          createHeader == null ? this.createHeader : createHeader.value,
      createFooter:
          createFooter == null ? this.createFooter : createFooter.value,
      rowColorCallback: rowColorCallback == null
          ? this.rowColorCallback
          : rowColorCallback.value,
      columnMenuDelegate: columnMenuDelegate == null
          ? this.columnMenuDelegate
          : columnMenuDelegate.value,
      configuration: configuration ?? this.configuration,
      mode: mode == null ? this.mode : mode.value,
      key: key ?? this.key,
    );
  }
}
