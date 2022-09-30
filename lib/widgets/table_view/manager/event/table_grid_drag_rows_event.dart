
import '../../model/table_row.dart';
import '../table_grid_state_manager.dart';
import 'table_grid_event.dart';

/// Event called when a row is dragged.
class TableGridDragRowsEvent extends TableGridEvent {
  final List<TableViewRow> rows;
  final int targetIdx;

  TableGridDragRowsEvent({
    required this.rows,
    required this.targetIdx,
  });

  @override
  void handler(TableGridStateManager stateManager) async {
    stateManager.moveRowsByIndex(
      rows,
      targetIdx,
    );
  }
}
