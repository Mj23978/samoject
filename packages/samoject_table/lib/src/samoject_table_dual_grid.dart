import 'package:flutter/material.dart';

import 'helper/show_column_menu.dart';
import 'manager/event/samoject_table_grid_cannot_move_current_cell_event.dart';
import 'manager/event/samoject_table_grid_event.dart';
import 'manager/samoject_table_grid_state_manager.dart';
import 'model/samoject_table_column.dart';
import 'model/samoject_table_column_group.dart';
import 'model/samoject_table_row.dart';
import 'samoject_table_grid.dart';
import 'samoject_table_grid_configuration.dart';

typedef SamojectTableDualOnSelectedEventCallback = void Function(
    SamojectTableDualOnSelectedEvent event);

/// In [SamojectTableDualGrid], set the separation widget between the two grids.
class SamojectTableDualGridDivider {
  /// If [show] is set to true, a separator widget appears between the grids,
  /// and you can change the width of two grids by dragging them.
  final bool show;

  /// Set the background color.
  final Color backgroundColor;

  /// Set the icon color in the center of the separator widget.
  final Color indicatorColor;

  /// Set the background color when dragging the separator widget.
  final Color draggingColor;

  const SamojectTableDualGridDivider({
    this.show = true,
    this.backgroundColor = Colors.white,
    this.indicatorColor = const Color(0xFFA1A5AE),
    this.draggingColor = const Color(0xFFDCF5FF),
  });

  const SamojectTableDualGridDivider.dark({
    this.show = true,
    this.backgroundColor = const Color(0xFF111111),
    this.indicatorColor = const Color(0xFF000000),
    this.draggingColor = const Color(0xFF313131),
  });
}

/// [SamojectTableDualGrid] can connect the keyboard movement between the two grids
/// by arranging two [SamojectTableGrid] left and right.
class SamojectTableDualGrid extends StatefulWidget {
  final SamojectTableDualGridProps gridPropsA;

  final SamojectTableDualGridProps gridPropsB;

  final SamojectTableGridMode? mode;

  final SamojectTableDualOnSelectedEventCallback? onSelected;

  /// [SamojectTableDualGridDisplayRatio]
  /// Set the width of the two grids by specifying the ratio of the left grid.
  /// 0.5 is 5(left grid):5(right grid).
  /// 0.8 is 8(left grid):2(right grid).
  ///
  /// [SamojectTableDualGridDisplayFixedAndExpanded]
  /// Fix the width of the left grid.
  ///
  /// [SamojectTableDualGridDisplayExpandedAndFixed]
  /// Fix the width of the right grid.
  final SamojectTableDualGridDisplay? display;

  final SamojectTableDualGridDivider divider;

  const SamojectTableDualGrid({
    required this.gridPropsA,
    required this.gridPropsB,
    this.mode,
    this.onSelected,
    this.display,
    this.divider = const SamojectTableDualGridDivider(),
    Key? key,
  }) : super(key: key);

  static const double dividerWidth = 10;

  @override
  SamojectTableDualGridState createState() => SamojectTableDualGridState();
}

class SamojectTableDualGridResizeNotifier extends ChangeNotifier {
  resize() {
    notifyListeners();
  }
}

class SamojectTableDualGridState extends State<SamojectTableDualGrid> {
  final SamojectTableDualGridResizeNotifier resizeNotifier =
      SamojectTableDualGridResizeNotifier();

  late final SamojectTableDualGridDisplay display;

  SamojectTableGridStateManager? _stateManagerA;

  SamojectTableGridStateManager? _stateManagerB;

  @override
  void initState() {
    super.initState();

    display = widget.display ?? SamojectTableDualGridDisplayRatio();
  }

