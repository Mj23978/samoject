import 'package:flutter/material.dart';

import '../manager/table_grid_state_manager.dart';
import '../model/table_column.dart';
import 'ui.dart';

class TableBaseColumnFooter extends StatelessWidget
    implements TableVisibilityLayoutChild {
  final TableGridStateManager stateManager;

  final TableViewColumn column;

  TableBaseColumnFooter({
    required this.stateManager,
    required this.column,
  }) : super(key: column.key);

  @override
  double get width => column.width;

  @override
  double get startPosition => column.startPosition;

  @override
  bool get keepAlive => false;

  @override
  Widget build(BuildContext context) {
    final renderer = column.footerRenderer;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: column.backgroundColor,
        border: BorderDirectional(
          end: stateManager.style.enableColumnBorderVertical
              ? BorderSide(color: stateManager.style.borderColor, width: 1.0)
              : BorderSide.none,
        ),
      ),
      child: renderer == null
          ? const SizedBox()
          : renderer(
              TableColumnFooterRendererContext(
                column: column,
                stateManager: stateManager,
              ),
            ),
    );
  }
}
