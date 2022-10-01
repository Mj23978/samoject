import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_uix/flutter_uix.dart';
import 'package:samoject_table/samoject_table.dart';

class HomeView extends ConsumerWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: TableGridExamplePage(),
    );
  }
}

class TableGridExamplePage extends StatefulWidget {
  const TableGridExamplePage({Key? key}) : super(key: key);

  @override
  State<TableGridExamplePage> createState() => _TableGridExamplePageState();
}

class _TableGridExamplePageState extends State<TableGridExamplePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (true)
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.red,
              ),
            ),
          Flexible(
            flex: 19,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          color: Colors.yellow,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          color: Colors.blue,
                        ),
                      ),
                      Flexible(
                        flex: 25,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: SamojectTableGrid(
                            columns: columns,
                            rows: rows,
                            // columnGroups: columnGroups,
                            onLoaded: (SamojectTableGridOnLoadedEvent event) {
                              stateManager = event.stateManager;
                            },
                            onChanged: (SamojectTableGridOnChangedEvent event) {
                              print(event);
                            },
                            configuration: const SamojectTableGridConfiguration(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
