import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:info_popup/info_popup.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:samoject_table/samoject_table.dart';

import '../../../utils/keys.dart';
import 'app_provider.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider(this._appProvider);

  final AppProvider _appProvider;
  Box conf = Hive.box(DBKeys.hive_config);

  final List<SamojectTableColumn> columns = <SamojectTableColumn>[
    SamojectTableColumn(
      title: 'Id',
      field: 'id',
      type: SamojectTableColumnType.text(),
    ),
    SamojectTableColumn(
      title: 'Name',
      field: 'name',
      type: SamojectTableColumnType.text(),
    ),
    SamojectTableColumn(
      title: 'Age',
      field: 'age',
      type: SamojectTableColumnType.number(),
    ),
    SamojectTableColumn(
      title: 'Role',
      field: 'role',
      type: SamojectTableColumnType.select(<String>[
        'Programmer',
        'Designer',
        'Owner',
      ]),
    ),
    SamojectTableColumn(
      title: 'Joined',
      field: 'joined',
      type: SamojectTableColumnType.date(),
    ),
    SamojectTableColumn(
      title: 'Working time',
      field: 'working_time',
      type: SamojectTableColumnType.time(),
    ),
  ];

  final List<SamojectTableRow> rows = [
    SamojectTableRow(
      cells: {
        'id': SamojectTableCell(value: 'user1'),
        'name': SamojectTableCell(value: 'Mike'),
        'age': SamojectTableCell(value: 20),
        'role': SamojectTableCell(value: 'Programmer'),
        'joined': SamojectTableCell(value: '2021-01-01'),
        'working_time': SamojectTableCell(value: '09:00'),
      },
    ),
    SamojectTableRow(
      cells: {
        'id': SamojectTableCell(value: 'user2'),
        'name': SamojectTableCell(value: 'Jack'),
        'age': SamojectTableCell(value: 25),
        'role': SamojectTableCell(value: 'Designer'),
        'joined': SamojectTableCell(value: '2021-02-01'),
        'working_time': SamojectTableCell(value: '10:00'),
      },
    ),
    SamojectTableRow(
      cells: {
        'id': SamojectTableCell(value: 'user3'),
        'name': SamojectTableCell(value: 'Suzi'),
        'age': SamojectTableCell(value: 40),
        'role': SamojectTableCell(value: 'Owner'),
        'joined': SamojectTableCell(value: '2021-03-01'),
        'working_time': SamojectTableCell(value: '11:00'),
      },
    ),
  ];

  /// columnGroups that can group columns can be omitted.
  final List<SamojectTableColumnGroup> columnGroups = [
    SamojectTableColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
    SamojectTableColumnGroup(
        title: 'User information', fields: ['name', 'age']),
    SamojectTableColumnGroup(title: 'Status', children: [
      SamojectTableColumnGroup(
          title: 'A', fields: ['role'], expandedColumn: true),
      SamojectTableColumnGroup(
          title: 'Etc.', fields: ['joined', 'working_time']),
    ]),
  ];

  /// [TableGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late final SamojectTableGridStateManager stateManager;

  InfoPopupController? infoPopupCustomWidgetController;

  final List<SpaceView> views = [
    SpaceView('List'),
    SpaceView('Board'),
    SpaceView('Box'),
    SpaceView('Calendar')
  ];

  final List<HomeFavorites> favorites = [
    HomeFavorites('Get to know clickup'),
  ];

  bool titleHovered = false;
  bool sidebarHovered = false;
  bool sideSearchHovered = false;
  JustTheController sidebarSettingsMenuController = JustTheController();
  JustTheController spaceTitleMoreController = JustTheController();
  JustTheController spaceActionTraySearchController = JustTheController();
  JustTheController spaceActionTraySortByController = JustTheController();
  JustTheController spaceActionTraySubtasksController = JustTheController();
  JustTheController spaceActionTrayShowController = JustTheController();
  JustTheController spaceActionTrayMoreController = JustTheController();
  JustTheController spaceActionTrayGroupbyController = JustTheController();

  List<AppPopupMenuItem> sidebarSettingsPopupItems = [
    AppPopupMenuItem(
      prefixWidgets: [
        Icon(Icons.archive_outlined, size: 15),
        SizedBox(width: 8),
        Text('Show Archived',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      prefixWidgets: [
        Icon(Icons.keyboard_arrow_up_rounded, size: 15),
        SizedBox(width: 8),
        Text('Collapse All Folders',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      prefixWidgets: [
        Icon(Icons.table_chart_outlined, size: 15),
        SizedBox(width: 8),
        Text('Layout Size & Style',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      prefixWidgets: [
        Icon(Icons.dark_mode_outlined, size: 15),
        SizedBox(width: 8),
        Text('Dark Side (bar)',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
      addSwitch: true,
    ),
  ];

  List<AppPopupMenuItem> spaceTitleMoreAction = [
    AppPopupMenuItem(
      prefixWidgets: [
        Icon(Icons.add, size: 15),
        SizedBox(width: 8),
        Text(
          'Create new',
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
      controller: JustTheController(),
      subItems: [
        AppPopupMenuItem(
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/list_add.svg',
              height: 18,
              width: 18,
              color: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              'List',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
          suffixWidgets: [],
        ),
        AppPopupMenuItem(
          section: 1,
          prefixWidgets: [
            SizedBox(width: 2),
            SvgPicture.asset(
              'assets/icons/add_document2.svg',
              height: 18,
              width: 18,
              color: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              'Doc',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
          suffixWidgets: [],
        ),
        AppPopupMenuItem(
          section: 1,
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/form_office.svg',
              height: 20,
              width: 20,
              color: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              'Form',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
          suffixWidgets: [],
        ),
        AppPopupMenuItem(
          section: 1,
          isNew: true,
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/whiteboard2.svg',
              height: 20,
              width: 20,
              color: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              'Whiteboard',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
          suffixWidgets: [],
        ),
        AppPopupMenuItem(
          section: 2,
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/folder_add2.svg',
              height: 18,
              width: 18,
              color: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              'Folder',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
          suffixWidgets: [],
        ),
        AppPopupMenuItem(
          section: 3,
          prefixWidgets: [
            Icon(FontAwesomeIcons.wandMagicSparkles, size: 16),
            SizedBox(width: 10),
            Text(
              'From Template',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
          suffixWidgets: [],
        ),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      prefixWidgets: [
        Icon(Icons.edit, size: 18),
        SizedBox(width: 8),
        Text(
          'Rename',
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      prefixWidgets: [
        Icon(Icons.water_drop_outlined, size: 18),
        SizedBox(width: 8),
        Text(
          'Color & Avatar',
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      prefixWidgets: [
        Icon(Icons.link, size: 18),
        SizedBox(width: 8),
        Text(
          "Copy Link",
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      prefixWidgets: [
        Icon(Icons.copy, size: 18),
        SizedBox(width: 8),
        Text(
          "Duplicate",
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      prefixWidgets: [
        Icon(Icons.star_outline, size: 18),
        SizedBox(width: 8),
        Text(
          "Add to Favorites",
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      prefixWidgets: [
        Icon(FontAwesomeIcons.eyeSlash, size: 14),
        SizedBox(width: 12),
        Text(
          "Hide in my sidebar",
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
        section: 2,
        prefixWidgets: [
          Icon(FontAwesomeIcons.wandMagicSparkles, size: 16),
          SizedBox(width: 10),
          Text(
            'Templates',
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
        controller: JustTheController(),
        suffixWidgets: [],
        subItemsHeader: "Templates",
        subItems: [
          AppPopupMenuItem(
            prefixWidgets: [
              Icon(Icons.table_chart_outlined, size: 18),
              SizedBox(width: 8),
              Text(
                'Browse Templates',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
            suffixWidgets: [],
          ),
          AppPopupMenuItem(
            prefixWidgets: [
              Icon(Icons.save_outlined, size: 18),
              SizedBox(width: 8),
              Text(
                'Save as Template',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
            suffixWidgets: [],
          ),
          AppPopupMenuItem(
            prefixWidgets: [
              Icon(Icons.sync_outlined, size: 18),
              SizedBox(width: 8),
              Text(
                'Update existing Template',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
            suffixWidgets: [],
          ),
        ]),
    AppPopupMenuItem(
      section: 2,
      prefixWidgets: [
        Icon(Icons.settings_outlined, size: 18),
        SizedBox(width: 8),
        Text(
          'More Seetings',
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
      controller: JustTheController(),
      subItems: [
        AppPopupMenuItem(
          prefixWidgets: [
            Icon(Icons.settings_outlined, size: 18),
            SizedBox(width: 8),
            Text(
              'All Space Seetings',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
        AppPopupMenuItem(
          section: 1,
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/robot_space.svg',
              height: 22,
              width: 22,
              color: Colors.blue,
            ),
            SizedBox(width: 6),
            Text(
              'Automations',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
        AppPopupMenuItem(
          section: 1,
          prefixWidgets: [
            SizedBox(width: 2),
            SvgPicture.asset(
              'assets/icons/edit_note.svg',
              height: 16,
              width: 16,
              color: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              'Custom Task Fields',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
        AppPopupMenuItem(
          section: 1,
          prefixWidgets: [
            SvgPicture.asset(
              'assets/icons/minus_square.svg',
              height: 18,
              width: 18,
              color: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              'Task statuses',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
        AppPopupMenuItem(
          section: 2,
          prefixWidgets: [
            Icon(
              Icons.sort_by_alpha_outlined,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              "Sort A to Z",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 3,
      prefixWidgets: [
        Icon(Icons.share_outlined, size: 18),
        SizedBox(width: 8),
        Text(
          'Sharing & Permission',
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 3,
      prefixWidgets: [
        Icon(Icons.archive_outlined, size: 18),
        SizedBox(width: 8),
        Text(
          "Archive",
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 3,
      prefixWidgets: [
        Icon(
          Icons.delete_outline_outlined,
          size: 18,
          color: Colors.red,
        ),
        SizedBox(width: 8),
        Text(
          "Delete",
          style: TextStyle(fontSize: 12, color: Colors.red),
        ),
      ],
      suffixWidgets: [],
    ),
  ];

  List<AppPopupMenuItem> spaceActionTraySearchAction = [
    AppPopupMenuItem(
      prefixWidgets: [
        Text('Task Name', style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
      addSwitch: true,
    ),
    AppPopupMenuItem(
      prefixWidgets: [
        Text('Task Description',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
      addSwitch: true,
    ),
    AppPopupMenuItem(
      prefixWidgets: [
        Text('Custom Fields',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
      addSwitch: true,
    ),
  ];

  List<AppPopupMenuItem> spaceActionTraySubtasksAction = [
    AppPopupMenuItem(
      addSelect: true,
      selectValue: true,
      prefixWidgets: [
        Text('Collapse All',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      addSelect: true,
      prefixWidgets: [
        Text('Expand All', style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      addSelect: true,
      prefixWidgets: [
        Text('As seprate tasks',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
  ];

  List<AppPopupMenuItem> spaceActionTraySortBy = [
    "Status",
    "Task Name",
    "Assigne",
    "Priority",
    "Due date",
    "Start date",
    "Date created",
    "Date updated",
    "Date closed",
    "Time tracked",
    "Time estimate"
  ]
      .map<AppPopupMenuItem>(
        (e) => AppPopupMenuItem(
          prefixWidgets: [
            Text(e, style: TextStyle(fontSize: 12, color: Colors.black))
          ],
        ),
      )
      .toList();

  List<AppPopupMenuItem> spaceActionTrayShowActions = [
    AppPopupMenuItem(
      addSwitch: true,
      prefixWidgets: [
        Text('Task Locations',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      addSwitch: true,
      prefixWidgets: [
        Text('Subtask pervent names',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      addSwitch: true,
      prefixWidgets: [
        Text('Closed subtasks',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      addSwitch: true,
      prefixWidgets: [
        Text("Show assignees",
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      addSwitch: true,
      prefixWidgets: [
        Text("Collapse empty columns",
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      addSwitch: true,
      prefixWidgets: [
        Text("Show images on cards",
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      addSwitch: true,
      prefixWidgets: [
        Text("Show task IDs",
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      addSwitch: true,
      prefixWidgets: [
        Text("Show time tracker",
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      addSwitch: true,
      prefixWidgets: [
        Text("Tasks in Multiple Lists",
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      prefixWidgets: [
        Text("Custom Fields",
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
  ];

  List<AppPopupMenuItem> spaceActionTrayMoreActions = [
    AppPopupMenuItem(
      addSwitch: true,
      prefixWidgets: [
        Icon(Icons.save_outlined, size: 20),
        SizedBox(
          width: 8,
        ),
        Text('Autosave view',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      addSwitch: true,
      prefixWidgets: [
        Icon(Icons.safety_check_outlined, size: 20),
        SizedBox(
          width: 8,
        ),
        Text('Protect view',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      addSwitch: true,
      prefixWidgets: [
        Icon(Icons.lock_outline, size: 20),
        SizedBox(
          width: 8,
        ),
        Text('Private view',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 1,
      addSwitch: true,
      prefixWidgets: [
        Icon(Icons.home_outlined, size: 20),
        SizedBox(
          width: 8,
        ),
        Text('Default for all',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      section: 2,
      prefixWidgets: [
        Icon(Icons.power_settings_new_outlined, size: 20),
        SizedBox(
          width: 8,
        ),
        Text('Reset view to Defaults',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
  ];

   List<AppPopupMenuItem> spaceActionTrayGroupbyActions = [
    AppPopupMenuItem(
      addSelect: true,
      selectValue: true,
      prefixWidgets: [
         SvgPicture.asset(
          'assets/icons/arrow_down_up.svg',
          height: 22,
          width: 22,
          color: Colors.blue,
        ),
        SizedBox(
          width: 8,
        ),
        Text('Status',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      addSelect: true,
      prefixWidgets: [
        Icon(Icons.people_outline, size: 20),
        SizedBox(
          width: 8,
        ),
        Text('Assignee',
            style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      addSelect: true,
      prefixWidgets: [
        Icon(FontAwesomeIcons.tags, size: 18),
        SizedBox(
          width: 8,
        ),
        Text('Tags', style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      addSelect: true,
      prefixWidgets: [
        Icon(Icons.calendar_today_outlined, size: 18),
        SizedBox(
          width: 8,
        ),
        Text('Due date', style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      addSelect: true,
      prefixWidgets: [
        Icon(FontAwesomeIcons.ban, size: 18),
        SizedBox(
          width: 8,
        ),
        Text('None', style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
      suffixWidgets: [],
    ),
    AppPopupMenuItem(
      prefixWidgets: [
        SizedBox(width: 2),
        SvgPicture.asset(
          'assets/icons/edit_note.svg',
          height: 16,
          width: 16,
          color: Colors.blue,
        ),
        SizedBox(width: 8),
        Text(
          'Custom Fields',
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
    ),
  ];

  bool settingsSwitch = false;

  toggleSwitch(value) {
    settingsSwitch = value;
    notifyListeners();
  }

  setTableStateManager(sm) {
    stateManager = sm;
    notifyListeners();
  }

  setPopupMenuItemsSwitch(List<AppPopupMenuItem> items, int index, bool value) {
    items[index].switchValue = value;
    notifyListeners();
  }

  setPopupMenuItemsSelect(List<AppPopupMenuItem> items, int index, bool value) {
    items[index].selectValue = value;
    notifyListeners();
  }

  setSearchMArrowController(controller) {
    infoPopupCustomWidgetController = controller;
    notifyListeners();
  }

  onHoverView(String viewName, bool value) {
    final view = views.singleWhere((element) => element.name == viewName);
    view.onHovered = value;
    notifyListeners();
  }

  onHoverFavorite(String favorite, bool value) {
    final view = favorites.singleWhere((element) => element.name == favorite);
    view.onHovered = value;
    notifyListeners();
  }

  onHoverSidebar(bool value) {
    sidebarHovered = value;
    notifyListeners();
  }

  onSelectView(String viewName) {
    final view = views.singleWhere((element) => element.name == viewName);
    view.selected = !view.selected;
    notifyListeners();
  }

  onTiltleHovered(value) {
    titleHovered = value;
    notifyListeners();
  }

  onSideSearchHovered(value) {
    sideSearchHovered = value;
    notifyListeners();
  }
}

class SpaceView {
  String name;
  bool onHovered;
  bool selected;

  SpaceView(
    this.name, {
    this.onHovered = false,
    this.selected = false,
  });
}

class HomeFavorites {
  String name;
  bool onHovered;

  HomeFavorites(
    this.name, {
    this.onHovered = false,
  });
}

class AppPopupMenuItem {
  List<Widget> suffixWidgets;
  List<Widget> prefixWidgets;
  JustTheController? controller;
  List<AppPopupMenuItem> subItems;
  String? subItemsHeader;
  bool addSwitch;
  bool addSelect;
  bool switchValue;
  bool selectValue;
  bool isNew;
  int section;

  AppPopupMenuItem({
    this.prefixWidgets = const [],
    this.suffixWidgets = const [],
    this.subItems = const [],
    this.addSwitch = false,
    this.addSelect = false,
    this.switchValue = false,
    this.selectValue = false,
    this.isNew = false,
    this.section = 0,
    this.controller,
    this.subItemsHeader,
  });
}
