import 'package:flutter/material.dart';

import '../manager/samoject_table_grid_state_manager.dart';
import '../model/samoject_table_column.dart';

abstract class SamojectTableColumnMenuDelegate<T> {
  List<PopupMenuEntry<T>> buildMenuItems({
    required SamojectTableGridStateManager stateManager,
    required SamojectTableColumn column,
  });

  void onSelected({
    required BuildContext context,
    required SamojectTableGridStateManager stateManager,
    required SamojectTableColumn column,
    required bool mounted,
    required T? selected,
  });
}

class SamojectTableDefaultColumnMenuDelegate
    implements
        SamojectTableColumnMenuDelegate<SamojectTableGridColumnMenuItem> {
  const SamojectTableDefaultColumnMenuDelegate();

  @override
  List<PopupMenuEntry<SamojectTableGridColumnMenuItem>> buildMenuItems({
    required SamojectTableGridStateManager stateManager,
    required SamojectTableColumn column,
  }) {
    return _getDefaultColumnMenuItems(
      stateManager: stateManager,
      column: column,
    );
  }

  @override
  void onSelected({
    required BuildContext context,
    required SamojectTableGridStateManager stateManager,
    required SamojectTableColumn column,
    required bool mounted,
    required SamojectTableGridColumnMenuItem? selected,
  }) {
    switch (selected) {
      case SamojectTableGridColumnMenuItem.unfreeze:
        stateManager.toggleFrozenColumn(column, SamojectTableColumnFrozen.none);
        break;
      case SamojectTableGridColumnMenuItem.freezeToStart:
        stateManager.toggleFrozenColumn(
            column, SamojectTableColumnFrozen.start);
        break;
      case SamojectTableGridColumnMenuItem.freezeToEnd:
        stateManager.toggleFrozenColumn(column, SamojectTableColumnFrozen.end);
        break;
      case SamojectTableGridColumnMenuItem.autoFit:
        if (!mounted) return;
        stateManager.autoFitColumn(context, column);
        stateManager.notifyResizingListeners();
        break;
      case SamojectTableGridColumnMenuItem.hideColumn:
        stateManager.hideColumn(column, true);
        break;
      case SamojectTableGridColumnMenuItem.setColumns:
        if (!mounted) return;
        stateManager.showSetColumnsPopup(context);
        break;
      case SamojectTableGridColumnMenuItem.setFilter:
        if (!mounted) return;
        stateManager.showFilterPopup(context, calledColumn: column);
        break;
      case SamojectTableGridColumnMenuItem.resetFilter:
        stateManager.setFilter(null);
        break;
      default:
        break;
    }
  }
}

/// Open the context menu on the right side of the column.
Future<T?>? showColumnMenu<T>({
  required BuildContext context,
  required Offset position,
  required List<PopupMenuEntry<T>> items,
  Color backgroundColor = Colors.white,
}) {
  final RenderBox overlay =
      Overlay.of(context)!.context.findRenderObject() as RenderBox;

  return showMenu<T>(
    context: context,
    color: backgroundColor,
    position: RelativeRect.fromLTRB(
      position.dx,
      position.dy,
      position.dx + overlay.size.width,
      position.dy + overlay.size.height,
    ),
    items: items,
    useRootNavigator: true,
  );
}

List<PopupMenuEntry<SamojectTableGridColumnMenuItem>>
    _getDefaultColumnMenuItems({
  required SamojectTableGridStateManager stateManager,
  required SamojectTableColumn column,
}) {
  final Color textColor = stateManager.style.cellTextStyle.color!;

  final Color disableTextColor = textColor.withOpacity(0.5);

  final bool enoughFrozenColumnsWidth = stateManager.enoughFrozenColumnsWidth(
    stateManager.maxWidth! - column.width,
  );

  final localeText = stateManager.localeText;

  return [
    if (column.frozen.isFrozen == true)
      _buildMenuItem(
        value: SamojectTableGridColumnMenuItem.unfreeze,
        text: localeText.unfreezeColumn,
        textColor: textColor,
      ),
    if (column.frozen.isFrozen != true) ...[
      _buildMenuItem(
        value: SamojectTableGridColumnMenuItem.freezeToStart,
        enabled: enoughFrozenColumnsWidth,
        text: localeText.freezeColumnToStart,
        textColor: enoughFrozenColumnsWidth ? textColor : disableTextColor,
      ),
      _buildMenuItem(
        value: SamojectTableGridColumnMenuItem.freezeToEnd,
        enabled: enoughFrozenColumnsWidth,
        text: localeText.freezeColumnToEnd,
        textColor: enoughFrozenColumnsWidth ? textColor : disableTextColor,
      ),
    ],
    const PopupMenuDivider(),
    _buildMenuItem(
      value: SamojectTableGridColumnMenuItem.autoFit,
      text: localeText.autoFitColumn,
      textColor: textColor,
    ),
    if (column.enableHideColumnMenuItem == true)
      _buildMenuItem(
        value: SamojectTableGridColumnMenuItem.hideColumn,
        text: localeText.hideColumn,
        textColor: textColor,
        enabled: stateManager.refColumns.length > 1,
      ),
    if (column.enableSetColumnsMenuItem == true)
      _buildMenuItem(
        value: SamojectTableGridColumnMenuItem.setColumns,
        text: localeText.setColumns,
        textColor: textColor,
      ),
    if (column.enableFilterMenuItem == true) ...[
      const PopupMenuDivider(),
      _buildMenuItem(
        value: SamojectTableGridColumnMenuItem.setFilter,
        text: localeText.setFilter,
        textColor: textColor,
      ),
      _buildMenuItem(
        value: SamojectTableGridColumnMenuItem.resetFilter,
        text: localeText.resetFilter,
        textColor: textColor,
        enabled: stateManager.hasFilter,
      ),
    ],
  ];
}

PopupMenuItem<SamojectTableGridColumnMenuItem>
    _buildMenuItem<SamojectTableGridColumnMenuItem>({
  required String text,
  required Color? textColor,
  bool enabled = true,
  SamojectTableGridColumnMenuItem? value,
}) {
  return PopupMenuItem<SamojectTableGridColumnMenuItem>(
    value: value,
    height: 36,
    enabled: enabled,
    child: Text(
      text,
      style: TextStyle(
        color: enabled ? textColor : textColor!.withOpacity(0.5),
        fontSize: 13,
      ),
    ),
  );
}

/// Items in the context menu on the right side of the column
enum SamojectTableGridColumnMenuItem {
  unfreeze,
  freezeToStart,
  freezeToEnd,
  hideColumn,
  setColumns,
  autoFit,
  setFilter,
  resetFilter,
}
