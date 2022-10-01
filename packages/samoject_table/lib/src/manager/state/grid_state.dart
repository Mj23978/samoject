import 'package:flutter/material.dart';

import '../../helper/show_column_menu.dart';
import '../../samoject_table_grid.dart';
import '../../samoject_table_grid_configuration.dart';
import '../samoject_table_grid_event_manager.dart';
import '../samoject_table_grid_key_manager.dart';
import '../samoject_table_grid_state_manager.dart';

abstract class IGridState {
  GlobalKey? get gridKey;

  SamojectTableGridMode? get mode;

  SamojectTableGridConfiguration get configuration;

  SamojectTableGridKeyManager? get keyManager;

  SamojectTableGridEventManager? get eventManager;

  SamojectTableOnChangedEventCallback? get onChanged;

  SamojectTableOnSelectedEventCallback? get onSelected;

  SamojectTableOnSortedEventCallback? get onSorted;

  SamojectTableOnRowCheckedEventCallback? get onRowChecked;

  SamojectTableOnRowDoubleTapEventCallback? get onRowDoubleTap;

  SamojectTableOnRowSecondaryTapEventCallback? get onRowSecondaryTap;

  SamojectTableOnRowsMovedEventCallback? get onRowsMoved;

  SamojectTableColumnMenuDelegate get columnMenuDelegate;

  CreateHeaderCallBack? get createHeader;

  CreateFooterCallBack? get createFooter;

  SamojectTableGridLocaleText get localeText;

  SamojectTableGridStyleConfig get style;

  void setGridKey(GlobalKey key);

  void setKeyManager(SamojectTableGridKeyManager keyManager);

  void setEventManager(SamojectTableGridEventManager eventManager);

  void setGridMode(SamojectTableGridMode mode);

  void setOnChanged(SamojectTableOnChangedEventCallback onChanged);

  void setColumnMenuDelegate(
      SamojectTableColumnMenuDelegate? columnMenuDelegate);

  void setCreateHeader(CreateHeaderCallBack createHeader);

  void setCreateFooter(CreateFooterCallBack createFooter);

  void setOnSelected(SamojectTableOnSelectedEventCallback onSelected);

  void setOnSorted(SamojectTableOnSortedEventCallback? onSorted);

  void setOnRowChecked(SamojectTableOnRowCheckedEventCallback? onRowChecked);

  void setOnRowDoubleTap(SamojectTableOnRowDoubleTapEventCallback? onDoubleTap);

  void setOnRowSecondaryTap(
      SamojectTableOnRowSecondaryTapEventCallback? onSecondaryTap);

  void setOnRowsMoved(SamojectTableOnRowsMovedEventCallback? onRowsMoved);

  void setConfiguration(
    SamojectTableGridConfiguration? configuration, {
    bool updateLocale = true,
    bool applyColumnFilter = true,
  });

  void resetCurrentState({bool notify = true});

  /// Event occurred after selecting Row in Select mode.
  void handleOnSelected();

  void forceUpdate();
}

