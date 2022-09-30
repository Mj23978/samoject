
import '../../helper/filter_helper.dart';
import '../../model/table_column.dart';
import '../../model/table_row.dart';
import '../../table_grid.dart';
import '../table_grid_state_manager.dart';
import 'table_grid_event.dart';

/// Event called when the value of the TextField
/// that handles the filter under the column changes.
class TableGridChangeColumnFilterEvent extends TableGridEvent {
  final TableViewColumn column;
  final TableFilterType filterType;
  final String filterValue;
  final int? debounceMilliseconds;

  TableGridChangeColumnFilterEvent({
    required this.column,
    required this.filterType,
    required this.filterValue,
    this.debounceMilliseconds,
  }) : super(
          type: TableGridEventType.debounce,
          duration: Duration(
            milliseconds: debounceMilliseconds == null
                ? TableGridSettings.debounceMillisecondsForColumnFilter
                : debounceMilliseconds < 0
                    ? 0
                    : debounceMilliseconds,
          ),
        );

  List<TableViewRow> _getFilterRows(TableGridStateManager? stateManager) {
    List<TableViewRow> foundFilterRows =
        stateManager!.filterRowsByField(column.field);

    if (foundFilterRows.isEmpty) {
      return [
        ...stateManager.filterRows,
        FilterHelper.createFilterRow(
          columnField: column.field,
          filterType: filterType,
          filterValue: filterValue,
        ),
      ];
    }

    foundFilterRows.first.cells[FilterHelper.filterFieldValue]!.value =
        filterValue;

    return stateManager.filterRows;
  }

  @override
  void handler(TableGridStateManager stateManager) {
    stateManager.setFilterWithFilterRows(_getFilterRows(stateManager));
  }
}
