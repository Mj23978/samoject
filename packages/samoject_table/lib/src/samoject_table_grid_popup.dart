import 'package:flutter/material.dart';

import 'helper/show_column_menu.dart';
import 'model/samoject_table_column.dart';
import 'model/samoject_table_column_group.dart';
import 'model/samoject_table_row.dart';
import 'samoject_table_grid.dart';
import 'samoject_table_grid_configuration.dart';

/// [SamojectTableGridPopup] calls [SamojectTableGrid] in the form of a popup.
class SamojectTableGridPopup {
  final BuildContext context;

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

  /// {@macro table_grid_property_onSelected}
  final SamojectTableOnSelectedEventCallback? onSelected;

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
  final SamojectTableGridConfiguration? configuration;

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

  final double? width;

  final double? height;

  SamojectTableGridPopup({
    required this.context,
    required this.columns,
    required this.rows,
    this.columnGroups,
    this.onLoaded,
    this.onChanged,
    this.onSelected,
    this.onSorted,
    this.onRowChecked,
    this.onRowDoubleTap,
    this.onRowSecondaryTap,
    this.onRowsMoved,
    this.createHeader,
    this.createFooter,
    this.rowColorCallback,
    this.columnMenuDelegate,
    this.configuration,
    this.mode,
    this.width,
    this.height,
  }) {
    open();
  }

  Future<void> open() async {
    SamojectTableGridOnSelectedEvent? selected =
        await showDialog<SamojectTableGridOnSelectedEvent>(
            context: context,
            builder: (BuildContext ctx) {
              return Dialog(
                shape: configuration?.style.gridBorderRadius != null
                    ? RoundedRectangleBorder(
                        borderRadius: configuration!.style.gridBorderRadius,
                      )
                    : null,
                child: LayoutBuilder(
                  builder: (ctx, size) {
                    return SizedBox(
                      width: (width ?? size.maxWidth) +
                          SamojectTableGridSettings.gridInnerSpacing,
                      height: height ?? size.maxHeight,
                      child: Directionality(
                        textDirection: Directionality.of(context),
                        child: SamojectTableGrid(
                          columns: columns,
                          rows: rows,
                          columnGroups: columnGroups,
                          onLoaded: onLoaded,
                          onChanged: onChanged,
                          onSelected: (SamojectTableGridOnSelectedEvent event) {
                            Navigator.pop(ctx, event);
                          },
                          onSorted: onSorted,
                          onRowChecked: onRowChecked,
                          onRowDoubleTap: onRowDoubleTap,
                          onRowSecondaryTap: onRowSecondaryTap,
                          onRowsMoved: onRowsMoved,
                          createHeader: createHeader,
                          createFooter: createFooter,
                          rowColorCallback: rowColorCallback,
                          columnMenuDelegate: columnMenuDelegate,
                          configuration: configuration,
                          mode: mode,
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
}
