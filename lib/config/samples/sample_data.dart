import 'package:samoject/objectbox.g.dart';
import 'package:uuid/uuid.dart';

import '../../models/project/project.dart';
import '../../models/space/space.dart';
import '../../models/task/task.dart';
import '../../models/task_details/task_details.dart';
import '../../models/task_status/task_status.dart';
import '../../models/user/user.dart';
import '../../models/workspace/workspace.dart';

Workspace myWorkspace = Workspace(
  id: Uuid().v4(),
  name: "Samoject Workspace",
  projects: ToMany(items: [samojectProj]),
  belongsTo: ToOne(target:  mj),
);

ProjectSettings samojectSettings = ProjectSettings(id: Uuid().v4());
String _projId = Uuid().v4();
Project samojectProj = Project(
  id: _projId,
  workspaceId: ToOne(target: myWorkspace),
  name: "Samoject Project",
  settings: ToOne(target: samojectSettings),
  spaces: ToMany(items: [mjBox, mjBoard, mjList]),
  tasks: ToMany(items: allTasks.where((element) => element.projectId == _projId).toList()),
  users: ToMany(items:  [mj, hoji, mobin, shahraki, moslem, morteza]
      .map<User>(setUserData)
      .toList()),
);

SpaceBox mjBoard = SpaceBox(
  id: Uuid().v4(),
  name: 'Board',
  projectId: ToOne(target: samojectProj),
  settings: ToOne(target: SpaceSettingsBox()),
  view: ToOne(target: SpaceViewBox()),
  subSpaces: ToMany(),
);

SpaceBox mjList = SpaceBox(
  id: Uuid().v4(),
  name: 'List',
  projectId: ToOne(target: samojectProj),
  settings: ToOne(target: SpaceSettingsBox()),
  view: ToOne(target: SpaceViewBox()),
  subSpaces: ToMany(),
);

SpaceBox mjBox = SpaceBox(
  id: Uuid().v4(),
  name: 'Box',
  projectId: ToOne(target: samojectProj),
  settings: ToOne(target: SpaceSettingsBox()),
  view: ToOne(target: SpaceViewBox()),
  subSpaces: ToMany(),
);

User mj = User(
  id: Uuid().v4(),
  username: 'Mj78',
  firstName: 'Mohammad Javad',
  lastName: 'Hosseini',
  roleName: "Developer",
  date: DateTime.now(),
  assignedTasks: ToMany(),
  comments: ToMany(),
  createdTasks: ToMany(),
  projects: ToMany(),  
);
User hoji = User(
  id: Uuid().v4(),
  username: 'Hoji Joon',
  firstName: "Hojjat",
  lastName: 'Atai',
  roleName: "Developer",
  date: DateTime.now(),
  assignedTasks: ToMany(),
  comments: ToMany(),
  createdTasks: ToMany(),
  projects: ToMany(),  
);
User mobin = User(
  id: Uuid().v4(),
  username: 'Agha Zade',
    firstName: "Mobin",
  lastName: "Monavari",
  roleName: "Developer",
  date: DateTime.now(),
  assignedTasks: ToMany(),
  comments: ToMany(),
  createdTasks: ToMany(),
  projects: ToMany(),  
);
User shahraki = User(
  id: Uuid().v4(),
  username: 'Soton',
    firstName: "Amirhossein",
  lastName: 'Shahraki',
  roleName: "Developer",
  date: DateTime.now(),
  assignedTasks: ToMany(),
  comments: ToMany(),
  createdTasks: ToMany(),
  projects: ToMany(),  
);
User moslem = User(
  id: Uuid().v4(),
  username: 'Foundation',
    firstName: 'Moslem',
  lastName: 'Babae',
  roleName: "Project Owner",
  date: DateTime.now(),
  assignedTasks: ToMany(),
  comments: ToMany(),
  createdTasks: ToMany(),
  projects: ToMany(),  
);
User morteza = User(
  id: Uuid().v4(),
  username: 'Mori',
    firstName: 'Morteza',
  lastName: 'Atai',
  roleName: "Developer",
  date: DateTime.now(),
  assignedTasks: ToMany(),
  comments: ToMany(),
  createdTasks: ToMany(),
  projects: ToMany(),  
);

