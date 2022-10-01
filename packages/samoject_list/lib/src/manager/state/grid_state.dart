import 'package:flutter/material.dart';

import '../../helper/show_column_menu.dart';
import '../../samoject_list_grid.dart';
import '../../samoject_list_grid_configuration.dart';
import '../samoject_list_grid_event_manager.dart';
import '../samoject_list_grid_key_manager.dart';
import '../samoject_list_grid_state_manager.dart';

abstract class IGridState {
  GlobalKey? get gridKey;

  SamojectListGridMode? get mode;

  SamojectListGridConfiguration get configuration;

  SamojectListGridKeyManager? get keyManager;

  SamojectListGridEventManager? get eventManager;

  SamojectListOnChangedEventCallback? get onChanged;

  SamojectListOnSelectedEventCallback? get onSelected;

  SamojectListOnSortedEventCallback? get onSorted;

  SamojectListOnRowCheckedEventCallback? get onRowChecked;

  SamojectListOnRowDoubleTapEventCallback? get onRowDoubleTap;

  SamojectListOnRowSecondaryTapEventCallback? get onRowSecondaryTap;

  SamojectListOnRowsMovedEventCallback? get onRowsMoved;

  SamojectListColumnMenuDelegate get columnMenuDelegate;

  CreateHeaderCallBack? get createHeader;

  CreateFooterCallBack? get createFooter;

  SamojectListGridLocaleText get localeText;

  SamojectListGridStyleConfig get style;

  void setGridKey(GlobalKey key);

  void setKeyManager(SamojectListGridKeyManager keyManager);

  void setEventManager(SamojectListGridEventManager eventManager);

  void setGridMode(SamojectListGridMode mode);

  void setOnChanged(SamojectListOnChangedEventCallback onChanged);

  void setColumnMenuDelegate(
      SamojectListColumnMenuDelegate? columnMenuDelegate);

  void setCreateHeader(CreateHeaderCallBack createHeader);

  void setCreateFooter(CreateFooterCallBack createFooter);

  void setOnSelected(SamojectListOnSelectedEventCallback onSelected);

  void setOnSorted(SamojectListOnSortedEventCallback? onSorted);

  void setOnRowChecked(SamojectListOnRowCheckedEventCallback? onRowChecked);

  void setOnRowDoubleTap(SamojectListOnRowDoubleTapEventCallback? onDoubleTap);

  void setOnRowSecondaryTap(
      SamojectListOnRowSecondaryTapEventCallback? onSecondaryTap);

  void setOnRowsMoved(SamojectListOnRowsMovedEventCallback? onRowsMoved);

  void setConfiguration(
    SamojectListGridConfiguration? configuration, {
    bool updateLocale = true,
    bool applyColumnFilter = true,
  });

  void resetCurrentState({bool notify = true});

  /// Event occurred after selecting Row in Select mode.
  void handleOnSelected();

  void forceUpdate();
}

mixin GridState implements ISamojectListGridState {
  @override
  GlobalKey? get gridKey => _gridKey;

  GlobalKey? _gridKey;

  @override
  SamojectListGridMode? get mode => _mode;

  SamojectListGridMode? _mode;

  @override
  SamojectListGridConfiguration get configuration => _configuration!;

  SamojectListGridConfiguration? _configuration;

  SamojectListGridKeyManager? _keyManager;

  @override
  SamojectListGridKeyManager? get keyManager => _keyManager;

  SamojectListGridEventManager? _eventManager;

  @override
  SamojectListGridEventManager? get eventManager => _eventManager;

  @override
  SamojectListOnChangedEventCallback? get onChanged => _onChanged;

  SamojectListOnChangedEventCallback? _onChanged;

  @override
  SamojectListOnSelectedEventCallback? get onSelected => _onSelected;

  SamojectListOnSelectedEventCallback? _onSelected;

  @override
  SamojectListOnSortedEventCallback? get onSorted => _onSorted;

  SamojectListOnSortedEventCallback? _onSorted;

  @override
  SamojectListOnRowCheckedEventCallback? get onRowChecked => _onRowChecked;

  SamojectListOnRowCheckedEventCallback? _onRowChecked;

  @override
  SamojectListOnRowDoubleTapEventCallback? get onRowDoubleTap =>
      _onRowDoubleTap;

  SamojectListOnRowDoubleTapEventCallback? _onRowDoubleTap;

  @override
  SamojectListOnRowSecondaryTapEventCallback? get onRowSecondaryTap =>
      _onRowSecondaryTap;

  SamojectListOnRowSecondaryTapEventCallback? _onRowSecondaryTap;

  @override
  SamojectListOnRowsMovedEventCallback? get onRowsMoved => _onRowsMoved;

  SamojectListOnRowsMovedEventCallback? _onRowsMoved;

  @override
  SamojectListColumnMenuDelegate get columnMenuDelegate => _columnMenuDelegate;

  SamojectListColumnMenuDelegate _columnMenuDelegate =
      const SamojectListDefaultColumnMenuDelegate();

  @override
  CreateHeaderCallBack? get createHeader => _createHeader;

  CreateHeaderCallBack? _createHeader;

  @override
  CreateFooterCallBack? get createFooter => _createFooter;

  CreateFooterCallBack? _createFooter;

  @override
  SamojectListGridLocaleText get localeText => configuration.localeText;

  @override
  SamojectListGridStyleConfig get style => configuration.style;

  @override
  void setKeyManager(SamojectListGridKeyManager? keyManager) {
    _keyManager = keyManager;
  }

  @override
  void setEventManager(SamojectListGridEventManager? eventManager) {
    _eventManager = eventManager;
  }

  @override
  void setGridMode(SamojectListGridMode? mode) {
    _mode = mode;
  }

  @override
  void setOnChanged(SamojectListOnChangedEventCallback? onChanged) {
    _onChanged = onChanged;
  }

  @override
  void setOnSelected(SamojectListOnSelectedEventCallback? onSelected) {
    _onSelected = onSelected;
  }

  @override
  void setOnSorted(SamojectListOnSortedEventCallback? onSorted) {
    _onSorted = onSorted;
  }

  @override
  void setOnRowChecked(SamojectListOnRowCheckedEventCallback? onRowChecked) {
    _onRowChecked = onRowChecked;
  }

  @override
  void setOnRowDoubleTap(
      SamojectListOnRowDoubleTapEventCallback? onRowDoubleTap) {
    _onRowDoubleTap = onRowDoubleTap;
  }

  @override
  void setOnRowSecondaryTap(
      SamojectListOnRowSecondaryTapEventCallback? onRowSecondaryTap) {
    _onRowSecondaryTap = onRowSecondaryTap;
  }

  @override
  void setOnRowsMoved(SamojectListOnRowsMovedEventCallback? onRowsMoved) {
    _onRowsMoved = onRowsMoved;
  }

  @override
  void setColumnMenuDelegate(
      SamojectListColumnMenuDelegate? columnMenuDelegate) {
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
    SamojectListGridConfiguration? configuration, {
    bool updateLocale = true,
    bool applyColumnFilter = true,
  }) {
    _configuration = configuration ?? const SamojectListGridConfiguration();

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
        SamojectListGridOnSelectedEvent(
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
        .findAncestorStateOfType<SamojectListGridState>()!
        // ignore: invalid_use_of_protected_member
        .setState(() {});
  }
}
