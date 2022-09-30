
import '../../helper/table_move_direction.dart';
import '../table_grid_state_manager.dart';
import 'table_grid_event.dart';

/// Occurs when the keyboard hits the end of the grid.
class TableGridCannotMoveCurrentCellEvent extends TableGridEvent {
  /// The position of the cell when it hits.
  final TableGridCellPosition cellPosition;

  /// The direction to move.
  final TableMoveDirection direction;

  TableGridCannotMoveCurrentCellEvent({
    required this.cellPosition,
    required this.direction,
  }) : super();

  @override
  void handler(TableGridStateManager stateManager) {}
}
