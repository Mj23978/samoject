import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../manager/table_grid_state_manager.dart';
import '../model/table_cell.dart';
import '../model/table_column.dart';
import '../model/table_column_type.dart';
import '../model/table_row.dart';
import '../table_grid.dart';
import '../table_grid_configuration.dart';
import '../table_grid_popup.dart';
import 'filtered_list.dart';

typedef SetFilterPopupHandler = void Function(
    TableGridStateManager? stateManager);

class FilterHelper {
  /// A value to identify all column searches when searching filters.
  static const filterFieldAllColumns = 'tableFilterAllColumns';

  /// The field name of the column that includes the field values of the column
  /// when searching for a filter.
  static const filterFieldColumn = 'column';

  /// The field name of the column including the filter type
  /// when searching for a filter.
  static const filterFieldType = 'type';

  /// The field name of the column containing the value to be searched
  /// when searching for a filter.
  static const filterFieldValue = 'value';

  static const List<TableFilterType> defaultFilters = [
    TableFilterTypeContains(),
    TableFilterTypeEquals(),
    TableFilterTypeStartsWith(),
    TableFilterTypeEndsWith(),
    TableFilterTypeGreaterThan(),
    TableFilterTypeGreaterThanOrEqualTo(),
    TableFilterTypeLessThan(),
    TableFilterTypeLessThanOrEqualTo(),
  ];

  /// Create a row to contain filter information.
  static TableViewRow createFilterRow({
    String? columnField,
    TableFilterType? filterType,
    String? filterValue,
  }) {
    return TableViewRow(
      cells: {
        filterFieldColumn:
            TableViewCell(value: columnField ?? filterFieldAllColumns),
        filterFieldType:
            TableViewCell(value: filterType ?? const TableFilterTypeContains()),
        filterFieldValue: TableViewCell(value: filterValue ?? ''),
      },
    );
  }

  /// Converts rows containing filter information into comparison functions.
  static FilteredListFilter<TableViewRow?>? convertRowsToFilter(
    List<TableViewRow?> rows,
    List<TableViewColumn>? enabledFilterColumns,
  ) {
    if (rows.isEmpty) {
      return null;
    }

    return (TableViewRow? row) {
      bool? flag;

      for (var e in rows) {
        final filterType = e!.cells[filterFieldType]!.value as TableFilterType?;

        if (e.cells[filterFieldColumn]!.value == filterFieldAllColumns) {
          bool? flagAllColumns;

          row!.cells.forEach((key, value) {
            var foundColumn = enabledFilterColumns!.firstWhereOrNull(
              (element) => element.field == key,
            );

            if (foundColumn != null) {
              flagAllColumns = compareOr(
                flagAllColumns,
                compareByFilterType(
                  filterType: filterType!,
                  base: value.value.toString(),
                  search: e.cells[filterFieldValue]!.value.toString(),
                  column: foundColumn,
                ),
              );
            }
          });

          flag = compareAnd(flag, flagAllColumns);
        } else {
          var foundColumn = enabledFilterColumns!.firstWhereOrNull(
            (element) => element.field == e.cells[filterFieldColumn]!.value,
          );

          if (foundColumn != null) {
            flag = compareAnd(
              flag,
              compareByFilterType(
                filterType: filterType!,
                base: row!.cells[e.cells[filterFieldColumn]!.value]!.value
                    .toString(),
                search: e.cells[filterFieldValue]!.value.toString(),
                column: foundColumn,
              ),
            );
          }
        }
      }

      return flag == true;
    };
  }

  /// Whether [column] is included in [filteredRows].
  ///
  /// That is, check if it is a filtered column.
  /// If there is a search condition for all columns in [filteredRows],
  /// it is regarded as a filtering column.
  static bool isFilteredColumn(
    TableViewColumn column,
    List<TableViewRow?>? filteredRows,
  ) {
    if (filteredRows == null || filteredRows.isEmpty) {
      return false;
    }

    for (var row in filteredRows) {
      if (row!.cells[filterFieldColumn]!.value == filterFieldAllColumns ||
          row.cells[filterFieldColumn]!.value == column.field) {
        return true;
      }
    }

    return false;
  }

