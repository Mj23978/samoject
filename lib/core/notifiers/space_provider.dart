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
    spaceType = home.selectedSpace!.spaceType;
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
            .where((task) => task.status == TaskStatus.complete())
            .toList()
            .length,
      ));
    }
  }

  createLineData(User user) {
    final result = <TaskStatus, List<Task>>{};
    for (var task in user.assignedTasks) {
      if (result[task.status] == null) {
        result[task.status] = [];
      }
      result[task.status]!.add(task);
    }
    return result;
  }

  int sortStatus(TaskStatus status) {
    if (status == TaskStatus.todo()) {
      return 0;
    } else if (status == TaskStatus.idea()) {
      return 10;
    } else if (status == TaskStatus.planned()) {
      return 20;
    } else if (status == TaskStatus.starting()) {
      return 30;
    } else if (status == TaskStatus.inProgress()) {
      return 40;
    } else if (status == TaskStatus.underReview()) {
      return 50;
    } else if (status == TaskStatus.complete()) {
      return 60;
    } else {
      return 90;
    }
  }
}

class SpaceBoxTileData {
  final Map<TaskStatus, List<Task>> tasks;
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
