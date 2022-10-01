import 'package:flutter/material.dart';

import '../manager/samoject_table_grid_state_manager.dart';
import '../model/samoject_table_column.dart';
import 'ui.dart';

class SamojectTableBaseColumnFooter extends StatelessWidget
    implements SamojectTableVisibilityLayoutChild {
  final SamojectTableGridStateManager stateManager;

  final SamojectTableColumn column;

  SamojectTableBaseColumnFooter({
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
              SamojectTableColumnFooterRendererContext(
                column: column,
                stateManager: stateManager,
              ),
            ),
    );
  }
}
