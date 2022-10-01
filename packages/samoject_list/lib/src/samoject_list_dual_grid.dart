import 'package:flutter/material.dart';

import 'helper/show_column_menu.dart';
import 'manager/event/samoject_list_grid_cannot_move_current_cell_event.dart';
import 'manager/event/samoject_list_grid_event.dart';
import 'manager/samoject_list_grid_state_manager.dart';
import 'model/samoject_list_column.dart';
import 'model/samoject_list_column_group.dart';
import 'model/samoject_list_row.dart';
import 'samoject_list_grid.dart';
import 'samoject_list_grid_configuration.dart';

typedef SamojectListDualOnSelectedEventCallback = void Function(
    SamojectListDualOnSelectedEvent event);

/// In [SamojectListDualGrid], set the separation widget between the two grids.
class SamojectListDualGridDivider {
  /// If [show] is set to true, a separator widget appears between the grids,
  /// and you can change the width of two grids by dragging them.
  final bool show;

  /// Set the background color.
  final Color backgroundColor;

  /// Set the icon color in the center of the separator widget.
  final Color indicatorColor;

  /// Set the background color when dragging the separator widget.
  final Color draggingColor;

  const SamojectListDualGridDivider({
    this.show = true,
    this.backgroundColor = Colors.white,
    this.indicatorColor = const Color(0xFFA1A5AE),
    this.draggingColor = const Color(0xFFDCF5FF),
  });

  const SamojectListDualGridDivider.dark({
    this.show = true,
    this.backgroundColor = const Color(0xFF111111),
    this.indicatorColor = const Color(0xFF000000),
    this.draggingColor = const Color(0xFF313131),
  });
}

/// [SamojectListDualGrid] can connect the keyboard movement between the two grids
/// by arranging two [SamojectListGrid] left and right.
class SamojectListDualGrid extends StatefulWidget {
  final SamojectListDualGridProps gridPropsA;

  final SamojectListDualGridProps gridPropsB;

  final SamojectListGridMode? mode;

  final SamojectListDualOnSelectedEventCallback? onSelected;

  /// [SamojectListDualGridDisplayRatio]
  /// Set the width of the two grids by specifying the ratio of the left grid.
  /// 0.5 is 5(left grid):5(right grid).
  /// 0.8 is 8(left grid):2(right grid).
  ///
  /// [SamojectListDualGridDisplayFixedAndExpanded]
  /// Fix the width of the left grid.
  ///
  /// [SamojectListDualGridDisplayExpandedAndFixed]
  /// Fix the width of the right grid.
  final SamojectListDualGridDisplay? display;

  final SamojectListDualGridDivider divider;

  const SamojectListDualGrid({
    required this.gridPropsA,
    required this.gridPropsB,
    this.mode,
    this.onSelected,
    this.display,
    this.divider = const SamojectListDualGridDivider(),
    Key? key,
  }) : super(key: key);

  static const double dividerWidth = 10;

  @override
  SamojectListDualGridState createState() => SamojectListDualGridState();
}

class SamojectListDualGridResizeNotifier extends ChangeNotifier {
  resize() {
    notifyListeners();
  }
}

class SamojectListDualGridState extends State<SamojectListDualGrid> {
  final SamojectListDualGridResizeNotifier resizeNotifier =
      SamojectListDualGridResizeNotifier();

  late final SamojectListDualGridDisplay display;

  SamojectListGridStateManager? _stateManagerA;

  SamojectListGridStateManager? _stateManagerB;

  @override
  void initState() {
    super.initState();

    display = widget.display ?? SamojectListDualGridDisplayRatio();
  }

