import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../models/user/user.dart';
import '../../utils/keys.dart';

class UsersStore {
  Box box = Hive.box(DBKeys.users);
  bool _initialized = false;
  User? _me;

  Future<bool> initUsers() async {
    if (box.get('initialized', defaultValue: false)) {
      _initialized = true;
      box.put('initialzed', true);
    }
    return true;
  }

  Future<bool> addMe(User user) async {
    if (box.get('user:me') == null) {
      _me ??= user;
      // box.put('user:me', jsonEncode(_me!.toJson()));
    }
    return true;
  }

  bool getInitialized() {
    return box.get('initialized', defaultValue: _initialized);
  }

  User? getMe() {
    final m = box.get('me', defaultValue: _me);
    if (m == null) {
      return null;
    }
    // return User.fromJson(jsonDecode(m));
  }

  Future<bool> showSplashed() async {
    box.put('showSplash', true);
    return true;
  }

  Future<int> setConfig(Map<String, dynamic> value) {
    return box.add(value);
  }
}
