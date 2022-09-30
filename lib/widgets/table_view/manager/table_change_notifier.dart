import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class TableChangeNotifier extends ChangeNotifier {
  final PublishSubject<TableNotifierEvent> _streamNotifier =
      PublishSubject<TableNotifierEvent>();

  PublishSubject<TableNotifierEvent> get streamNotifier => _streamNotifier;

  bool _disposed = false;

  @override
  dispose() {
    _disposed = true;

    _streamNotifier.close();

    super.dispose();
  }

  @override
  notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();

      _streamNotifier.add(TableNotifierEvent.instance);
    }
  }

  void notifyListenersOnPostFrame() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}

class TableNotifierEvent {
  const TableNotifierEvent();

  static TableNotifierEvent instance = const TableNotifierEvent();
}
