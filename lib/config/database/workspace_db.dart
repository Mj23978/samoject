import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../models/workspace/workspace.dart';
import '../../utils/keys.dart';
import 'project_db.dart';

class WorkspacesStore {
  Box box = Hive.box(DBKeys.workspaces);
  bool _initialized = false;
  Workspace? _mainWorkspace;

  final ProjectsStore _projectsStore = ProjectsStore();

  bool getInitialized() {
    return box.get('initialized', defaultValue: _initialized);
  }

  Future<bool> initWorkspaces() async {
    if (box.get('initialized', defaultValue: false)) {
      _initialized = true;
      box.put('initialzed', true);
    }
    return true;
  }

  Future<bool> addMainWorkspace(Workspace workspace) async {
    if (box.get('workspace:main') == null) {
      _mainWorkspace ??= workspace;
      _add('workspace:main', _mainWorkspace!);
    }
    return true;
  }

  Future<bool> addWorkspace(Workspace workspace) async {
    if (box.get(workspace.id) == null) {
      _add(workspace.id, workspace);
    }
    return true;
  }

  Future<Workspace?> getWorkspace(String id) async {
    return _get(id);
  }

  Future<bool> _add(String id, Workspace workspace) async {
    for (var proj in workspace.projects) {
      if (workspace.projectIds.contains(proj.id)) {
        _projectsStore.addProject(proj);
      } else {
        _projectsStore.addProject(proj);
        workspace.projectIds.add(proj.id);
      }
    }
    workspace.projects.clear();
    box.put(id, jsonEncode(workspace.toJson()));
    return true;
  }

  Future<Workspace?> _get(String id, {dynamic defaultValue}) async {
    final res = box.get(id, defaultValue: defaultValue);
    if (res == null) {
      return null;
    }
    final workspace = Workspace.fromJson(jsonDecode(res));
    for (var pId in workspace.projectIds) {
      final project = await _projectsStore.getProject("${workspace.id}.$pId");
      if (project != null) {
        workspace.projects.add(project);
      }
    }
    return workspace;
  }

  Future<Workspace?> getMainWorkspace() async {
    return _get('workspace:main', defaultValue: _mainWorkspace);
  }

  Future<int> setConfig(Map<String, dynamic> value) {
    return box.add(value);
  }
}