TaskDetails taskDetails1 = TaskDetails(id: Uuid().v4(), hash: 'hash');

Task task1 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Recurring task: this task will restart when closed",
  status: ToOne(target:  TaskStatus.todo()),
  taskDetailsId: ToOne(target: taskDetails1),
  assignesId: ToMany(items: [mj]),
  creatorId: ToOne(target: moslem),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task2 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Hello, assigned comments",
  status: ToOne(target:  TaskStatus.todo()),
  assignesId: ToMany(items: [moslem, hoji]),
  creatorId: ToOne(target: mj),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task3 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "This task is Complete",
  status: ToOne(target:  TaskStatus.complete()),
  assignesId: ToMany(items: [hoji, mj]),
  creatorId: ToOne(target: shahraki),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task4 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Linking tasks with other tasks",
  status: ToOne(target:  TaskStatus.inProgress()),
  creatorId: ToOne(target: mobin),
  assignesId: ToMany(items: [morteza]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task5 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Smokes Ciggs",
  status: ToOne(target:  TaskStatus.inProgress()),
  creatorId: ToOne(target: moslem),
  assignesId: ToMany(items: []),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task6 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Bieng Old Friends",
  status: ToOne(target:  TaskStatus.complete()),
  creatorId: ToOne(target: shahraki),
  assignesId: ToMany(items: [mobin]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task7 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Named Soton Gang",
  status: ToOne(target:  TaskStatus.complete()),
  creatorId: ToOne(target: mj),
  assignesId: ToMany(items: [shahraki]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task8 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Multitask Toolbar: Magicly Manage Task",
  status: ToOne(target:  TaskStatus.todo()),
  creatorId: ToOne(target: mj),
  assignesId: ToMany(items: [morteza]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task9 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Having same family name",
  status: ToOne(target:  TaskStatus.complete()),
  creatorId: ToOne(target: hoji),
  assignesId: ToMany(items: [morteza, hoji]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task10 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "View All tasks in one view",
  status: ToOne(target:  TaskStatus.todo()),
  creatorId: ToOne(target: hoji),
  assignesId: ToMany(items: [morteza]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task11 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Check out these checklists!",
  status: ToOne(target:  TaskStatus.planned()),
  creatorId: ToOne(target: mobin),
  assignesId: ToMany(items: [mj, moslem, hoji]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task12 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Sort and Filter your tasks",
  status: ToOne(target:  TaskStatus.starting()),
  creatorId: ToOne(target: moslem),
  assignesId: ToMany(items: [mj]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task13 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Add awesome integrations in samoject",
  status: ToOne(target:  TaskStatus.todo()),
  creatorId: ToOne(target: shahraki),
  assignesId: ToMany(items: [mobin]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task14 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Look at bottom of your screen! This task is in your Task Tray",
  status: ToOne(target:  TaskStatus.todo()),
  creatorId: ToOne(target: hoji),
  assignesId: ToMany(items: [mj]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task15 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Mobile Time Tracking",
  status: ToOne(target:  TaskStatus.planned()),
  creatorId: ToOne(target: morteza),
  assignesId: ToMany(items: [moslem, mj]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task16 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Mind Maps",
  status: ToOne(target:  TaskStatus.planned()),
  creatorId: ToOne(target: morteza),
  assignesId: ToMany(items: [morteza]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task17 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Modal issue",
  status: ToOne(target:  TaskStatus.inProgress()),
  creatorId: ToOne(target: hoji),
  assignesId: ToMany(items: [hoji]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task18 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Discord Integration",
  status: ToOne(target:  TaskStatus.todo()),
  creatorId: ToOne(target: mj),
  assignesId: ToMany(items: [morteza]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task19 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Improve Search",
  status: ToOne(target:  TaskStatus.underReview()),
  creatorId: ToOne(target: mobin),
  assignesId: ToMany(items: [mobin, shahraki, mj]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task20 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Fix Sidebar issue",
  status: ToOne(target:  TaskStatus.inProgress()),
  creatorId: ToOne(target: mj),
  assignesId: ToMany(items: [mobin]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task21 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Add Resource Management",
  status: ToOne(target:  TaskStatus.inProgress()),
  creatorId: ToOne(target: morteza),
  assignesId: ToMany(items: [hoji]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task22 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Create Docs and Dashboards Sections",
  status: ToOne(target:  TaskStatus.todo()),
  creatorId: ToOne(target: mobin),
  assignesId: ToMany(items: [hoji]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task23 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Add Chat Capablities",
  status: ToOne(target:  TaskStatus.idea()),
  creatorId: ToOne(target: hoji),
  assignesId: ToMany(items: [shahraki, mobin]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task24 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Overhauled API",
  status: ToOne(target:  TaskStatus.starting()),
  creatorId: ToOne(target: mj),
  assignesId: ToMany(items: [shahraki, moslem]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task25 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Translations and Localizations",
  status: ToOne(target:  TaskStatus.complete()),
  creatorId: ToOne(target: shahraki),
  assignesId: ToMany(items: [mobin]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task26 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Make responsive Views for all platforms",
  status: ToOne(target:  TaskStatus.complete()),
  creatorId: ToOne(target: moslem),
  assignesId: ToMany(items: [mobin]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task27 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Firefox Integration Extension",
  status: ToOne(target:  TaskStatus.todo()),
  creatorId: ToOne(target: hoji),
  assignesId: ToMany(items: [shahraki]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task28 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Templates Marketplace",
  status: ToOne(target:  TaskStatus.idea()),
  creatorId: ToOne(target: morteza),
  assignesId: ToMany(items: [shahraki]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task29 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Mobile Inbox",
  status: ToOne(target:  TaskStatus.planned()),
  creatorId: ToOne(target: moslem),
  assignesId: ToMany(items: [mj]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task30 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "App Marketplace",
  status: ToOne(target:  TaskStatus.idea()),
  creatorId: ToOne(target: hoji),
  assignesId: ToMany(items: [moslem]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task31 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Automation",
  status: ToOne(target:  TaskStatus.starting()),
  creatorId: ToOne(target: mj),
  assignesId: ToMany(items: [mj]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task32 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Github & Gitlab Integration",
  status: ToOne(target:  TaskStatus.todo()),
  creatorId: ToOne(target: mobin),
  assignesId: ToMany(items: [morteza]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task33 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Ride to Drink Creamlin !!",
  status: ToOne(target:  TaskStatus.complete()),
  creatorId: ToOne(target: mobin),
  assignesId: ToMany(items: [mj, shahraki]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task34 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Put Kazemi in his own Gooni :)",
  status: ToOne(target:  TaskStatus.todo()),
  creatorId: ToOne(target: moslem),
  assignesId: ToMany(items: [mj, shahraki, hoji, mobin]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task35 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Design Profiling",
  status: ToOne(target:  TaskStatus.planned()),
  creatorId: ToOne(target: mj),
  assignesId: ToMany(items: [hoji]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task36 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "ML Tools",
  status: ToOne(target:  TaskStatus.idea()),
  creatorId: ToOne(target: hoji),
  assignesId: ToMany(items: [mj]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task37 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Create Box View",
  status: ToOne(target:  TaskStatus.complete()),
  creatorId: ToOne(target: moslem),
  assignesId: ToMany(items: [mj]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task38 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Add Charts to Box View",
  status: ToOne(target:  TaskStatus.complete()),
  creatorId: ToOne(target: mobin),
  assignesId: ToMany(items: [shahraki, morteza]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

Task task39 = Task(
  projectId: ToOne(target: samojectProj),
  id: Uuid().v4(),
  taskName: "Create Sample Data",
  status: ToOne(target:  TaskStatus.complete()),
  creatorId: ToOne(target: morteza),
  assignesId: ToMany(items: [moslem]),
  taskDetailsId: ToOne(target: taskDetails1),
  taskDetailsHash: taskDetails1.hash,
  subTasks: ToMany(),
);

final List<Task> allTasks = [
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

User setUserData(User user) {
  final createdTasks = allTasks.where((element) {
    return element.creatorId.targetId == user.oid;
  }).toList();
  final assignedTasks =
      allTasks.where((value) => value.assignesId.any((us) => user.oid == us.oid)).toList();
  user.createdTasks.addAll(createdTasks);
  user.createdTasks.applyToDb();
  user.assignedTasks.addAll(assignedTasks);
  user.assignedTasks.applyToDb();
  return user;
}
