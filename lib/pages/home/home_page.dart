import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_uix/flutter_uix.dart';
import '../../widgets/table_view/table_view.dart';

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
  final List<TableViewColumn> columns = <TableViewColumn>[
    TableViewColumn(
      title: 'Id',
      field: 'id',
      type: TableViewColumnType.text(),
    ),
    TableViewColumn(
      title: 'Name',
      field: 'name',
      type: TableViewColumnType.text(),
    ),
    TableViewColumn(
      title: 'Age',
      field: 'age',
      type: TableViewColumnType.number(),
    ),
    TableViewColumn(
      title: 'Role',
      field: 'role',
      type: TableViewColumnType.select(<String>[
        'Programmer',
        'Designer',
        'Owner',
      ]),
    ),
    TableViewColumn(
      title: 'Joined',
      field: 'joined',
      type: TableViewColumnType.date(),
    ),
    TableViewColumn(
      title: 'Working time',
      field: 'working_time',
      type: TableViewColumnType.time(),
    ),
  ];

  final List<TableViewRow> rows = [
    TableViewRow(
      cells: {
        'id': TableViewCell(value: 'user1'),
        'name': TableViewCell(value: 'Mike'),
        'age': TableViewCell(value: 20),
        'role': TableViewCell(value: 'Programmer'),
        'joined': TableViewCell(value: '2021-01-01'),
        'working_time': TableViewCell(value: '09:00'),
      },
    ),
    TableViewRow(
      cells: {
        'id': TableViewCell(value: 'user2'),
        'name': TableViewCell(value: 'Jack'),
        'age': TableViewCell(value: 25),
        'role': TableViewCell(value: 'Designer'),
        'joined': TableViewCell(value: '2021-02-01'),
        'working_time': TableViewCell(value: '10:00'),
      },
    ),
    TableViewRow(
      cells: {
        'id': TableViewCell(value: 'user3'),
        'name': TableViewCell(value: 'Suzi'),
        'age': TableViewCell(value: 40),
        'role': TableViewCell(value: 'Owner'),
        'joined': TableViewCell(value: '2021-03-01'),
        'working_time': TableViewCell(value: '11:00'),
      },
    ),
  ];

  /// columnGroups that can group columns can be omitted.
  final List<TableViewColumnGroup> columnGroups = [
    TableViewColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
    TableViewColumnGroup(title: 'User information', fields: ['name', 'age']),
    TableViewColumnGroup(title: 'Status', children: [
      TableViewColumnGroup(title: 'A', fields: ['role'], expandedColumn: true),
      TableViewColumnGroup(title: 'Etc.', fields: ['joined', 'working_time']),
    ]),
  ];

  /// [TableGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late final TableGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                          child: TableGrid(
                            columns: columns,
                            rows: rows,
                            columnGroups: columnGroups,
                            onLoaded: (TableGridOnLoadedEvent event) {
                              stateManager = event.stateManager;
                            },
                            onChanged: (TableGridOnChangedEvent event) {
                              print(event);
                            },
                            configuration: const TableGridConfiguration(),
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
