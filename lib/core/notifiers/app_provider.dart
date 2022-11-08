import 'package:flutter/material.dart';

import '../../config/database/configs_store.dart';
import '../../models/project/project.dart';
import '../../models/workspace/workspace.dart';

class AppProvider extends ChangeNotifier {
  AppProvider(this.configsStore);

  ConfigsStore configsStore;
  List<Workspace> workspaces = [];
  Workspace? mainWorkspace;
  Project? selectedProject;

  close() async {}

  initApp() async {
    configsStore.init();
    mainWorkspace = configsStore.workspaceBox.getAll().first;
    selectedProject = mainWorkspace!.projects.first;
    notifyListeners();
  }
}