mixin GridState implements ISamojectTableGridState {
  @override
  GlobalKey? get gridKey => _gridKey;

  GlobalKey? _gridKey;

  @override
  SamojectTableGridMode? get mode => _mode;

  SamojectTableGridMode? _mode;

  @override
  SamojectTableGridConfiguration get configuration => _configuration!;

  SamojectTableGridConfiguration? _configuration;

  SamojectTableGridKeyManager? _keyManager;

  @override
  SamojectTableGridKeyManager? get keyManager => _keyManager;

  SamojectTableGridEventManager? _eventManager;

  @override
  SamojectTableGridEventManager? get eventManager => _eventManager;

  @override
  SamojectTableOnChangedEventCallback? get onChanged => _onChanged;

  SamojectTableOnChangedEventCallback? _onChanged;

  @override
  SamojectTableOnSelectedEventCallback? get onSelected => _onSelected;

  SamojectTableOnSelectedEventCallback? _onSelected;

  @override
  SamojectTableOnSortedEventCallback? get onSorted => _onSorted;

  SamojectTableOnSortedEventCallback? _onSorted;

  @override
  SamojectTableOnRowCheckedEventCallback? get onRowChecked => _onRowChecked;

  SamojectTableOnRowCheckedEventCallback? _onRowChecked;

  @override
  SamojectTableOnRowDoubleTapEventCallback? get onRowDoubleTap =>
      _onRowDoubleTap;

  SamojectTableOnRowDoubleTapEventCallback? _onRowDoubleTap;

  @override
  SamojectTableOnRowSecondaryTapEventCallback? get onRowSecondaryTap =>
      _onRowSecondaryTap;

  SamojectTableOnRowSecondaryTapEventCallback? _onRowSecondaryTap;

  @override
  SamojectTableOnRowsMovedEventCallback? get onRowsMoved => _onRowsMoved;

  SamojectTableOnRowsMovedEventCallback? _onRowsMoved;

  @override
  SamojectTableColumnMenuDelegate get columnMenuDelegate => _columnMenuDelegate;

  SamojectTableColumnMenuDelegate _columnMenuDelegate =
      const SamojectTableDefaultColumnMenuDelegate();

  @override
  CreateHeaderCallBack? get createHeader => _createHeader;

  CreateHeaderCallBack? _createHeader;

  @override
  CreateFooterCallBack? get createFooter => _createFooter;

  CreateFooterCallBack? _createFooter;

  @override
  SamojectTableGridLocaleText get localeText => configuration.localeText;

  @override
  SamojectTableGridStyleConfig get style => configuration.style;

  @override
  void setKeyManager(SamojectTableGridKeyManager? keyManager) {
    _keyManager = keyManager;
  }

  @override
  void setEventManager(SamojectTableGridEventManager? eventManager) {
    _eventManager = eventManager;
  }

  @override
  void setGridMode(SamojectTableGridMode? mode) {
    _mode = mode;
  }

  @override
  void setOnChanged(SamojectTableOnChangedEventCallback? onChanged) {
    _onChanged = onChanged;
  }

  @override
  void setOnSelected(SamojectTableOnSelectedEventCallback? onSelected) {
    _onSelected = onSelected;
  }

  @override
  void setOnSorted(SamojectTableOnSortedEventCallback? onSorted) {
    _onSorted = onSorted;
  }

  @override
  void setOnRowChecked(SamojectTableOnRowCheckedEventCallback? onRowChecked) {
    _onRowChecked = onRowChecked;
  }

  @override
  void setOnRowDoubleTap(
      SamojectTableOnRowDoubleTapEventCallback? onRowDoubleTap) {
    _onRowDoubleTap = onRowDoubleTap;
  }

  @override
  void setOnRowSecondaryTap(
      SamojectTableOnRowSecondaryTapEventCallback? onRowSecondaryTap) {
    _onRowSecondaryTap = onRowSecondaryTap;
  }

  @override
  void setOnRowsMoved(SamojectTableOnRowsMovedEventCallback? onRowsMoved) {
    _onRowsMoved = onRowsMoved;
  }

  @override
  void setColumnMenuDelegate(
      SamojectTableColumnMenuDelegate? columnMenuDelegate) {
    if (columnMenuDelegate == null) {
      return;
    }

    _columnMenuDelegate = columnMenuDelegate;
  }

  @override
  void setCreateHeader(CreateHeaderCallBack? createHeader) {
    _createHeader = createHeader;
  }

  @override
  void setCreateFooter(CreateFooterCallBack? createFooter) {
    _createFooter = createFooter;
  }

  @override
  void setConfiguration(
    SamojectTableGridConfiguration? configuration, {
    bool updateLocale = true,
    bool applyColumnFilter = true,
  }) {
    _configuration = configuration ?? const SamojectTableGridConfiguration();

    if (updateLocale) {
      _configuration!.updateLocale();
    }

    if (applyColumnFilter) {
      _configuration!.applyColumnFilter(refColumns);
    }
  }

  @override
  void setGridKey(GlobalKey key) {
    _gridKey = key;
  }

  @override
  void resetCurrentState({bool notify = true}) {
    clearCurrentCell(notify: false);

    clearCurrentSelecting(notify: false);

    if (notify) {
      notifyListeners();
    }
  }

  @override
  void handleOnSelected() {
    if (_mode.isSelect == true && _onSelected != null) {
      _onSelected!(
        SamojectTableGridOnSelectedEvent(
          row: currentRow,
          rowIdx: currentRowIdx,
          cell: currentCell,
        ),
      );
    }
  }

  @override
  void forceUpdate() {
    if (gridKey?.currentContext == null) {
      return;
    }

    gridKey!.currentContext!
        .findAncestorStateOfType<SamojectTableGridState>()!
        // ignore: invalid_use_of_protected_member
        .setState(() {});
  }
}
