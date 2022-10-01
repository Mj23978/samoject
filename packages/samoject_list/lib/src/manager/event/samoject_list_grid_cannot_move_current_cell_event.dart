import '../../helper/samoject_list_move_direction.dart';
import '../samoject_list_grid_state_manager.dart';
import 'samoject_list_grid_event.dart';

/// Occurs when the keyboard hits the end of the grid.
class SamojectListGridCannotMoveCurrentCellEvent extends SamojectListGridEvent {
  /// The position of the cell when it hits.
  final SamojectListGridCellPosition cellPosition;

  /// The direction to move.
  final SamojectListMoveDirection direction;

  SamojectListGridCannotMoveCurrentCellEvent({
    required this.cellPosition,
    required this.direction,
  }) : super();

  @override
  void handler(SamojectListGridStateManager stateManager) {}
}
