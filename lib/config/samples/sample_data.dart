import 'package:samoject/models/task/task.dart';
import 'package:samoject/models/task_status/task_status.dart';
import 'package:samoject/models/user/user.dart';
import 'package:uuid/uuid.dart';

import '../../models/task_details/task_details.dart';

User mj = User(
  id: Uuid().v4(),
  username: 'Mj78',
  roleName: "Developer",
  date: DateTime.now(),
);
User hoji = User(
  id: Uuid().v4(),
  username: 'Hojji Joon',
  roleName: "Developer",
  date: DateTime.now(),
);
User mobin = User(
  id: Uuid().v4(),
  username: 'Agha Zade',
  roleName: "Developer",
  date: DateTime.now(),
);
User shahraki = User(
    id: Uuid().v4(),
    username: 'Soton',
    roleName: "Developer",
    date: DateTime.now());
User moslem = User(
    id: Uuid().v4(),
    username: 'Foundation',
    roleName: "Project Owner",
    date: DateTime.now());
User morteza = User(
    id: Uuid().v4(),
    username: 'Mori',
    roleName: "Developer",
    date: DateTime.now());

TaskDetails taskDetails1 = TaskDetails(id: Uuid().v4(), hash: 'hash');

Task task1 = Task(
  id: Uuid().v4(),
  taskName: "Recurring task: this task will restart when closed",
  status: TaskStatus.todo(),
  taskDetailsId: taskDetails1.id,
  assignesId: [mj.id],
  creatorId: moslem.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task2 = Task(
  id: Uuid().v4(),
  taskName: "Hello, assigned comments",
  status: TaskStatus.todo(),
  assignesId: [moslem.id, hoji.id],
  creatorId: mj.id,
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task3 = Task(
  id: Uuid().v4(),
  taskName: "This task is Complete",
  status: TaskStatus.complete(),
  assignesId: [hoji.id, mj.id],
  creatorId: shahraki.id,
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task4 = Task(
  id: Uuid().v4(),
  taskName: "Linking tasks with other tasks",
  status: TaskStatus.inProgress(),
  creatorId: mobin.id,
  assignesId: [morteza.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task5 = Task(
  id: Uuid().v4(),
  taskName: "Smokes Ciggs",
  status: TaskStatus.inProgress(),
  creatorId: moslem.id,
  assignesId: [],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task6 = Task(
  id: Uuid().v4(),
  taskName: "Bieng Old Friends",
  status: TaskStatus.complete(),
  creatorId: shahraki.id,
  assignesId: [mobin.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task7 = Task(
  id: Uuid().v4(),
  taskName: "Named Soton Gang",
  status: TaskStatus.complete(),
  creatorId: mj.id,
  assignesId: [shahraki.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task8 = Task(
  id: Uuid().v4(),
  taskName: "Multitask Toolbar: Magicly Manage Task",
  status: TaskStatus.todo(),
  creatorId: mj.id,
  assignesId: [morteza.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task9 = Task(
  id: Uuid().v4(),
  taskName: "Having same family name",
  status: TaskStatus.todo(),
  creatorId: hoji.id,
  assignesId: [morteza.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task10 = Task(
  id: Uuid().v4(),
  taskName: "View All tasks in one view",
  status: TaskStatus.todo(),
  creatorId: hoji.id,
  assignesId: [morteza.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task11 = Task(
  id: Uuid().v4(),
  taskName: "Check out these checklists!",
  status: TaskStatus.planned(),
  creatorId: mobin.id,
  assignesId: [mj.id, moslem.id, hoji.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task12 = Task(
  id: Uuid().v4(),
  taskName: "Sort and Filter your tasks",
  status: TaskStatus.starting(),
  creatorId: moslem.id,
  assignesId: [mj.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task13 = Task(
  id: Uuid().v4(),
  taskName: "Add awesome integrations in samoject",
  status: TaskStatus.todo(),
  creatorId: shahraki.id,
  assignesId: [mobin.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task14 = Task(
  id: Uuid().v4(),
  taskName: "Look at bottom of your screen! This task is in your Task Tray",
  status: TaskStatus.todo(),
  creatorId: hoji.id,
  assignesId: [mj.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task15 = Task(
  id: Uuid().v4(),
  taskName: "Mobile Time Tracking",
  status: TaskStatus.planned(),
  creatorId: morteza.id,
  assignesId: [moslem.id, mj.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task16 = Task(
  id: Uuid().v4(),
  taskName: "Mind Maps",
  status: TaskStatus.planned(),
  creatorId: morteza.id,
  assignesId: [morteza.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task17 = Task(
  id: Uuid().v4(),
  taskName: "Modal issue",
  status: TaskStatus.inProgress(),
  creatorId: hoji.id,
  assignesId: [hoji.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task18 = Task(
  id: Uuid().v4(),
  taskName: "Discord Integration",
  status: TaskStatus.todo(),
  creatorId: mj.id,
  assignesId: [morteza.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task19 = Task(
  id: Uuid().v4(),
  taskName: "Improve Search",
  status: TaskStatus.underReview(),
  creatorId: mobin.id,
  assignesId: [mobin.id, shahraki.id, mj.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task20 = Task(
  id: Uuid().v4(),
  taskName: "Fix Sidebar issue",
  status: TaskStatus.inProgress(),
  creatorId: mj.id,
  assignesId: [mobin.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task21 = Task(
  id: Uuid().v4(),
  taskName: "Add Resource Management",
  status: TaskStatus.inProgress(),
  creatorId: morteza.id,
  assignesId: [hoji.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task22 = Task(
  id: Uuid().v4(),
  taskName: "Create Docs and Dashboards Sections",
  status: TaskStatus.todo(),
  creatorId: mobin.id,
  assignesId: [hoji.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task23 = Task(
  id: Uuid().v4(),
  taskName: "Add Chat Capablities",
  status: TaskStatus.idea(),
  creatorId: hoji.id,
  assignesId: [shahraki.id, mobin.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task24 = Task(
  id: Uuid().v4(),
  taskName: "Overhauled API",
  status: TaskStatus.starting(),
  creatorId: mj.id,
  assignesId: [shahraki.id, moslem.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task25 = Task(
  id: Uuid().v4(),
  taskName: "Translations and Localizations",
  status: TaskStatus.complete(),
  creatorId: shahraki.id,
  assignesId: [mobin.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task26 = Task(
  id: Uuid().v4(),
  taskName: "Make responsive Views for all platforms",
  status: TaskStatus.complete(),
  creatorId: moslem.id,
  assignesId: [mobin.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task27 = Task(
  id: Uuid().v4(),
  taskName: "Firefox Integration Extension",
  status: TaskStatus.todo(),
  creatorId: hoji.id,
  assignesId: [shahraki.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task28 = Task(
  id: Uuid().v4(),
  taskName: "Templates Marketplace",
  status: TaskStatus.idea(),
  creatorId: morteza.id,
  assignesId: [shahraki.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task29 = Task(
  id: Uuid().v4(),
  taskName: "Mobile Inbox",
  status: TaskStatus.planned(),
  creatorId: moslem.id,
  assignesId: [mj.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task30 = Task(
  id: Uuid().v4(),
  taskName: "App Marketplace",
  status: TaskStatus.idea(),
  creatorId: hoji.id,
  assignesId: [moslem.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task31 = Task(
  id: Uuid().v4(),
  taskName: "Automation",
  status: TaskStatus.starting(),
  creatorId: mj.id,
  assignesId: [mj.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task32 = Task(
  id: Uuid().v4(),
  taskName: "Github & Gitlab Integration",
  status: TaskStatus.todo(),
  creatorId: mobin.id,
  assignesId: [morteza.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task33 = Task(
  id: Uuid().v4(),
  taskName: "Ride to Drink Creamlin !!",
  status: TaskStatus.planned(),
  creatorId: mobin.id,
  assignesId: [mj.id, shahraki.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task34 = Task(
  id: Uuid().v4(),
  taskName: "Put Kazemi in his own Gooni :)",
  status: TaskStatus.todo(),
  creatorId: moslem.id,
  assignesId: [mj.id, shahraki.id, hoji.id, mobin.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task35 = Task(
  id: Uuid().v4(),
  taskName: "Design Profiling",
  status: TaskStatus.planned(),
  creatorId: mj.id,
  assignesId: [hoji.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task36 = Task(
  id: Uuid().v4(),
  taskName: "ML Tools",
  status: TaskStatus.idea(),
  creatorId: hoji.id,
  assignesId: [mj.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task37 = Task(
  id: Uuid().v4(),
  taskName: "Create Box View",
  status: TaskStatus.complete(),
  creatorId: moslem.id,
  assignesId: [mj.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task38 = Task(
  id: Uuid().v4(),
  taskName: "Add Charts to Box View",
  status: TaskStatus.complete(),
  creatorId: mobin.id,
  assignesId: [shahraki.id, morteza.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);

Task task39 = Task(
  id: Uuid().v4(),
  taskName: "Create Sample Data",
  status: TaskStatus.complete(),
  creatorId: morteza.id,
  assignesId: [moslem.id],
  taskDetailsId: taskDetails1.id,
  taskDetailsHash: taskDetails1.hash,
);
