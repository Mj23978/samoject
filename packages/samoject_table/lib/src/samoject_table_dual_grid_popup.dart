import 'package:flutter/material.dart';

import 'samoject_table_dual_grid.dart';
import 'samoject_table_grid.dart';

/// [SamojectTableDualGridPopup] can connect the keyboard movement between the two grids
/// by arranging two [SamojectTableGrid] left and right.
/// It works as a popup.
class SamojectTableDualGridPopup {
  final BuildContext context;

  final SamojectTableDualGridProps gridPropsA;

  final SamojectTableDualGridProps gridPropsB;

  final SamojectTableGridMode? mode;

  final SamojectTableDualOnSelectedEventCallback? onSelected;

  final SamojectTableDualGridDisplay? display;

  final double? width;

  final double? height;

  final SamojectTableDualGridDivider? divider;

  SamojectTableDualGridPopup({
    required this.context,
    required this.gridPropsA,
    required this.gridPropsB,
    this.mode,
    this.onSelected,
    this.display,
    this.width,
    this.height,
    this.divider,
  }) {
    open();
  }

  Future<void> open() async {
    final splitBorderRadius = _splitBorderRadius();

    final shape = _getShape(splitBorderRadius);

    final propsA = _applyBorderRadiusToGridProps(
      splitBorderRadius?.elementAt(0),
      gridPropsA,
    );

    final propsB = _applyBorderRadiusToGridProps(
      splitBorderRadius?.elementAt(1),
      gridPropsB,
    );

    SamojectTableDualOnSelectedEvent? selected =
        await showDialog<SamojectTableDualOnSelectedEvent>(
            context: context,
            builder: (BuildContext ctx) {
              return Dialog(
                shape: shape,
                child: LayoutBuilder(
                  builder: (ctx, size) {
                    return SizedBox(
                      width: (width ?? size.maxWidth) +
                          SamojectTableGridSettings.gridInnerSpacing,
                      height: height ?? size.maxHeight,
                      child: Directionality(
                        textDirection: Directionality.of(context),
                        child: SamojectTableDualGrid(
                          gridPropsA: propsA,
                          gridPropsB: propsB,
                          mode: mode,
                          onSelected: (SamojectTableDualOnSelectedEvent event) {
                            Navigator.pop(ctx, event);
                          },
                          display:
                              display ?? SamojectTableDualGridDisplayRatio(),
                          divider:
                              divider ?? const SamojectTableDualGridDivider(),
                        ),
                      ),
                    );
                  },
                ),
              );
            });
    if (onSelected != null && selected != null) {
      onSelected!(selected);
    }
  }

  List<BorderRadius>? _splitBorderRadius() {
    final left = gridPropsA.configuration.style.gridBorderRadius;

    final right = gridPropsB.configuration.style.gridBorderRadius;

    return [
      BorderRadius.only(
        topLeft: left.resolve(TextDirection.ltr).topLeft,
        bottomLeft: left.resolve(TextDirection.ltr).bottomLeft,
        topRight: Radius.zero,
        bottomRight: Radius.zero,
      ),
      BorderRadius.only(
        topLeft: Radius.zero,
        bottomLeft: Radius.zero,
        topRight: right.resolve(TextDirection.ltr).topRight,
        bottomRight: right.resolve(TextDirection.ltr).bottomRight,
      ),
    ];
  }

  ShapeBorder? _getShape(List<BorderRadius>? borderRadius) {
    if (borderRadius == null) {
      return null;
    }

    return RoundedRectangleBorder(
      borderRadius: borderRadius.elementAt(0) + borderRadius.elementAt(1),
    );
  }

  SamojectTableDualGridProps _applyBorderRadiusToGridProps(
    BorderRadius? borderRadius,
    SamojectTableDualGridProps gridProps,
  ) {
    if (borderRadius == null) {
      return gridProps;
    }

    return gridProps.copyWith(
      configuration: gridProps.configuration.copyWith(
        style: gridProps.configuration.style.copyWith(
          gridBorderRadius: borderRadius,
        ),
      ),
    );
  }
}
