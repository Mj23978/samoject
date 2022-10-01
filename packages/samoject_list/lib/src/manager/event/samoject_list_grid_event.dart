import '../samoject_list_grid_state_manager.dart';

enum SamojectListGridEventType {
  normal,
  throttleTrailing,
  throttleLeading,
  debounce;

  bool get isNormal => this == SamojectListGridEventType.normal;

  bool get isThrottleTrailing =>
      this == SamojectListGridEventType.throttleTrailing;

  bool get isThrottleLeading =>
      this == SamojectListGridEventType.throttleLeading;

  bool get isDebounce => this == SamojectListGridEventType.debounce;
}

abstract class SamojectListGridEvent {
  SamojectListGridEvent({
    this.type = SamojectListGridEventType.normal,
    this.duration,
  }) : assert(
          type.isNormal || duration != null,
          'If type is normal or type is not normal then duration is required.',
        );

  final SamojectListGridEventType type;

  final Duration? duration;

  void handler(SamojectListGridStateManager stateManager);
}
