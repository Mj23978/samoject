import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../models/project/project.dart';
import '../../utils/keys.dart';

class ProjectsStore {
  Box box = Hive.box(DBKeys.projects);
  bool _initialized = false;

  bool getInitialized() {
    return box.get('initialized', defaultValue: _initialized);
  }

  Future<bool> initProjects() async {
    if (box.get('initialized', defaultValue: false)) {
      _initialized = true;
      box.put('initialzed', true);
    }
    return true;
  }

  Future<bool> addProject(Project project) async {
    if (box.get("${project.workspaceId}.${project.id}") == null) {
      // box.put("${project.workspaceId}.${project.id}", jsonEncode(project.toJson()));
    }
    return true;
  }

  Future<Project?> getProject(String id) async {
    return box.get(id);
  }

  Future<int> setConfig(Map<String, dynamic> value) {
    return box.add(value);
  }
}
