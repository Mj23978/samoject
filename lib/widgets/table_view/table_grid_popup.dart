import 'package:flutter/material.dart';

import 'helper/show_column_menu.dart';
import 'model/table_column.dart';
import 'model/table_column_group.dart';
import 'model/table_row.dart';
import 'table_grid.dart';
import 'table_grid_configuration.dart';

/// [TableGridPopup] calls [TableGrid] in the form of a popup.
class TableGridPopup {
  final BuildContext context;

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

  /// {@macro table_grid_property_onSelected}
  final TableOnSelectedEventCallback? onSelected;

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
  final TableGridConfiguration? configuration;

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

  final double? width;

  final double? height;

  TableGridPopup({
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
    TableGridOnSelectedEvent? selected =
        await showDialog<TableGridOnSelectedEvent>(
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
                          TableGridSettings.gridInnerSpacing,
                      height: height ?? size.maxHeight,
                      child: Directionality(
                        textDirection: Directionality.of(context),
                        child: TableGrid(
                          columns: columns,
                          rows: rows,
                          columnGroups: columnGroups,
                          onLoaded: onLoaded,
                          onChanged: onChanged,
                          onSelected: (TableGridOnSelectedEvent event) {
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
