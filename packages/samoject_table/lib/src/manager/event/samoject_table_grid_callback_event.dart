import '../samoject_table_grid_state_manager.dart';
import 'samoject_table_grid_event.dart';

/// [callback] This is an event that calls the function.
/// Usually used to debounce and throttle a specific function.
class SamojectTableGridCallbackEvent extends SamojectTableGridEvent {
  SamojectTableGridCallbackEvent({
    required this.callback,
    super.type,
    super.duration,
  });

  final void Function() callback;

  @override
  void handler(SamojectTableGridStateManager stateManager) {
    callback();
  }
}
