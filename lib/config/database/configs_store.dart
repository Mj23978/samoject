import 'package:samoject/objectbox.g.dart';
import 'package:uuid/uuid.dart';

import '../../models/configs/configs.dart';
import '../../models/project/project.dart';
import '../../models/space/space.dart';
import '../../models/task/task.dart';
import '../../models/task_details/task_details.dart';
import '../../models/task_status/task_status.dart';
import '../../models/user/user.dart';
import '../../models/workspace/workspace.dart';
import '../../objectbox.g.dart';

class ConfigsStore {
  late final Store store;

  late final Box<AppConfigs> configBox;
  late final Box<Task> taskBox;
  late final Box<TaskDetails> taskDetailsBox;
  late final Box<User> userBox;
  late final Box<Space> spaceBox;
  late final Box<Workspace> workspaceBox;
  late final Box<Project> projectBox;
  late final Box<ProjectSettings> projectSettingsBox;
  late AppConfigs configs;

  ConfigsStore._create(this.store) {
    configBox = Box<AppConfigs>(store);
    taskBox = Box<Task>(store);
    taskDetailsBox = Box<TaskDetails>(store);
    userBox = Box<User>(store);
    spaceBox = Box<Space>(store);
    workspaceBox = Box<Workspace>(store);
    projectBox = Box<Project>(store);
    projectSettingsBox = Box<ProjectSettings>(store);

    if (configBox.count() > 0) {
      configs = configBox.getAll()[0];
    } else {
      configs = AppConfigs(me: ToOne<User>());
      configBox.put(configs);
    }
  }

  static Future<ConfigsStore> create() async {
    final store = await openStore();
    return ConfigsStore._create(store);
  }

  int addMe(User me) {
    userBox.put(me);
    configs = configBox.get(configs.oid) ?? configs;
    configs.me.target = me;
    return configBox.put(configs);
  }

  User? getMe() {
    return configs.me.target;
  }

  int? showSplashed() {
    configs = configBox.get(configs.oid) ?? configs;
    configs.showSplash = true;
    return configBox.put(configs);
  }

  bool getSplash() {
    configs = configBox.get(configs.oid) ?? configs;
    return configs.showSplash;
  }

    init() {
    var changed = false;
    if (workspaceBox.getAll().isEmpty) {
      _addWorkspace();
      changed = true;
    }
    if (projectBox.getAll().isEmpty) {
      _addProject();
      changed = true;
    }
    if (spaceBox.getAll().isEmpty) {
      _addSpaces();
      changed = true;
    }
    if (userBox.getAll().isEmpty) {
      _addUsers();
      changed = true;
    }
    if (taskBox.getAll().isEmpty) {
      _addTasks();
      changed = true;
    }
    if (changed) {
      _relateData();
    }
  }

  _addUsers() {
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
    userBox.putMany([morteza, moslem, shahraki, mobin, hoji, mj]);
    print(mj);
  }

  _addWorkspace() {
    Workspace myWorkspace = Workspace(
      id: Uuid().v4(),
      name: "Samoject Workspace",
      projects: ToMany(),
      belongsTo: ToOne(),
    );
    workspaceBox.put(myWorkspace);
  }

  _addProject() {
    ProjectSettings samojectSettings = ProjectSettings(id: Uuid().v4());
    projectSettingsBox.put(samojectSettings);

    Project samojectProj = Project(
      id: Uuid().v4(),
      workspaceId: ToOne(),
      name: "Samoject Project",
      settings: ToOne(),
      spaces: ToMany(),
      tasks: ToMany(),
      users: ToMany(),
    );

    projectBox.put(samojectProj);
  }