  /// Opens a pop-up for filtering.
  static void filterPopup(FilterPopupState popupState) {
    TableGridPopup(
      width: popupState.width,
      height: popupState.height,
      context: popupState.context,
      createHeader: popupState.createHeader,
      columns: popupState.makeColumns(),
      rows: popupState.filterRows,
      configuration: popupState.configuration,
      onLoaded: popupState.onLoaded,
      onChanged: popupState.onChanged,
      onSelected: popupState.onSelected,
      mode: TableGridMode.popup,
    );
  }

  /// 'or' comparison with null values
  static bool compareOr(bool? a, bool b) {
    return a != true ? a == true || b : true;
  }

  /// 'and' comparison with null values
  static bool? compareAnd(bool? a, bool? b) {
    return a != false ? b : false;
  }

  /// Compare [base] and [search] with [TableFilterType.compare].
  static bool compareByFilterType({
    required TableFilterType filterType,
    required String base,
    required String search,
    required TableViewColumn column,
  }) {
    bool compare = false;

    if (column.type is TableColumnTypeWithNumberFormat) {
      final numberColumn = column.type as TableColumnTypeWithNumberFormat;

      compare = compare ||
          filterType.compare(
            base: numberColumn.applyFormat(base),
            search: search,
            column: column,
          );

      search = search.replaceFirst(
        numberColumn.numberFormat.symbols.DECIMAL_SEP,
        '.',
      );
    }

    return compare ||
        filterType.compare(
          base: base,
          search: search,
          column: column,
        );
  }

  /// Whether [search] is contains in [base].
  static bool compareContains({
    required String? base,
    required String? search,
    required TableViewColumn column,
  }) {
    return _compareWithRegExp(
      RegExp.escape(search!),
      base!,
    );
  }

  /// Whether [search] is equals to [base].
  static bool compareEquals({
    required String? base,
    required String? search,
    required TableViewColumn column,
  }) {
    return _compareWithRegExp(
      // ignore: prefer_interpolation_to_compose_strings
      r'^' + RegExp.escape(search!) + r'$',
      base!,
    );
  }

  /// Whether [base] starts with [search].
  static bool compareStartsWith({
    required String? base,
    required String? search,
    required TableViewColumn column,
  }) {
    return _compareWithRegExp(
      // ignore: prefer_interpolation_to_compose_strings
      r'^' + RegExp.escape(search!),
      base!,
    );
  }

  /// Whether [base] ends with [search].
  static bool compareEndsWith({
    required String? base,
    required String? search,
    required TableViewColumn column,
  }) {
    return _compareWithRegExp(
      // ignore: prefer_interpolation_to_compose_strings
      RegExp.escape(search!) + r'$',
      base!,
    );
  }

  static bool compareGreaterThan({
    required String? base,
    required String? search,
    required TableViewColumn column,
  }) {
    return column.type.compare(base, search) == 1;
  }

  static bool compareGreaterThanOrEqualTo({
    required String? base,
    required String? search,
    required TableViewColumn column,
  }) {
    return column.type.compare(base, search) > -1;
  }

  static bool compareLessThan({
    required String? base,
    required String? search,
    required TableViewColumn column,
  }) {
    return column.type.compare(base, search) == -1;
  }

  static bool compareLessThanOrEqualTo({
    required String? base,
    required String? search,
    required TableViewColumn column,
  }) {
    return column.type.compare(base, search) < 1;
  }

  static bool _compareWithRegExp(
    String pattern,
    String value, {
    bool caseSensitive = false,
  }) {
    return RegExp(
      pattern,
      caseSensitive: caseSensitive,
    ).hasMatch(value);
  }
}

/// State for calling filter pop
class FilterPopupState {
  /// [BuildContext] for calling [showDialog]
  final BuildContext context;

  /// [TableGridConfiguration] to call [TableGridPopup]
  final TableGridConfiguration configuration;

  /// A callback function called when adding a new filter.
  final SetFilterPopupHandler handleAddNewFilter;

  /// A callback function called when filter information changes.
  final SetFilterPopupHandler handleApplyFilter;

