import 'package:flutter/material.dart';

import '../manager/samoject_list_grid_state_manager.dart';
import '../model/samoject_list_column.dart';
import 'ui.dart';

class SamojectListBaseColumnFooter extends StatelessWidget
    implements SamojectListVisibilityLayoutChild {
  final SamojectListGridStateManager stateManager;

  final SamojectListColumn column;

  SamojectListBaseColumnFooter({
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
              SamojectListColumnFooterRendererContext(
                column: column,
                stateManager: stateManager,
              ),
            ),
    );
  }
}
