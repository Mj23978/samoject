import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/user/user.dart';
import '../../utils/keys.dart';

class ConfigsStore {
  Box appBox = Hive.box(DBKeys.app_config);
  bool? initialized;
  bool? showSplash;
  Locale? locale;
  User? me;

  Future<bool> initConfigs() async {
    if (appBox.get('initialized', defaultValue: false)) {
      locale = Locale('en', 'EN');
      appBox.put('initialzed', true);
      appBox.put('local', Locale('en', 'EN'));
    }
    return true;
  }

  Future<bool> addMe(User user) async {
    if (appBox.get('me') == null) {
      me ??= user;
      appBox.put('me', me!.toJson());
    }
    return true;
  }

  Future<bool> showSplashed() async {
    appBox.put('showSplash', true);
    return true;
  }

  Future<int> setConfig(Map<String, dynamic> value) {
    return appBox.add(value);
  }
}