  Widget _buildGrid({
    required SamojectListDualGridProps props,
    SamojectListGridMode? mode,
    double? width,
    bool? isGridA,
  }) {
    return LayoutId(
      id: isGridA == true
          ? _SamojectListDualGridId.gridA
          : _SamojectListDualGridId.gridB,
      child: SizedBox(
        width: width,
        child: SamojectListGrid(
          columns: props.columns,
          rows: props.rows,
          columnGroups: props.columnGroups,
          onLoaded: (SamojectListGridOnLoadedEvent onLoadedEvent) {
            if (isGridA!) {
              _stateManagerA = onLoadedEvent.stateManager;
            } else {
              _stateManagerB = onLoadedEvent.stateManager;
            }

            onLoadedEvent.stateManager.eventManager!
                .listener((SamojectListGridEvent tableEvent) {
              if (tableEvent is SamojectListGridCannotMoveCurrentCellEvent) {
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
          onSelected: (SamojectListGridOnSelectedEvent onSelectedEvent) {
            if (onSelectedEvent.row == null || onSelectedEvent.cell == null) {
              widget.onSelected!(
                SamojectListDualOnSelectedEvent(
                  gridA: null,
                  gridB: null,
                ),
              );
            } else {
              widget.onSelected!(
                SamojectListDualOnSelectedEvent(
                  gridA: SamojectListGridOnSelectedEvent(
                    row: _stateManagerA!.currentRow,
                    rowIdx: _stateManagerA!.currentRowIdx,
                    cell: _stateManagerA!.currentCell,
                  ),
                  gridB: SamojectListGridOnSelectedEvent(
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
      delegate: SamojectListDualGridLayoutDelegate(
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
            id: _SamojectListDualGridId.divider,
            child: SamojectListDualGridDividerWidget(
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

class SamojectListDualGridDividerWidget extends StatefulWidget {
  final Color backgroundColor;

  final Color indicatorColor;

  final Color draggingColor;

  final void Function(DragUpdateDetails) dragCallback;

  const SamojectListDualGridDividerWidget({
    required this.backgroundColor,
    required this.indicatorColor,
    required this.draggingColor,
    required this.dragCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<SamojectListDualGridDividerWidget> createState() =>
      SamojectListDualGridDividerWidgetState();
}

class SamojectListDualGridDividerWidgetState
    extends State<SamojectListDualGridDividerWidget> {
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

enum _SamojectListDualGridId {
  gridA,
  gridB,
  divider,
}

class SamojectListDualGridLayoutDelegate extends MultiChildLayoutDelegate {
  SamojectListDualGridLayoutDelegate({
    required ChangeNotifier notifier,
    required this.display,
    required this.showDraggableDivider,
    required this.isLTR,
  }) : super(relayout: notifier);

  final SamojectListDualGridDisplay display;

  final bool showDraggableDivider;

  final bool isLTR;

  @override
  void performLayout(Size size) {
    final BoxConstraints constrains = BoxConstraints(
      maxWidth: size.width,
      maxHeight: size.height,
    );

    final dividerHalf =
        showDraggableDivider ? SamojectListDualGrid.dividerWidth / 2 : 0;

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

    if (hasChild(_SamojectListDualGridId.gridA)) {
      layoutChild(
        _SamojectListDualGridId.gridA,
        BoxConstraints.tight(
          Size(gridAWidth, size.height),
        ),
      );

      final double posX = isLTR ? 0 : gridBWidth + dividerWidth;

      positionChild(_SamojectListDualGridId.gridA, Offset(posX, 0));
    }

    if (hasChild(_SamojectListDualGridId.divider)) {
      layoutChild(
        _SamojectListDualGridId.divider,
        BoxConstraints.tight(
          Size(SamojectListDualGrid.dividerWidth, size.height),
        ),
      );

      final double posX = isLTR ? gridAWidth : gridBWidth;

      positionChild(_SamojectListDualGridId.divider, Offset(posX, 0));
    }

    if (hasChild(_SamojectListDualGridId.gridB)) {
      layoutChild(
        _SamojectListDualGridId.gridB,
        BoxConstraints.tight(
          Size(gridBWidth, size.height),
        ),
      );

      final double posX = isLTR ? gridAWidth + dividerWidth : 0;

      positionChild(_SamojectListDualGridId.gridB, Offset(posX, 0));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}

class SamojectListDualOnSelectedEvent {
  SamojectListGridOnSelectedEvent? gridA;

  SamojectListGridOnSelectedEvent? gridB;

  SamojectListDualOnSelectedEvent({
    this.gridA,
    this.gridB,
  });
}

abstract class SamojectListDualGridDisplay {
  double gridAWidth(BoxConstraints size);

  double gridBWidth(BoxConstraints size);

  double? offset;
}

class SamojectListDualGridDisplayRatio implements SamojectListDualGridDisplay {
  final double ratio;

  SamojectListDualGridDisplayRatio({
    this.ratio = 0.5,
  }) : assert(0 < ratio && ratio < 1);

  @override
  double? offset;

  @override
  double gridAWidth(BoxConstraints size) => size.maxWidth * ratio;

  @override
  double gridBWidth(BoxConstraints size) => size.maxWidth * (1 - ratio);
}

class SamojectListDualGridDisplayFixedAndExpanded
    implements SamojectListDualGridDisplay {
  final double width;

  SamojectListDualGridDisplayFixedAndExpanded({
    this.width = 206.0,
  });

  @override
  double? offset;

  @override
  double gridAWidth(BoxConstraints size) => width;

  @override
  double gridBWidth(BoxConstraints size) => size.maxWidth - width;
}

class SamojectListDualGridDisplayExpandedAndFixed
    implements SamojectListDualGridDisplay {
  final double width;

  SamojectListDualGridDisplayExpandedAndFixed({
    this.width = 206.0,
  });

  @override
  double? offset;

  @override
  double gridAWidth(BoxConstraints size) => size.maxWidth - width;

  @override
  double gridBWidth(BoxConstraints size) => width;
}

class SamojectListDualGridProps {
  /// {@macro table_grid_property_columns}
  final List<SamojectListColumn> columns;

  /// {@macro table_grid_property_rows}
  final List<SamojectListRow> rows;

  /// {@macro table_grid_property_columnGroups}
  final List<SamojectListColumnGroup>? columnGroups;

  /// {@macro table_grid_property_onLoaded}
  final SamojectListOnLoadedEventCallback? onLoaded;

  /// {@macro table_grid_property_onChanged}
  final SamojectListOnChangedEventCallback? onChanged;

  /// {@macro table_grid_property_onSorted}
  final SamojectListOnSortedEventCallback? onSorted;

  /// {@macro table_grid_property_onRowChecked}
  final SamojectListOnRowCheckedEventCallback? onRowChecked;

  /// {@macro table_grid_property_onRowDoubleTap}
  final SamojectListOnRowDoubleTapEventCallback? onRowDoubleTap;

  /// {@macro table_grid_property_onRowSecondaryTap}
  final SamojectListOnRowSecondaryTapEventCallback? onRowSecondaryTap;

  /// {@macro table_grid_property_onRowsMoved}
  final SamojectListOnRowsMovedEventCallback? onRowsMoved;

  /// {@macro table_grid_property_createHeader}
  final CreateHeaderCallBack? createHeader;

  /// {@macro table_grid_property_createFooter}
  final CreateFooterCallBack? createFooter;

  /// {@macro table_grid_property_rowColorCallback}
  final SamojectListRowColorCallback? rowColorCallback;

  /// {@macro table_grid_property_columnMenuDelegate}
  final SamojectListColumnMenuDelegate? columnMenuDelegate;

  /// {@macro table_grid_property_configuration}
  final SamojectListGridConfiguration configuration;

  /// Execution mode of [SamojectListGrid].
  ///
  /// [SamojectListGridMode.normal]
  /// {@macro table_grid_mode_normal}
  ///
  /// [SamojectListGridMode.select], [SamojectListGridMode.selectWithOneTap]
  /// {@macro table_grid_mode_select}
  ///
  /// [SamojectListGridMode.popup]
  /// {@macro table_grid_mode_popup}
  final SamojectListGridMode? mode;

  final Key? key;

  const SamojectListDualGridProps({
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
    this.configuration = const SamojectListGridConfiguration(),
    this.mode,
    this.key,
  });

  SamojectListDualGridProps copyWith({
    List<SamojectListColumn>? columns,
    List<SamojectListRow>? rows,
    SamojectListOptional<List<SamojectListColumnGroup>?>? columnGroups,
    SamojectListOptional<SamojectListOnLoadedEventCallback?>? onLoaded,
    SamojectListOptional<SamojectListOnChangedEventCallback?>? onChanged,
    SamojectListOptional<SamojectListOnSortedEventCallback?>? onSorted,
    SamojectListOptional<SamojectListOnRowCheckedEventCallback?>? onRowChecked,
    SamojectListOptional<SamojectListOnRowDoubleTapEventCallback?>?
        onRowDoubleTap,
    SamojectListOptional<SamojectListOnRowSecondaryTapEventCallback?>?
        onRowSecondaryTap,
    SamojectListOptional<SamojectListOnRowsMovedEventCallback?>? onRowsMoved,
    SamojectListOptional<CreateHeaderCallBack?>? createHeader,
    SamojectListOptional<CreateFooterCallBack?>? createFooter,
    SamojectListOptional<SamojectListRowColorCallback?>? rowColorCallback,
    SamojectListOptional<SamojectListColumnMenuDelegate?>? columnMenuDelegate,
    SamojectListGridConfiguration? configuration,
    SamojectListOptional<SamojectListGridMode?>? mode,
    Key? key,
  }) {
    return SamojectListDualGridProps(
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
