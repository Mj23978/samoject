import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../models/task_details/task_details.dart';
import '../../utils/keys.dart';

class TaskDetailssStore {
  Box box = Hive.box(DBKeys.task_details);
  bool _initialized = false;

  bool getInitialized() {
    return box.get('initialized', defaultValue: _initialized);
  }

  Future<bool> initTaskDetailss() async {
    if (box.get('initialized', defaultValue: false)) {
      _initialized = true;
      box.put('initialzed', true);
    }
    return true;
  }

  Future<bool> addTaskDetails(TaskDetails taskDetails) async {
    if (box.get(taskDetails.id) == null) {
      box.put(taskDetails.id, jsonEncode(taskDetails.toJson()));
    }
    return true;
  }

  Future<TaskDetails?> getTaskDetails(String id) async {
    return box.get(id);
  }

  Future<int> setConfig(Map<String, dynamic> value) {
    return box.add(value);
  }
}
