import 'package:flutter/material.dart';

import '../manager/table_grid_state_manager.dart';
import '../model/table_column.dart';

abstract class TableColumnMenuDelegate<T> {
  List<PopupMenuEntry<T>> buildMenuItems({
    required TableGridStateManager stateManager,
    required TableViewColumn column,
  });

  void onSelected({
    required BuildContext context,
    required TableGridStateManager stateManager,
    required TableViewColumn column,
    required bool mounted,
    required T? selected,
  });
}

class TableDefaultColumnMenuDelegate
    implements TableColumnMenuDelegate<TableGridColumnMenuItem> {
  const TableDefaultColumnMenuDelegate();

  @override
  List<PopupMenuEntry<TableGridColumnMenuItem>> buildMenuItems({
    required TableGridStateManager stateManager,
    required TableViewColumn column,
  }) {
    return _getDefaultColumnMenuItems(
      stateManager: stateManager,
      column: column,
    );
  }

  @override
  void onSelected({
    required BuildContext context,
    required TableGridStateManager stateManager,
    required TableViewColumn column,
    required bool mounted,
    required TableGridColumnMenuItem? selected,
  }) {
    switch (selected) {
      case TableGridColumnMenuItem.unfreeze:
        stateManager.toggleFrozenColumn(column, TableColumnFrozen.none);
        break;
      case TableGridColumnMenuItem.freezeToStart:
        stateManager.toggleFrozenColumn(column, TableColumnFrozen.start);
        break;
      case TableGridColumnMenuItem.freezeToEnd:
        stateManager.toggleFrozenColumn(column, TableColumnFrozen.end);
        break;
      case TableGridColumnMenuItem.autoFit:
        if (!mounted) return;
        stateManager.autoFitColumn(context, column);
        stateManager.notifyResizingListeners();
        break;
      case TableGridColumnMenuItem.hideColumn:
        stateManager.hideColumn(column, true);
        break;
      case TableGridColumnMenuItem.setColumns:
        if (!mounted) return;
        stateManager.showSetColumnsPopup(context);
        break;
      case TableGridColumnMenuItem.setFilter:
        if (!mounted) return;
        stateManager.showFilterPopup(context, calledColumn: column);
        break;
      case TableGridColumnMenuItem.resetFilter:
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

List<PopupMenuEntry<TableGridColumnMenuItem>> _getDefaultColumnMenuItems({
  required TableGridStateManager stateManager,
  required TableViewColumn column,
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
        value: TableGridColumnMenuItem.unfreeze,
        text: localeText.unfreezeColumn,
        textColor: textColor,
      ),
    if (column.frozen.isFrozen != true) ...[
      _buildMenuItem(
        value: TableGridColumnMenuItem.freezeToStart,
        enabled: enoughFrozenColumnsWidth,
        text: localeText.freezeColumnToStart,
        textColor: enoughFrozenColumnsWidth ? textColor : disableTextColor,
      ),
      _buildMenuItem(
        value: TableGridColumnMenuItem.freezeToEnd,
        enabled: enoughFrozenColumnsWidth,
        text: localeText.freezeColumnToEnd,
        textColor: enoughFrozenColumnsWidth ? textColor : disableTextColor,
      ),
    ],
    const PopupMenuDivider(),
    _buildMenuItem(
      value: TableGridColumnMenuItem.autoFit,
      text: localeText.autoFitColumn,
      textColor: textColor,
    ),
    if (column.enableHideColumnMenuItem == true)
      _buildMenuItem(
        value: TableGridColumnMenuItem.hideColumn,
        text: localeText.hideColumn,
        textColor: textColor,
        enabled: stateManager.refColumns.length > 1,
      ),
    if (column.enableSetColumnsMenuItem == true)
      _buildMenuItem(
        value: TableGridColumnMenuItem.setColumns,
        text: localeText.setColumns,
        textColor: textColor,
      ),
    if (column.enableFilterMenuItem == true) ...[
      const PopupMenuDivider(),
      _buildMenuItem(
        value: TableGridColumnMenuItem.setFilter,
        text: localeText.setFilter,
        textColor: textColor,
      ),
      _buildMenuItem(
        value: TableGridColumnMenuItem.resetFilter,
        text: localeText.resetFilter,
        textColor: textColor,
        enabled: stateManager.hasFilter,
      ),
    ],
  ];
}

PopupMenuItem<TableGridColumnMenuItem> _buildMenuItem<TableGridColumnMenuItem>({
  required String text,
  required Color? textColor,
  bool enabled = true,
  TableGridColumnMenuItem? value,
}) {
  return PopupMenuItem<TableGridColumnMenuItem>(
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
enum TableGridColumnMenuItem {
  unfreeze,
  freezeToStart,
  freezeToEnd,
  hideColumn,
  setColumns,
  autoFit,
  setFilter,
  resetFilter,
}
