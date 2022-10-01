import '../../helper/filter_helper.dart';
import '../../model/samoject_list_column.dart';
import '../../model/samoject_list_row.dart';
import '../../samoject_list_grid.dart';
import '../samoject_list_grid_state_manager.dart';
import 'samoject_list_grid_event.dart';

/// Event called when the value of the TextField
/// that handles the filter under the column changes.
class SamojectListGridChangeColumnFilterEvent extends SamojectListGridEvent {
  final SamojectListColumn column;
  final SamojectListFilterType filterType;
  final String filterValue;
  final int? debounceMilliseconds;

  SamojectListGridChangeColumnFilterEvent({
    required this.column,
    required this.filterType,
    required this.filterValue,
    this.debounceMilliseconds,
  }) : super(
          type: SamojectListGridEventType.debounce,
          duration: Duration(
            milliseconds: debounceMilliseconds == null
                ? SamojectListGridSettings.debounceMillisecondsForColumnFilter
                : debounceMilliseconds < 0
                    ? 0
                    : debounceMilliseconds,
          ),
        );

  List<SamojectListRow> _getFilterRows(
      SamojectListGridStateManager? stateManager) {
    List<SamojectListRow> foundFilterRows =
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
  void handler(SamojectListGridStateManager stateManager) {
    stateManager.setFilterWithFilterRows(_getFilterRows(stateManager));
  }
}
