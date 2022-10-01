import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SamojectTableChangeNotifier extends ChangeNotifier {
  final PublishSubject<SamojectTableNotifierEvent> _streamNotifier =
      PublishSubject<SamojectTableNotifierEvent>();

  PublishSubject<SamojectTableNotifierEvent> get streamNotifier =>
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

      _streamNotifier.add(SamojectTableNotifierEvent.instance);
    }
  }

  void notifyListenersOnPostFrame() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}

class SamojectTableNotifierEvent {
  const SamojectTableNotifierEvent();

  static SamojectTableNotifierEvent instance =
      const SamojectTableNotifierEvent();
}
