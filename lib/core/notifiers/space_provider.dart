import 'package:flutter/material.dart';

import '../../models/enums.dart';
import '../../models/task/task.dart';
import '../../models/task_status/task_status.dart';
import '../../models/user/user.dart';
import 'home_provider.dart';

class SpaceProvider extends ChangeNotifier {
  SpaceProvider(this.home);

  HomeProvider home;
  SpaceType? spaceType;
  List<Task> allTasks = [];
  List<User> users = [];
  List<SpaceBoxTileData> tiles = [];

  init() {
    spaceType = home.selectedSpace!.spaceType.toSpaceType();
    allTasks.addAll(home.appProvider.selectedProject!.tasks);
    users.addAll(home.appProvider.selectedProject!.users);
    if (spaceType == SpaceType.box) {
      setupBox();
    }
  }

  setupBox() {
    for (var user in users) {
      tiles.add(SpaceBoxTileData(
        expandAllTasks: false,
        username: user.username,
        circleName: "${user.firstName} ${user.lastName}",
        tasks: createLineData(user),
        allTasks: user.assignedTasks.length,
        doneTasks: user.assignedTasks
            .where((task) => task.status.target!.name == "Complete")
            .toList()
            .length,
      ));
    }
  }

  createLineData(User user) {
    final result = <String, List<Task>>{};
    for (var task in user.assignedTasks) {
      if (result[task.status.target?.name] == null) {
        result[task.status.target!.name] = [];
      }
      result[task.status.target!.name]!.add(task);
    }
    return result;
  }

  int sortStatus(String status) {
    if (status == "Todo") {
      return 0;
    } else if (status == "Idea") {
      return 10;
    } else if (status == "Planned") {
      return 20;
    } else if (status == "Starting") {
      return 30;
    } else if (status == "In Progress") {
      return 40;
    } else if (status == "Under Review") {
      return 50;
    } else if (status == "Complete") {
      return 60;
    } else {
      return 90;
    }
  }
}

class SpaceBoxTileData {
  final Map<String, List<Task>> tasks;
  final String username;
  final String circleName;
  final bool expandAllTasks;
  final int allTasks;
  final int doneTasks;

  SpaceBoxTileData({
    required this.username,
    required this.circleName,
    required this.expandAllTasks,
    required this.tasks,
    required this.allTasks,
    required this.doneTasks,
  });
}
