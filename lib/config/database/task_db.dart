import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../models/task/task.dart';
import '../../utils/keys.dart';

class TasksStore {
  Box box = Hive.box(DBKeys.tasks);
  bool _initialized = false;

  bool getInitialized() {
    return box.get('initialized', defaultValue: _initialized);
  }

  Future<bool> initTasks() async {
    if (box.get('initialized', defaultValue: false)) {
      _initialized = true;
      box.put('initialzed', true);
    }
    return true;
  }

  Future<bool> addTask(Task task) async {
    if (box.get("${task.projectId}.${task.id}") == null) {
      // box.put("${task.projectId}.${task.id}", jsonEncode(task.toJson()));
    }
    return true;
  }

  Future<Task?> getTask(String id) async {
    return box.get(id);
  }

  Future<int> setConfig(Map<String, dynamic> value) {
    return box.add(value);
  }
}
