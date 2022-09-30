import 'package:flutter/material.dart';

import '../../helper/show_column_menu.dart';
import '../../table_grid.dart';
import '../../table_grid_configuration.dart';
import '../table_grid_event_manager.dart';
import '../table_grid_key_manager.dart';
import '../table_grid_state_manager.dart';

abstract class IGridState {
  GlobalKey? get gridKey;

  TableGridMode? get mode;

  TableGridConfiguration get configuration;

  TableGridKeyManager? get keyManager;

  TableGridEventManager? get eventManager;

  TableOnChangedEventCallback? get onChanged;

  TableOnSelectedEventCallback? get onSelected;

  TableOnSortedEventCallback? get onSorted;

  TableOnRowCheckedEventCallback? get onRowChecked;

  TableOnRowDoubleTapEventCallback? get onRowDoubleTap;

  TableOnRowSecondaryTapEventCallback? get onRowSecondaryTap;

  TableOnRowsMovedEventCallback? get onRowsMoved;

  TableColumnMenuDelegate get columnMenuDelegate;

  CreateHeaderCallBack? get createHeader;

  CreateFooterCallBack? get createFooter;

  TableGridLocaleText get localeText;

  TableGridStyleConfig get style;

  void setGridKey(GlobalKey key);

  void setKeyManager(TableGridKeyManager keyManager);

  void setEventManager(TableGridEventManager eventManager);

  void setGridMode(TableGridMode mode);

  void setOnChanged(TableOnChangedEventCallback onChanged);

  void setColumnMenuDelegate(TableColumnMenuDelegate? columnMenuDelegate);

  void setCreateHeader(CreateHeaderCallBack createHeader);

  void setCreateFooter(CreateFooterCallBack createFooter);

  void setOnSelected(TableOnSelectedEventCallback onSelected);

  void setOnSorted(TableOnSortedEventCallback? onSorted);

  void setOnRowChecked(TableOnRowCheckedEventCallback? onRowChecked);

  void setOnRowDoubleTap(TableOnRowDoubleTapEventCallback? onDoubleTap);

  void setOnRowSecondaryTap(
      TableOnRowSecondaryTapEventCallback? onSecondaryTap);

  void setOnRowsMoved(TableOnRowsMovedEventCallback? onRowsMoved);

  void setConfiguration(
    TableGridConfiguration? configuration, {
    bool updateLocale = true,
    bool applyColumnFilter = true,
  });

  void resetCurrentState({bool notify = true});

  /// Event occurred after selecting Row in Select mode.
  void handleOnSelected();

  void forceUpdate();
}

mixin GridState implements ITableGridState {
  @override
  GlobalKey? get gridKey => _gridKey;

  GlobalKey? _gridKey;

  @override
  TableGridMode? get mode => _mode;

  TableGridMode? _mode;

  @override
  TableGridConfiguration get configuration => _configuration!;

  TableGridConfiguration? _configuration;

  TableGridKeyManager? _keyManager;

  @override
  TableGridKeyManager? get keyManager => _keyManager;

  TableGridEventManager? _eventManager;

  @override
  TableGridEventManager? get eventManager => _eventManager;

  @override
  TableOnChangedEventCallback? get onChanged => _onChanged;

  TableOnChangedEventCallback? _onChanged;

  @override
  TableOnSelectedEventCallback? get onSelected => _onSelected;

  TableOnSelectedEventCallback? _onSelected;

  @override
  TableOnSortedEventCallback? get onSorted => _onSorted;

  TableOnSortedEventCallback? _onSorted;

  @override
  TableOnRowCheckedEventCallback? get onRowChecked => _onRowChecked;

  TableOnRowCheckedEventCallback? _onRowChecked;

  @override
  TableOnRowDoubleTapEventCallback? get onRowDoubleTap => _onRowDoubleTap;

  TableOnRowDoubleTapEventCallback? _onRowDoubleTap;

  @override
  TableOnRowSecondaryTapEventCallback? get onRowSecondaryTap =>
      _onRowSecondaryTap;

  TableOnRowSecondaryTapEventCallback? _onRowSecondaryTap;

  @override
  TableOnRowsMovedEventCallback? get onRowsMoved => _onRowsMoved;

  TableOnRowsMovedEventCallback? _onRowsMoved;

  @override
  TableColumnMenuDelegate get columnMenuDelegate => _columnMenuDelegate;

  TableColumnMenuDelegate _columnMenuDelegate =
      const TableDefaultColumnMenuDelegate();

  @override
  CreateHeaderCallBack? get createHeader => _createHeader;

  CreateHeaderCallBack? _createHeader;

  @override
  CreateFooterCallBack? get createFooter => _createFooter;

  CreateFooterCallBack? _createFooter;

  @override
  TableGridLocaleText get localeText => configuration.localeText;

  @override
  TableGridStyleConfig get style => configuration.style;

  @override
  void setKeyManager(TableGridKeyManager? keyManager) {
    _keyManager = keyManager;
  }

  @override
  void setEventManager(TableGridEventManager? eventManager) {
    _eventManager = eventManager;
  }

  @override
  void setGridMode(TableGridMode? mode) {
    _mode = mode;
  }

  @override
  void setOnChanged(TableOnChangedEventCallback? onChanged) {
    _onChanged = onChanged;
  }

  @override
  void setOnSelected(TableOnSelectedEventCallback? onSelected) {
    _onSelected = onSelected;
  }

  @override
  void setOnSorted(TableOnSortedEventCallback? onSorted) {
    _onSorted = onSorted;
  }

  @override
  void setOnRowChecked(TableOnRowCheckedEventCallback? onRowChecked) {
    _onRowChecked = onRowChecked;
  }

  @override
  void setOnRowDoubleTap(TableOnRowDoubleTapEventCallback? onRowDoubleTap) {
    _onRowDoubleTap = onRowDoubleTap;
  }

  @override
  void setOnRowSecondaryTap(
      TableOnRowSecondaryTapEventCallback? onRowSecondaryTap) {
    _onRowSecondaryTap = onRowSecondaryTap;
  }

  @override
  void setOnRowsMoved(TableOnRowsMovedEventCallback? onRowsMoved) {
    _onRowsMoved = onRowsMoved;
  }

  @override
  void setColumnMenuDelegate(TableColumnMenuDelegate? columnMenuDelegate) {
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
    TableGridConfiguration? configuration, {
    bool updateLocale = true,
    bool applyColumnFilter = true,
  }) {
    _configuration = configuration ?? const TableGridConfiguration();

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
        TableGridOnSelectedEvent(
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
        .findAncestorStateOfType<TableGridState>()!
        // ignore: invalid_use_of_protected_member
        .setState(() {});
  }
}
