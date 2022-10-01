import 'package:flutter/material.dart';

import 'helper/show_column_menu.dart';
import 'model/samoject_list_column.dart';
import 'model/samoject_list_column_group.dart';
import 'model/samoject_list_row.dart';
import 'samoject_list_grid.dart';
import 'samoject_list_grid_configuration.dart';

/// [SamojectListGridPopup] calls [SamojectListGrid] in the form of a popup.
class SamojectListGridPopup {
  final BuildContext context;

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

  /// {@macro table_grid_property_onSelected}
  final SamojectListOnSelectedEventCallback? onSelected;

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
  final SamojectListGridConfiguration? configuration;

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

  final double? width;

  final double? height;

  SamojectListGridPopup({
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
    SamojectListGridOnSelectedEvent? selected =
        await showDialog<SamojectListGridOnSelectedEvent>(
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
                          SamojectListGridSettings.gridInnerSpacing,
                      height: height ?? size.maxHeight,
                      child: Directionality(
                        textDirection: Directionality.of(context),
                        child: SamojectListGrid(
                          columns: columns,
                          rows: rows,
                          columnGroups: columnGroups,
                          onLoaded: onLoaded,
                          onChanged: onChanged,
                          onSelected: (SamojectListGridOnSelectedEvent event) {
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