  _addSpaces() {
    SpaceBox mjBoard = SpaceBox(
      id: Uuid().v4(),
      name: 'Board',
      projectId: ToOne(),
      settings: ToOne(target: SpaceSettingsBox()),
      view: ToOne(target: SpaceViewBox()),
      subSpaces: ToMany(),
    );

    SpaceBox mjList = SpaceBox(
      id: Uuid().v4(),
      name: 'List',
      projectId: ToOne(),
      settings: ToOne(target: SpaceSettingsBox()),
      view: ToOne(target: SpaceViewBox()),
      subSpaces: ToMany(),
    );

    SpaceBox mjBox = SpaceBox(
      id: Uuid().v4(),
      name: 'Box',
      projectId: ToOne(),
      settings: ToOne(target: SpaceSettingsBox()),
      view: ToOne(target: SpaceViewBox()),
      subSpaces: ToMany(),
    );

    spaceBox.putMany([mjBoard, mjList, mjBox]);
  }

  _addTasks() {
    TaskDetails taskDetails1 = TaskDetails(id: Uuid().v4(), hash: 'hash');
    taskDetailsBox.put(taskDetails1);

    Task task1 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Recurring task: this task will restart when closed",
      status: ToOne(target: TaskStatus.todo()),
      taskDetailsId: ToOne(target: taskDetails1),
      assignesId: ToMany(),
      creatorId: ToOne(),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task2 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Hello, assigned comments",
      status: ToOne(target: TaskStatus.todo()),
      assignesId: ToMany(),
      creatorId: ToOne(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task3 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "This task is Complete",
      status: ToOne(target: TaskStatus.complete()),
      assignesId: ToMany(),
      creatorId: ToOne(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task4 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Linking tasks with other tasks",
      status: ToOne(target: TaskStatus.inProgress()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task5 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Smokes Ciggs",
      status: ToOne(target: TaskStatus.inProgress()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task6 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Bieng Old Friends",
      status: ToOne(target: TaskStatus.complete()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task7 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Named Soton Gang",
      status: ToOne(target: TaskStatus.complete()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task8 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Multitask Toolbar: Magicly Manage Task",
      status: ToOne(target: TaskStatus.todo()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task9 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Having same family name",
      status: ToOne(target: TaskStatus.complete()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task10 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "View All tasks in one view",
      status: ToOne(target: TaskStatus.todo()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task11 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Check out these checklists!",
      status: ToOne(target: TaskStatus.planned()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task12 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Sort and Filter your tasks",
      status: ToOne(target: TaskStatus.starting()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task13 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Add awesome integrations in samoject",
      status: ToOne(target: TaskStatus.todo()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task14 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Look at bottom of your screen! This task is in your Task Tray",
      status: ToOne(target: TaskStatus.todo()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task15 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Mobile Time Tracking",
      status: ToOne(target: TaskStatus.planned()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task16 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Mind Maps",
      status: ToOne(target: TaskStatus.planned()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task17 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Modal issue",
      status: ToOne(target: TaskStatus.inProgress()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task18 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Discord Integration",
      status: ToOne(target: TaskStatus.todo()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task19 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Improve Search",
      status: ToOne(target: TaskStatus.underReview()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task20 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Fix Sidebar issue",
      status: ToOne(target: TaskStatus.inProgress()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task21 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Add Resource Management",
      status: ToOne(target: TaskStatus.inProgress()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task22 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Create Docs and Dashboards Sections",
      status: ToOne(target: TaskStatus.todo()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task23 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Add Chat Capablities",
      status: ToOne(target: TaskStatus.idea()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task24 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Overhauled API",
      status: ToOne(target: TaskStatus.starting()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task25 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Translations and Localizations",
      status: ToOne(target: TaskStatus.complete()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task26 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Make responsive Views for all platforms",
      status: ToOne(target: TaskStatus.complete()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task27 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Firefox Integration Extension",
      status: ToOne(target: TaskStatus.todo()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task28 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Templates Marketplace",
      status: ToOne(target: TaskStatus.idea()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task29 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Mobile Inbox",
      status: ToOne(target: TaskStatus.planned()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task30 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "App Marketplace",
      status: ToOne(target: TaskStatus.idea()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task31 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Automation",
      status: ToOne(target: TaskStatus.starting()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task32 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Github & Gitlab Integration",
      status: ToOne(target: TaskStatus.todo()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task33 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Ride to Drink Creamlin !!",
      status: ToOne(target: TaskStatus.complete()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task34 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Put Kazemi in his own Gooni :)",
      status: ToOne(target: TaskStatus.todo()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task35 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Design Profiling",
      status: ToOne(target: TaskStatus.planned()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task36 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "ML Tools",
      status: ToOne(target: TaskStatus.idea()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task37 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Create Box View",
      status: ToOne(target: TaskStatus.complete()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task38 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Add Charts to Box View",
      status: ToOne(target: TaskStatus.complete()),
      creatorId: ToOne(),
      assignesId: ToMany(),
      taskDetailsId: ToOne(target: taskDetails1),
      taskDetailsHash: taskDetails1.hash,
      subTasks: ToMany(),
    );

    Task task39 = Task(
      projectId: ToOne(),
      id: Uuid().v4(),
      taskName: "Create Sample Data",
      status: ToOne(target: TaskStatus.complete()),
      creatorId: ToOne(),
      assignesId: ToMany(),
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

    taskBox.putMany(allTasks);
  }

  _relateData() {
    final workspaces = workspaceBox.getAll();
    final mainWorkspace = workspaces
        .firstWhere((element) => element.name == "Samoject Workspace");
    final projectSettings = projectSettingsBox.getAll().first;
    final projects = projectBox.getAll();
    final mainProject =
        projects.firstWhere((element) => element.name == "Samoject Project");
    final spaces = spaceBox.getAll();
    final users = userBox.getAll();
    final me = users.firstWhere((element) => element.username == "Mj78");
    final hoji = users.firstWhere((element) => element.username == "Hoji Joon");
    final mobin =
        users.firstWhere((element) => element.username == "Agha Zade");
    final shahraki = users.firstWhere((element) => element.username == "Soton");
    final moslem =
        users.firstWhere((element) => element.username == "Foundation");
    final morteza = users.firstWhere((element) => element.username == "Mori");

    final tasks = taskBox.getAll();
    for (var task in tasks) {
      task.projectId.target = mainProject;
    }
    final task1 = tasks[0];
    task1.assignesId.addAll([me]);
    task1.creatorId.target = moslem;
    final task2 = tasks[1];
    task2.assignesId.addAll([moslem, hoji]);
    task2.creatorId.target = me;
    final task3 = tasks[2];
    task3.assignesId.addAll([hoji, me]);
    task3.creatorId.target = shahraki;
    final task4 = tasks[3];
    task4.assignesId.addAll([morteza]);
    task4.creatorId.target = mobin;
    final task5 = tasks[4];
    task5.assignesId.addAll([]);
    task5.creatorId.target = moslem;
    final task6 = tasks[5];
    task6.assignesId.addAll([mobin]);
    task6.creatorId.target = shahraki;
    final task7 = tasks[6];
    task7.assignesId.addAll([shahraki]);
    task7.creatorId.target = me;
    final task8 = tasks[7];
    task8.assignesId.addAll([me]);
    task8.creatorId.target = moslem;
    final task9 = tasks[8];
    task9.assignesId.addAll([morteza]);
    task9.creatorId.target = me;
    final task10 = tasks[9];
    task10.assignesId.addAll([morteza, hoji]);
    task10.creatorId.target = hoji;
    final task11 = tasks[10];
    task11.assignesId.addAll([me, moslem, hoji]);
    task11.creatorId.target = mobin;
    final task12 = tasks[11];
    task12.assignesId.addAll([me]);
    task12.creatorId.target = moslem;
    final task13 = tasks[12];
    task13.assignesId.addAll([mobin]);
    task13.creatorId.target = shahraki;
    final task14 = tasks[13];
    task14.assignesId.addAll([me]);
    task14.creatorId.target = hoji;
    final task15 = tasks[14];
    task15.assignesId.addAll([me, moslem]);
    task15.creatorId.target = morteza;
    final task16 = tasks[15];
    task16.assignesId.addAll([morteza]);
    task16.creatorId.target = morteza;
    final task17 = tasks[16];
    task17.assignesId.addAll([hoji]);
    task17.creatorId.target = hoji;
    final task18 = tasks[17];
    task18.assignesId.addAll([morteza]);
    task18.creatorId.target = me;
    final task19 = tasks[18];
    task19.assignesId.addAll([me, mobin, hoji]);
    task19.creatorId.target = mobin;
    final task20 = tasks[19];
    task20.assignesId.addAll([mobin]);
    task20.creatorId.target = me;
    final task21 = tasks[20];
    task21.assignesId.addAll([hoji]);
    task21.creatorId.target = morteza;
    final task22 = tasks[21];
    task22.assignesId.addAll([hoji]);
    task22.creatorId.target = mobin;
    final task23 = tasks[22];
    task23.assignesId.addAll([shahraki, mobin]);
    task23.creatorId.target = hoji;
    final task24 = tasks[23];
    task24.assignesId.addAll([shahraki, moslem]);
    task24.creatorId.target = me;
    final task25 = tasks[24];
    task25.assignesId.addAll([mobin]);
    task25.creatorId.target = shahraki;
    final task26 = tasks[25];
    task26.assignesId.addAll([mobin]);
    task26.creatorId.target = moslem;
    final task27 = tasks[26];
    task27.assignesId.addAll([shahraki]);
    task27.creatorId.target = hoji;
    final task28 = tasks[27];
    task28.assignesId.addAll([shahraki]);
    task28.creatorId.target = morteza;
    final task29 = tasks[28];
    task29.assignesId.addAll([hoji]);
    task29.creatorId.target = moslem;
    final task30 = tasks[29];
    task30.assignesId.addAll([moslem]);
    task30.creatorId.target = hoji;
    final task31 = tasks[30];
    task31.assignesId.addAll([hoji]);
    task31.creatorId.target = me;
    final task32 = tasks[31];
    task32.assignesId.addAll([morteza]);
    task32.creatorId.target = mobin;
    final task33 = tasks[32];
    task33.assignesId.addAll([me, shahraki, mobin]);
    task33.creatorId.target = mobin;
    final task34 = tasks[33];
    task34.assignesId.addAll([me, shahraki]);
    task34.creatorId.target = moslem;
    final task35 = tasks[34];
    task35.assignesId.addAll([hoji]);
    task35.creatorId.target = me;
    final task36 = tasks[35];
    task36.assignesId.addAll([me]);
    task36.creatorId.target = hoji;
    final task37 = tasks[36];
    task37.assignesId.addAll([me]);
    task37.creatorId.target = moslem;
    final task38 = tasks[37];
    task38.assignesId.addAll([shahraki, morteza]);
    task38.creatorId.target = mobin;
    final task39 = tasks[38];
    task39.assignesId.addAll([moslem]);
    task39.creatorId.target = morteza;
    mainWorkspace.belongsTo.target = me;
    mainWorkspace.projects.add(mainProject);
    for (var user in userBox.getAll()) {
      user.createdTasks.addAll(tasks.where((task) {
        return task.creatorId.targetId == user.oid;
      }).toList());
      user.assignedTasks.addAll(tasks
          .where((value) => value.assignesId.any((us) => user.oid == us.oid))
          .toList());
      user.createdTasks.applyToDb();
      user.assignedTasks.applyToDb();
    }
    for (var space in spaces) {
      space.projectId.target = mainProject;
      spaceBox.put(space);
    }
    mainProject.settings.target = projectSettings;
    mainProject.workspaceId.target = mainWorkspace;
    mainProject.spaces.addAll(spaces);
    mainProject.tasks.addAll(taskBox.getAll());
    mainProject.users.addAll(userBox.getAll());
    for (var task in tasks) {
      taskBox.put(task);
    }
    for (var user in users) {
      userBox.put(user);
    }
    workspaceBox.put(mainWorkspace);
    projectBox.put(mainProject);
  }

  _clear() {
    userBox.removeAll();
    taskBox.removeAll();
    workspaceBox.removeAll();
    projectBox.removeAll();
    projectSettingsBox.removeAll();
    taskDetailsBox.removeAll();
    spaceBox.removeAll();
  }
}
