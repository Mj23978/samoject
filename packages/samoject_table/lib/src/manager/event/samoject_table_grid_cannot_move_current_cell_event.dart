import '../../helper/samoject_table_move_direction.dart';
import '../samoject_table_grid_state_manager.dart';
import 'samoject_table_grid_event.dart';

/// Occurs when the keyboard hits the end of the grid.
class SamojectTableGridCannotMoveCurrentCellEvent
    extends SamojectTableGridEvent {
  /// The position of the cell when it hits.
  final SamojectTableGridCellPosition cellPosition;

  /// The direction to move.
  final SamojectTableMoveDirection direction;

  SamojectTableGridCannotMoveCurrentCellEvent({
    required this.cellPosition,
    required this.direction,
  }) : super();

  @override
  void handler(SamojectTableGridStateManager stateManager) {}
}