  Widget _buildGrid({
    required SamojectTableDualGridProps props,
    SamojectTableGridMode? mode,
    double? width,
    bool? isGridA,
  }) {
    return LayoutId(
      id: isGridA == true
          ? _SamojectTableDualGridId.gridA
          : _SamojectTableDualGridId.gridB,
      child: SizedBox(
        width: width,
        child: SamojectTableGrid(
          columns: props.columns,
          rows: props.rows,
          columnGroups: props.columnGroups,
          onLoaded: (SamojectTableGridOnLoadedEvent onLoadedEvent) {
            if (isGridA!) {
              _stateManagerA = onLoadedEvent.stateManager;
            } else {
              _stateManagerB = onLoadedEvent.stateManager;
            }

            onLoadedEvent.stateManager.eventManager!
                .listener((SamojectTableGridEvent tableEvent) {
              if (tableEvent is SamojectTableGridCannotMoveCurrentCellEvent) {
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
          onSelected: (SamojectTableGridOnSelectedEvent onSelectedEvent) {
            if (onSelectedEvent.row == null || onSelectedEvent.cell == null) {
              widget.onSelected!(
                SamojectTableDualOnSelectedEvent(
                  gridA: null,
                  gridB: null,
                ),
              );
            } else {
              widget.onSelected!(
                SamojectTableDualOnSelectedEvent(
                  gridA: SamojectTableGridOnSelectedEvent(
                    row: _stateManagerA!.currentRow,
                    rowIdx: _stateManagerA!.currentRowIdx,
                    cell: _stateManagerA!.currentCell,
                  ),
                  gridB: SamojectTableGridOnSelectedEvent(
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
      delegate: SamojectTableDualGridLayoutDelegate(
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
            id: _SamojectTableDualGridId.divider,
            child: SamojectTableDualGridDividerWidget(
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

class SamojectTableDualGridDividerWidget extends StatefulWidget {
  final Color backgroundColor;

  final Color indicatorColor;

  final Color draggingColor;

  final void Function(DragUpdateDetails) dragCallback;

  const SamojectTableDualGridDividerWidget({
    required this.backgroundColor,
    required this.indicatorColor,
    required this.draggingColor,
    required this.dragCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<SamojectTableDualGridDividerWidget> createState() =>
      SamojectTableDualGridDividerWidgetState();
}

class SamojectTableDualGridDividerWidgetState
    extends State<SamojectTableDualGridDividerWidget> {
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

enum _SamojectTableDualGridId {
  gridA,
  gridB,
  divider,
}

class SamojectTableDualGridLayoutDelegate extends MultiChildLayoutDelegate {
  SamojectTableDualGridLayoutDelegate({
    required ChangeNotifier notifier,
    required this.display,
    required this.showDraggableDivider,
    required this.isLTR,
  }) : super(relayout: notifier);

  final SamojectTableDualGridDisplay display;

  final bool showDraggableDivider;

  final bool isLTR;

  @override
  void performLayout(Size size) {
    final BoxConstraints constrains = BoxConstraints(
      maxWidth: size.width,
      maxHeight: size.height,
    );

    final dividerHalf =
        showDraggableDivider ? SamojectTableDualGrid.dividerWidth / 2 : 0;

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

    if (hasChild(_SamojectTableDualGridId.gridA)) {
      layoutChild(
        _SamojectTableDualGridId.gridA,
        BoxConstraints.tight(
          Size(gridAWidth, size.height),
        ),
      );

      final double posX = isLTR ? 0 : gridBWidth + dividerWidth;

      positionChild(_SamojectTableDualGridId.gridA, Offset(posX, 0));
    }

    if (hasChild(_SamojectTableDualGridId.divider)) {
      layoutChild(
        _SamojectTableDualGridId.divider,
        BoxConstraints.tight(
          Size(SamojectTableDualGrid.dividerWidth, size.height),
        ),
      );

      final double posX = isLTR ? gridAWidth : gridBWidth;

      positionChild(_SamojectTableDualGridId.divider, Offset(posX, 0));
    }

    if (hasChild(_SamojectTableDualGridId.gridB)) {
      layoutChild(
        _SamojectTableDualGridId.gridB,
        BoxConstraints.tight(
          Size(gridBWidth, size.height),
        ),
      );

      final double posX = isLTR ? gridAWidth + dividerWidth : 0;

      positionChild(_SamojectTableDualGridId.gridB, Offset(posX, 0));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}

class SamojectTableDualOnSelectedEvent {
  SamojectTableGridOnSelectedEvent? gridA;

  SamojectTableGridOnSelectedEvent? gridB;

  SamojectTableDualOnSelectedEvent({
    this.gridA,
    this.gridB,
  });
}

abstract class SamojectTableDualGridDisplay {
  double gridAWidth(BoxConstraints size);

  double gridBWidth(BoxConstraints size);

  double? offset;
}

class SamojectTableDualGridDisplayRatio
    implements SamojectTableDualGridDisplay {
  final double ratio;

  SamojectTableDualGridDisplayRatio({
    this.ratio = 0.5,
  }) : assert(0 < ratio && ratio < 1);

  @override
  double? offset;

  @override
  double gridAWidth(BoxConstraints size) => size.maxWidth * ratio;

  @override
  double gridBWidth(BoxConstraints size) => size.maxWidth * (1 - ratio);
}

class SamojectTableDualGridDisplayFixedAndExpanded
    implements SamojectTableDualGridDisplay {
  final double width;

  SamojectTableDualGridDisplayFixedAndExpanded({
    this.width = 206.0,
  });

  @override
  double? offset;

  @override
  double gridAWidth(BoxConstraints size) => width;

  @override
  double gridBWidth(BoxConstraints size) => size.maxWidth - width;
}

class SamojectTableDualGridDisplayExpandedAndFixed
    implements SamojectTableDualGridDisplay {
  final double width;

  SamojectTableDualGridDisplayExpandedAndFixed({
    this.width = 206.0,
  });

  @override
  double? offset;

  @override
  double gridAWidth(BoxConstraints size) => size.maxWidth - width;

  @override
  double gridBWidth(BoxConstraints size) => width;
}

class SamojectTableDualGridProps {
  /// {@macro table_grid_property_columns}
  final List<SamojectTableColumn> columns;

  /// {@macro table_grid_property_rows}
  final List<SamojectTableRow> rows;

  /// {@macro table_grid_property_columnGroups}
  final List<SamojectTableColumnGroup>? columnGroups;

  /// {@macro table_grid_property_onLoaded}
  final SamojectTableOnLoadedEventCallback? onLoaded;

  /// {@macro table_grid_property_onChanged}
  final SamojectTableOnChangedEventCallback? onChanged;

  /// {@macro table_grid_property_onSorted}
  final SamojectTableOnSortedEventCallback? onSorted;

  /// {@macro table_grid_property_onRowChecked}
  final SamojectTableOnRowCheckedEventCallback? onRowChecked;

  /// {@macro table_grid_property_onRowDoubleTap}
  final SamojectTableOnRowDoubleTapEventCallback? onRowDoubleTap;

  /// {@macro table_grid_property_onRowSecondaryTap}
  final SamojectTableOnRowSecondaryTapEventCallback? onRowSecondaryTap;

  /// {@macro table_grid_property_onRowsMoved}
  final SamojectTableOnRowsMovedEventCallback? onRowsMoved;

  /// {@macro table_grid_property_createHeader}
  final CreateHeaderCallBack? createHeader;

  /// {@macro table_grid_property_createFooter}
  final CreateFooterCallBack? createFooter;

  /// {@macro table_grid_property_rowColorCallback}
  final SamojectTableRowColorCallback? rowColorCallback;

  /// {@macro table_grid_property_columnMenuDelegate}
  final SamojectTableColumnMenuDelegate? columnMenuDelegate;

  /// {@macro table_grid_property_configuration}
  final SamojectTableGridConfiguration configuration;

  /// Execution mode of [SamojectTableGrid].
  ///
  /// [SamojectTableGridMode.normal]
  /// {@macro table_grid_mode_normal}
  ///
  /// [SamojectTableGridMode.select], [SamojectTableGridMode.selectWithOneTap]
  /// {@macro table_grid_mode_select}
  ///
  /// [SamojectTableGridMode.popup]
  /// {@macro table_grid_mode_popup}
  final SamojectTableGridMode? mode;

  final Key? key;

  const SamojectTableDualGridProps({
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
    this.configuration = const SamojectTableGridConfiguration(),
    this.mode,
    this.key,
  });

  SamojectTableDualGridProps copyWith({
    List<SamojectTableColumn>? columns,
    List<SamojectTableRow>? rows,
    SamojectTableOptional<List<SamojectTableColumnGroup>?>? columnGroups,
    SamojectTableOptional<SamojectTableOnLoadedEventCallback?>? onLoaded,
    SamojectTableOptional<SamojectTableOnChangedEventCallback?>? onChanged,
    SamojectTableOptional<SamojectTableOnSortedEventCallback?>? onSorted,
    SamojectTableOptional<SamojectTableOnRowCheckedEventCallback?>?
        onRowChecked,
    SamojectTableOptional<SamojectTableOnRowDoubleTapEventCallback?>?
        onRowDoubleTap,
    SamojectTableOptional<SamojectTableOnRowSecondaryTapEventCallback?>?
        onRowSecondaryTap,
    SamojectTableOptional<SamojectTableOnRowsMovedEventCallback?>? onRowsMoved,
    SamojectTableOptional<CreateHeaderCallBack?>? createHeader,
    SamojectTableOptional<CreateFooterCallBack?>? createFooter,
    SamojectTableOptional<SamojectTableRowColorCallback?>? rowColorCallback,
    SamojectTableOptional<SamojectTableColumnMenuDelegate?>? columnMenuDelegate,
    SamojectTableGridConfiguration? configuration,
    SamojectTableOptional<SamojectTableGridMode?>? mode,
    Key? key,
  }) {
    return SamojectTableDualGridProps(
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
