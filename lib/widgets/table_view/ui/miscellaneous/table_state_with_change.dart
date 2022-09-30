import 'dart:async';

import 'package:flutter/material.dart';

import '../../manager/table_change_notifier.dart';
import '../../manager/table_grid_state_manager.dart';

typedef TableUpdateState = T Function<T>(
  T oldValue,
  T newValue, {
  bool Function(T a, T b)? compare,
  bool? ignoreChange,
});

abstract class TableStatefulWidget extends StatefulWidget {
  const TableStatefulWidget({Key? key}) : super(key: key);
}

abstract class TableStateWithChange<T extends TableStatefulWidget>
    extends State<T> {
  late final StreamSubscription _subscription;

  bool _initialized = false;

  bool _changed = false;

  bool get changed => _changed;

  StatefulElement? get _statefulElement =>
      mounted ? context as StatefulElement? : null;

  TableGridStateManager get stateManager;

  void updateState() {}

  @override
  void initState() {
    super.initState();

    _subscription = stateManager.streamNotifier.stream.listen(_onChange);

    _initialized = true;
  }

  @override
  void dispose() {
    _subscription.cancel();

    super.dispose();
  }

  U update<U>(
    U oldValue,
    U newValue, {
    bool Function(U a, U b)? compare,
    bool? ignoreChange = false,
  }) {
    if (oldValue == null) {
      _changed = true;
    } else if (ignoreChange == false && _changed == false) {
      _changed = compare == null
          ? oldValue != newValue
          : compare(oldValue, newValue) == false;
    }

    return newValue;
  }

  void _onChange(TableNotifierEvent event) {
    updateState();

    if (mounted && _initialized && _changed && stateManager.maxWidth != null) {
      _changed = false;
      _statefulElement?.markNeedsBuild();
    }
  }
}

mixin TableStateWithKeepAlive<T extends StatefulWidget>
    on AutomaticKeepAliveClientMixin<T> {
  bool _keepAlive = false;

  KeepAliveHandle? _keepAliveHandle;

  @override
  bool get wantKeepAlive => _keepAlive;

  void setKeepAlive(bool flag) {
    if (_keepAlive != flag) {
      _keepAlive = flag;

      updateKeepAlive();
    }
  }

  @override
  @protected
  void updateKeepAlive() {
    if (wantKeepAlive) {
      if (_keepAliveHandle == null) _ensureKeepAlive();
    } else {
      if (_keepAliveHandle != null) _releaseKeepAlive();
    }
  }

  void _ensureKeepAlive() {
    assert(_keepAliveHandle == null);
    _keepAliveHandle = KeepAliveHandle();
    KeepAliveNotification(_keepAliveHandle!).dispatch(context);
  }

  void _releaseKeepAlive() {
    _keepAliveHandle!.release();
    _keepAliveHandle = null;
  }
}