  /// List of columns to be filtered.
  final List<TableViewColumn> columns;

  /// List with filtering condition information
  final List<TableViewRow> filterRows;

  /// The filter popup opens and focuses on the filter value in the first row.
  final bool focusFirstFilterValue;

  /// Width of filter popup
  final double width;

  /// Height of filter popup
  final double height;

  FilterPopupState({
    required this.context,
    required this.configuration,
    required this.handleAddNewFilter,
    required this.handleApplyFilter,
    required this.columns,
    required this.filterRows,
    required this.focusFirstFilterValue,
    this.width = 600,
    this.height = 450,
  })  : assert(columns.isNotEmpty),
        _previousFilterRows = [...filterRows];

  TableGridStateManager? _stateManager;
  List<TableViewRow?> _previousFilterRows;

  void onLoaded(TableGridOnLoadedEvent e) {
    _stateManager = e.stateManager;

    _stateManager!.setSelectingMode(TableGridSelectingMode.row, notify: false);

    if (_stateManager!.rows.isNotEmpty) {
      _stateManager!.setKeepFocus(true, notify: false);

      _stateManager!.setCurrentCell(
        _stateManager!.rows.first.cells[FilterHelper.filterFieldValue],
        0,
        notify: false,
      );

      if (focusFirstFilterValue) {
        _stateManager!.setEditing(true, notify: false);
      }
    }

    _stateManager!.notifyListeners();

    _stateManager!.addListener(stateListener);
  }

  void onChanged(TableGridOnChangedEvent e) {
    applyFilter();
  }

  void onSelected(TableGridOnSelectedEvent e) {
    _stateManager!.removeListener(stateListener);
  }

  void stateListener() {
    if (listEquals(_previousFilterRows, _stateManager!.rows) == false) {
      _previousFilterRows = [..._stateManager!.rows];
      applyFilter();
    }
  }

  void applyFilter() {
    handleApplyFilter(_stateManager);
  }

  TableGridFilterPopupHeader createHeader(TableGridStateManager stateManager) {
    return TableGridFilterPopupHeader(
      stateManager: stateManager,
      configuration: configuration,
      handleAddNewFilter: handleAddNewFilter,
    );
  }

  List<TableViewColumn> makeColumns() {
    return _makeFilterColumns(configuration: configuration, columns: columns);
  }

  Map<String, String> _makeFilterColumnMap({
    required TableGridConfiguration configuration,
    required List<TableViewColumn> columns,
  }) {
    Map<String, String> columnMap = {
      FilterHelper.filterFieldAllColumns:
          configuration.localeText.filterAllColumns,
    };

    columns.where((element) => element.enableFilterMenuItem).forEach((element) {
      columnMap[element.field] = element.titleWithGroup;
    });

    return columnMap;
  }

  List<TableViewColumn> _makeFilterColumns({
    required TableGridConfiguration configuration,
    required List<TableViewColumn> columns,
  }) {
    Map<String, String> columnMap = _makeFilterColumnMap(
      configuration: configuration,
      columns: columns,
    );

    return [
      TableViewColumn(
        title: configuration.localeText.filterColumn,
        field: FilterHelper.filterFieldColumn,
        type:
            TableViewColumnType.select(columnMap.keys.toList(growable: false)),
        enableFilterMenuItem: false,
        applyFormatterInEditing: true,
        formatter: (dynamic value) {
          return columnMap[value] ?? '';
        },
      ),
      TableViewColumn(
        title: configuration.localeText.filterType,
        field: FilterHelper.filterFieldType,
        type: TableViewColumnType.select(configuration.columnFilter.filters),
        enableFilterMenuItem: false,
        applyFormatterInEditing: true,
        formatter: (dynamic value) {
          return (value?.title ?? '').toString();
        },
      ),
      TableViewColumn(
        title: configuration.localeText.filterValue,
        field: FilterHelper.filterFieldValue,
        type: TableViewColumnType.text(),
        enableFilterMenuItem: false,
      ),
    ];
  }
}

