import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:info_popup/info_popup.dart';
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
  bool sideSearchHovered = false;

  setTableStateManager(sm) {
    stateManager = sm;
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
