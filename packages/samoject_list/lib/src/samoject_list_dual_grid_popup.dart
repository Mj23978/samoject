import 'package:flutter/material.dart';

import 'samoject_list_dual_grid.dart';
import 'samoject_list_grid.dart';

/// [SamojectListDualGridPopup] can connect the keyboard movement between the two grids
/// by arranging two [SamojectListGrid] left and right.
/// It works as a popup.
class SamojectListDualGridPopup {
  final BuildContext context;

  final SamojectListDualGridProps gridPropsA;

  final SamojectListDualGridProps gridPropsB;

  final SamojectListGridMode? mode;

  final SamojectListDualOnSelectedEventCallback? onSelected;

  final SamojectListDualGridDisplay? display;

  final double? width;

  final double? height;

  final SamojectListDualGridDivider? divider;

  SamojectListDualGridPopup({
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

    SamojectListDualOnSelectedEvent? selected =
        await showDialog<SamojectListDualOnSelectedEvent>(
            context: context,
            builder: (BuildContext ctx) {
              return Dialog(
                shape: shape,
                child: LayoutBuilder(
                  builder: (ctx, size) {
                    return SizedBox(
                      width: (width ?? size.maxWidth) +
                          SamojectListGridSettings.gridInnerSpacing,
                      height: height ?? size.maxHeight,
                      child: Directionality(
                        textDirection: Directionality.of(context),
                        child: SamojectListDualGrid(
                          gridPropsA: propsA,
                          gridPropsB: propsB,
                          mode: mode,
                          onSelected: (SamojectListDualOnSelectedEvent event) {
                            Navigator.pop(ctx, event);
                          },
                          display:
                              display ?? SamojectListDualGridDisplayRatio(),
                          divider:
                              divider ?? const SamojectListDualGridDivider(),
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

  SamojectListDualGridProps _applyBorderRadiusToGridProps(
    BorderRadius? borderRadius,
    SamojectListDualGridProps gridProps,
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
