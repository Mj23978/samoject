import '../../helper/filter_helper.dart';
import '../../model/samoject_table_column.dart';
import '../../model/samoject_table_row.dart';
import '../../samoject_table_grid.dart';
import '../samoject_table_grid_state_manager.dart';
import 'samoject_table_grid_event.dart';

/// Event called when the value of the TextField
/// that handles the filter under the column changes.
class SamojectTableGridChangeColumnFilterEvent extends SamojectTableGridEvent {
  final SamojectTableColumn column;
  final SamojectTableFilterType filterType;
  final String filterValue;
  final int? debounceMilliseconds;

  SamojectTableGridChangeColumnFilterEvent({
    required this.column,
    required this.filterType,
    required this.filterValue,
    this.debounceMilliseconds,
  }) : super(
          type: SamojectTableGridEventType.debounce,
          duration: Duration(
            milliseconds: debounceMilliseconds == null
                ? SamojectTableGridSettings.debounceMillisecondsForColumnFilter
                : debounceMilliseconds < 0
                    ? 0
                    : debounceMilliseconds,
          ),
        );

  List<SamojectTableRow> _getFilterRows(
      SamojectTableGridStateManager? stateManager) {
    List<SamojectTableRow> foundFilterRows =
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
  void handler(SamojectTableGridStateManager stateManager) {
    stateManager.setFilterWithFilterRows(_getFilterRows(stateManager));
  }
}
