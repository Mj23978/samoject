import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SamojectListChangeNotifier extends ChangeNotifier {
  final PublishSubject<SamojectListNotifierEvent> _streamNotifier =
      PublishSubject<SamojectListNotifierEvent>();

  PublishSubject<SamojectListNotifierEvent> get streamNotifier =>
      _streamNotifier;

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

      _streamNotifier.add(SamojectListNotifierEvent.instance);
    }
  }

  void notifyListenersOnPostFrame() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}

class SamojectListNotifierEvent {
  const SamojectListNotifierEvent();

  static SamojectListNotifierEvent instance = const SamojectListNotifierEvent();
}
