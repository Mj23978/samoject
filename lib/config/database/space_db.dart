import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../models/space/space.dart';
import '../../utils/keys.dart';

class SpacesStore {
  Box box = Hive.box(DBKeys.spaces);
  bool _initialized = false;

  bool getInitialized() {
    return box.get('initialized', defaultValue: _initialized);
  }

  Future<bool> initSpaces() async {
    if (box.get('initialized', defaultValue: false)) {
      _initialized = true;
      box.put('initialzed', true);
    }
    return true;
  }

  Future<bool> addSpace(Space space) async {
    if (box.get("${space.projectId}.${space.id}") == null) {
      // box.put("${space.projectId}.${space.id}", jsonEncode(space.toJson()));
    }
    return true;
  }

  Future<Space?> getSpace(String id) async {
    return box.get(id);
  }

  Future<int> setConfig(Map<String, dynamic> value) {
    return box.add(value);
  }
}
