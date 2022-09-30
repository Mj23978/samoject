import '../table_grid_state_manager.dart';
import 'table_grid_event.dart';

/// [callback] This is an event that calls the function.
/// Usually used to debounce and throttle a specific function.
class TableGridCallbackEvent extends TableGridEvent {
  TableGridCallbackEvent({
    required this.callback,
    super.type,
    super.duration,
  });

  final void Function() callback;

  @override
  void handler(TableGridStateManager stateManager) {
    callback();
  }
}