class TableGridFilterPopupHeader extends StatelessWidget {
  final TableGridStateManager? stateManager;
  final TableGridConfiguration? configuration;
  final SetFilterPopupHandler? handleAddNewFilter;

  const TableGridFilterPopupHeader({
    Key? key,
    this.stateManager,
    this.configuration,
    this.handleAddNewFilter,
  }) : super(key: key);

  void handleAddButton() {
    handleAddNewFilter!(stateManager);
  }

  void handleRemoveButton() {
    if (stateManager!.currentSelectingRows.isEmpty) {
      stateManager!.removeCurrentRow();
    } else {
      stateManager!.removeRows(stateManager!.currentSelectingRows);
    }
  }

  void handleClearButton() {
    if (stateManager!.rows.isEmpty) {
      Navigator.of(stateManager!.gridFocusNode!.context!).pop();
    } else {
      stateManager!.removeRows(stateManager!.rows);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            color: configuration!.style.iconColor,
            iconSize: configuration!.style.iconSize,
            onPressed: handleAddButton,
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            color: configuration!.style.iconColor,
            iconSize: configuration!.style.iconSize,
            onPressed: handleRemoveButton,
          ),
          IconButton(
            icon: const Icon(Icons.clear_sharp),
            color: Colors.red,
            iconSize: configuration!.style.iconSize,
            onPressed: handleClearButton,
          ),
        ],
      ),
    );
  }
}

/// [base] is the cell values of the column on which the search is based.
/// [search] is the value entered by the user to search.
typedef TableCompareFunction = bool Function({
  required String? base,
  required String? search,
  required TableViewColumn column,
});

abstract class TableFilterType {
  String get title => throw UnimplementedError();

  TableCompareFunction get compare => throw UnimplementedError();
}

class TableFilterTypeContains implements TableFilterType {
  static String name = 'Contains';

  @override
  String get title => TableFilterTypeContains.name;

  @override
  TableCompareFunction get compare => FilterHelper.compareContains;

  const TableFilterTypeContains();
}

class TableFilterTypeEquals implements TableFilterType {
  static String name = 'Equals';

  @override
  String get title => TableFilterTypeEquals.name;

  @override
  TableCompareFunction get compare => FilterHelper.compareEquals;

  const TableFilterTypeEquals();
}

class TableFilterTypeStartsWith implements TableFilterType {
  static String name = 'Starts with';

  @override
  String get title => TableFilterTypeStartsWith.name;

  @override
  TableCompareFunction get compare => FilterHelper.compareStartsWith;

  const TableFilterTypeStartsWith();
}

class TableFilterTypeEndsWith implements TableFilterType {
  static String name = 'Ends with';

  @override
  String get title => TableFilterTypeEndsWith.name;

  @override
  TableCompareFunction get compare => FilterHelper.compareEndsWith;

  const TableFilterTypeEndsWith();
}

class TableFilterTypeGreaterThan implements TableFilterType {
  static String name = 'Greater than';

  @override
  String get title => TableFilterTypeGreaterThan.name;

  @override
  TableCompareFunction get compare => FilterHelper.compareGreaterThan;

  const TableFilterTypeGreaterThan();
}

class TableFilterTypeGreaterThanOrEqualTo implements TableFilterType {
  static String name = 'Greater than or equal to';

  @override
  String get title => TableFilterTypeGreaterThanOrEqualTo.name;

  @override
  TableCompareFunction get compare => FilterHelper.compareGreaterThanOrEqualTo;

  const TableFilterTypeGreaterThanOrEqualTo();
}

class TableFilterTypeLessThan implements TableFilterType {
  static String name = 'Less than';

  @override
  String get title => TableFilterTypeLessThan.name;

  @override
  TableCompareFunction get compare => FilterHelper.compareLessThan;

  const TableFilterTypeLessThan();
}

class TableFilterTypeLessThanOrEqualTo implements TableFilterType {
  static String name = 'Less than or equal to';

  @override
  String get title => TableFilterTypeLessThanOrEqualTo.name;

  @override
  TableCompareFunction get compare => FilterHelper.compareLessThanOrEqualTo;

  const TableFilterTypeLessThanOrEqualTo();
}
