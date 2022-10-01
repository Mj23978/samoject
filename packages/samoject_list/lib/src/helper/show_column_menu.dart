import 'package:flutter/material.dart';

import '../manager/samoject_list_grid_state_manager.dart';
import '../model/samoject_list_column.dart';

abstract class SamojectListColumnMenuDelegate<T> {
  List<PopupMenuEntry<T>> buildMenuItems({
    required SamojectListGridStateManager stateManager,
    required SamojectListColumn column,
  });

  void onSelected({
    required BuildContext context,
    required SamojectListGridStateManager stateManager,
    required SamojectListColumn column,
    required bool mounted,
    required T? selected,
  });
}

class SamojectListDefaultColumnMenuDelegate
    implements SamojectListColumnMenuDelegate<SamojectListGridColumnMenuItem> {
  const SamojectListDefaultColumnMenuDelegate();

  @override
  List<PopupMenuEntry<SamojectListGridColumnMenuItem>> buildMenuItems({
    required SamojectListGridStateManager stateManager,
    required SamojectListColumn column,
  }) {
    return _getDefaultColumnMenuItems(
      stateManager: stateManager,
      column: column,
    );
  }

  @override
  void onSelected({
    required BuildContext context,
    required SamojectListGridStateManager stateManager,
    required SamojectListColumn column,
    required bool mounted,
    required SamojectListGridColumnMenuItem? selected,
  }) {
    switch (selected) {
      case SamojectListGridColumnMenuItem.unfreeze:
        stateManager.toggleFrozenColumn(column, SamojectListColumnFrozen.none);
        break;
      case SamojectListGridColumnMenuItem.freezeToStart:
        stateManager.toggleFrozenColumn(column, SamojectListColumnFrozen.start);
        break;
      case SamojectListGridColumnMenuItem.freezeToEnd:
        stateManager.toggleFrozenColumn(column, SamojectListColumnFrozen.end);
        break;
      case SamojectListGridColumnMenuItem.autoFit:
        if (!mounted) return;
        stateManager.autoFitColumn(context, column);
        stateManager.notifyResizingListeners();
        break;
      case SamojectListGridColumnMenuItem.hideColumn:
        stateManager.hideColumn(column, true);
        break;
      case SamojectListGridColumnMenuItem.setColumns:
        if (!mounted) return;
        stateManager.showSetColumnsPopup(context);
        break;
      case SamojectListGridColumnMenuItem.setFilter:
        if (!mounted) return;
        stateManager.showFilterPopup(context, calledColumn: column);
        break;
      case SamojectListGridColumnMenuItem.resetFilter:
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

List<PopupMenuEntry<SamojectListGridColumnMenuItem>>
    _getDefaultColumnMenuItems({
  required SamojectListGridStateManager stateManager,
  required SamojectListColumn column,
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
        value: SamojectListGridColumnMenuItem.unfreeze,
        text: localeText.unfreezeColumn,
        textColor: textColor,
      ),
    if (column.frozen.isFrozen != true) ...[
      _buildMenuItem(
        value: SamojectListGridColumnMenuItem.freezeToStart,
        enabled: enoughFrozenColumnsWidth,
        text: localeText.freezeColumnToStart,
        textColor: enoughFrozenColumnsWidth ? textColor : disableTextColor,
      ),
      _buildMenuItem(
        value: SamojectListGridColumnMenuItem.freezeToEnd,
        enabled: enoughFrozenColumnsWidth,
        text: localeText.freezeColumnToEnd,
        textColor: enoughFrozenColumnsWidth ? textColor : disableTextColor,
      ),
    ],
    const PopupMenuDivider(),
    _buildMenuItem(
      value: SamojectListGridColumnMenuItem.autoFit,
      text: localeText.autoFitColumn,
      textColor: textColor,
    ),
    if (column.enableHideColumnMenuItem == true)
      _buildMenuItem(
        value: SamojectListGridColumnMenuItem.hideColumn,
        text: localeText.hideColumn,
        textColor: textColor,
        enabled: stateManager.refColumns.length > 1,
      ),
    if (column.enableSetColumnsMenuItem == true)
      _buildMenuItem(
        value: SamojectListGridColumnMenuItem.setColumns,
        text: localeText.setColumns,
        textColor: textColor,
      ),
    if (column.enableFilterMenuItem == true) ...[
      const PopupMenuDivider(),
      _buildMenuItem(
        value: SamojectListGridColumnMenuItem.setFilter,
        text: localeText.setFilter,
        textColor: textColor,
      ),
      _buildMenuItem(
        value: SamojectListGridColumnMenuItem.resetFilter,
        text: localeText.resetFilter,
        textColor: textColor,
        enabled: stateManager.hasFilter,
      ),
    ],
  ];
}

PopupMenuItem<SamojectListGridColumnMenuItem>
    _buildMenuItem<SamojectListGridColumnMenuItem>({
  required String text,
  required Color? textColor,
  bool enabled = true,
  SamojectListGridColumnMenuItem? value,
}) {
  return PopupMenuItem<SamojectListGridColumnMenuItem>(
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
enum SamojectListGridColumnMenuItem {
  unfreeze,
  freezeToStart,
  freezeToEnd,
  hideColumn,
  setColumns,
  autoFit,
  setFilter,
  resetFilter,
}
