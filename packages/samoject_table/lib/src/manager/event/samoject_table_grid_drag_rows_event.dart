import '../../model/samoject_table_row.dart';
import '../samoject_table_grid_state_manager.dart';
import 'samoject_table_grid_event.dart';

/// Event called when a row is dragged.
class SamojectTableGridDragRowsEvent extends SamojectTableGridEvent {
  final List<SamojectTableRow> rows;
  final int targetIdx;

  SamojectTableGridDragRowsEvent({
    required this.rows,
    required this.targetIdx,
  });

  @override
  void handler(SamojectTableGridStateManager stateManager) async {
    stateManager.moveRowsByIndex(
      rows,
      targetIdx,
    );
  }
}
