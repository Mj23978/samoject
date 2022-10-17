import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../utils/keys.dart';
import '../../models/app_configs/app_configs.dart';
import '../../models/workspace/workspace.dart';
import '../../config/samples/sample_data.dart';
import '../../models/project/project.dart';
import '../../models/task/task.dart';
import '../../models/user/user.dart';

class AppProvider extends ChangeNotifier {
  
  Box<AppConfigs> appBox = Hive.box<AppConfigs>(DBKeys.app_config);
  AppConfigs? appConfigs;
  User? me;
  List<User> users = [];

  final List<Task> _allTasks = [
    task1,
    task2,
    task3,
    task4,
    task5,
    task6,
    task7,
    task8,
    task9,
    task10,
    task11,
    task12,
    task13,
    task14,
    task15,
    task16,
    task17,
    task18,
    task19,
    task20,
    task21,
    task22,
    task23,
    task24,
    task25,
    task26,
    task27,
    task28,
    task29,
    task30,
    task31,
    task32,
    task33,
    task34,
    task35,
    task36,
    task37,
    task38,
    task39,
  ];
  late Project project;
  List<Workspace> workspaces = [];

  close() async {}

  initApp() async {
    final settings = ProjectSettings(id: Uuid().v4());
    project = Project(
      id: Uuid().v4(),
      name: "Samoject Project",
      settings: settings,
    );
    workspaces.add(Workspace(
            id: Uuid().v4(),
      name: "Samoject Workspace",
    ));
    if (appBox.get("configs") != null) {
      appConfigs = AppConfigs(id: Uuid().v4());
      appBox.put("configs", appConfigs!);
    }
    if (!appConfigs!.initialized) {
      me ??= mj;
      me = setUserData(me!);
      users.addAll(
          [morteza, moslem, hoji, shahraki, mobin].map(setUserData).toList());
      appConfigs =
          appConfigs!.copyWith(locale: Locale("en", "En"), initialized: true);
      notifyListeners();
    }
  }

  User setUserData(User user) {
    return user.copyWith(
        createdTasks: _allTasks
            .takeWhile((element) => element.creatorId == user.id)
            .toList(),
        assignedTasks: _allTasks
            .takeWhile((value) => value.assignesId.contains(user.id))
            .toList(),
        workspaces: workspaces);
  }
}
