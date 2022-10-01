import '../samoject_list_grid_state_manager.dart';
import 'samoject_list_grid_event.dart';

/// [callback] This is an event that calls the function.
/// Usually used to debounce and throttle a specific function.
class SamojectListGridCallbackEvent extends SamojectListGridEvent {
  SamojectListGridCallbackEvent({
    required this.callback,
    super.type,
    super.duration,
  });

  final void Function() callback;

  @override
  void handler(SamojectListGridStateManager stateManager) {
    callback();
  }
}
