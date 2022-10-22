import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/user/user.dart';
import '../../utils/keys.dart';

class ConfigsStore {
  Box appBox = Hive.box(DBKeys.app_config);
  bool? initialized;
  bool? _showSplash;
  Locale? locale;
  User? _me;

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
      _me ??= user;
      appBox.put('me', jsonEncode(_me!.toJson()));
    }
    return true;
  }

  bool getSplash() {
    return appBox.get('showSplash', defaultValue: (_showSplash ?? false));
  }

  User? getMe() {
    final m = appBox.get('me', defaultValue: _me);
    if (m == null) {
      return null;
    }
    return User.fromJson(jsonDecode(m));
  }

  Future<bool> showSplashed() async {
    appBox.put('showSplash', true);
    return true;
  }

  Future<int> setConfig(Map<String, dynamic> value) {
    return appBox.add(value);
  }
}
