import '../../model/samoject_list_row.dart';
import '../samoject_list_grid_state_manager.dart';
import 'samoject_list_grid_event.dart';

/// Event called when a row is dragged.
class SamojectListGridDragRowsEvent extends SamojectListGridEvent {
  final List<SamojectListRow> rows;
  final int targetIdx;

  SamojectListGridDragRowsEvent({
    required this.rows,
    required this.targetIdx,
  });

  @override
  void handler(SamojectListGridStateManager stateManager) async {
    stateManager.moveRowsByIndex(
      rows,
      targetIdx,
    );
  }
}
