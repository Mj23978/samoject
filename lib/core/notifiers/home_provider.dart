import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:samoject/objectbox.g.dart';
// import 'package:samoject_table/samoject_table.dart';
import 'package:uuid/uuid.dart';

import '../../models/favorites/favorites.dart';
import '../../models/space/space.dart';
import '../../widgets/buttons/space_menu_button.dart';
import 'app_provider.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider(this.appProvider);

  final AppProvider appProvider;

  final List<Space> spaces = [];
  Space? selectedSpace;

  final List<Favorites> favorites = [
    Favorites(name: 'Get to know clickup', id: Uuid().v4()),
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

  bool settingsSwitch = false;
  bool pinFavorites = true;

  initSpaces() {
    if (spaces.isEmpty) {
      spaces.addAll(appProvider.selectedProject!.spaces);
    }
    selectedSpace ??= spaces[0];
  }

  toggleSwitch(bool value) {
    settingsSwitch = value;
    notifyListeners();
  }

  togglePinFavorites() {
    pinFavorites = !pinFavorites;
    notifyListeners();
  }

  // setTableStateManager(SamojectTableGridStateManager sm) {
  //   stateManager = sm;
  //   notifyListeners();
  // }

  setPopupMenuItemsSwitch(List<SpaceMenuButton> items, int index, bool value) {
    items[index].switchValue = value;
    notifyListeners();
  }

  setPopupMenuItemsSelect(List<SpaceMenuButton> items, int index, bool value) {
    items[index].selectValue = value;
    notifyListeners();
  }

  onHoverView(String spaceName, bool value) {
    initSpaces();
    Space space = spaces.singleWhere(
      (element) =>
          element.map(
            (value) => value.name,
            box: (value) => value.name,
          ) ==
          spaceName,
    );
    Space newspace = space.map(
      (v) => v,
      box: (v) => v.copyWith(view: ToOne(target: v.view.target!.copyWith(onHovered: value))),
    );
    // spaces.remove(space);
    // spaces.add(newspace);
    notifyListeners();
  }

  onHoverFavorite(String favoriteName, bool value) {
    Favorites favorite =
        favorites.singleWhere((element) => element.name == favoriteName);
    favorite = favorite.copyWith(onHovered: value);
    notifyListeners();
  }

  onHoverSidebar(bool value) {
    sidebarHovered = value;
    notifyListeners();
  }

  onSelectView(String spaceName) {
    initSpaces();
    Space space = spaces.singleWhere(
      (element) =>
          element.map(
            (value) => value.name,
            box: (value) => value.name,
          ) ==
          spaceName,
    );
    Space newspace = space.copyWith(
      settings: ToOne(target: space.settings.target!.copyWith(selected: !space.settings.target!.selected)),
    );
    // spaces.remove(space);
    // spaces.add(newspace);
    selectedSpace = newspace;
    notifyListeners();
  }

  onTiltleHovered(bool value) {
    titleHovered = value;
    notifyListeners();
  }

  onSideSearchHovered(bool value) {
    sideSearchHovered = value;
    notifyListeners();
  }
}


// final List<SamojectTableColumn> columns = <SamojectTableColumn>[
//   SamojectTableColumn(
//     title: 'Id',
//     field: 'id',
//     type: SamojectTableColumnType.text(),
//   ),
//   SamojectTableColumn(
//     title: 'Name',
//     field: 'name',
//     type: SamojectTableColumnType.text(),
//   ),
//   SamojectTableColumn(
//     title: 'Age',
//     field: 'age',
//     type: SamojectTableColumnType.number(),
//   ),
//   SamojectTableColumn(
//     title: 'Role',
//     field: 'role',
//     type: SamojectTableColumnType.select(<String>[
//       'Programmer',
//       'Designer',
//       'Owner',
//     ]),
//   ),
//   SamojectTableColumn(
//     title: 'Joined',
//     field: 'joined',
//     type: SamojectTableColumnType.date(),
//   ),
//   SamojectTableColumn(
//     title: 'Working time',
//     field: 'working_time',
//     type: SamojectTableColumnType.time(),
//   ),
// ];

// final List<SamojectTableRow> rows = [
//   SamojectTableRow(
//     cells: {
//       'id': SamojectTableCell(value: 'user1'),
//       'name': SamojectTableCell(value: 'Mike'),
//       'age': SamojectTableCell(value: 20),
//       'role': SamojectTableCell(value: 'Programmer'),
//       'joined': SamojectTableCell(value: '2021-01-01'),
//       'working_time': SamojectTableCell(value: '09:00'),
//     },
//   ),
//   SamojectTableRow(
//     cells: {
//       'id': SamojectTableCell(value: 'user2'),
//       'name': SamojectTableCell(value: 'Jack'),
//       'age': SamojectTableCell(value: 25),
//       'role': SamojectTableCell(value: 'Designer'),
//       'joined': SamojectTableCell(value: '2021-02-01'),
//       'working_time': SamojectTableCell(value: '10:00'),
//     },
//   ),
//   SamojectTableRow(
//     cells: {
//       'id': SamojectTableCell(value: 'user3'),
//       'name': SamojectTableCell(value: 'Suzi'),
//       'age': SamojectTableCell(value: 40),
//       'role': SamojectTableCell(value: 'Owner'),
//       'joined': SamojectTableCell(value: '2021-03-01'),
//       'working_time': SamojectTableCell(value: '11:00'),
//     },
//   ),
// ];

// /// columnGroups that can group columns can be omitted.
// final List<SamojectTableColumnGroup> columnGroups = [
//   SamojectTableColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
//   SamojectTableColumnGroup(title: 'User information', fields: ['name', 'age']),
//   SamojectTableColumnGroup(title: 'Status', children: [
//     SamojectTableColumnGroup(
//         title: 'A', fields: ['role'], expandedColumn: true),
//     SamojectTableColumnGroup(title: 'Etc.', fields: ['joined', 'working_time']),
//   ]),
// ];

// /// [TableGridStateManager] has many methods and properties to dynamically manipulate the grid.
// /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
// late final SamojectTableGridStateManager stateManager;
