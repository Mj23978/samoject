import '../samoject_table_grid_state_manager.dart';

enum SamojectTableGridEventType {
  normal,
  throttleTrailing,
  throttleLeading,
  debounce;

  bool get isNormal => this == SamojectTableGridEventType.normal;

  bool get isThrottleTrailing =>
      this == SamojectTableGridEventType.throttleTrailing;

  bool get isThrottleLeading =>
      this == SamojectTableGridEventType.throttleLeading;

  bool get isDebounce => this == SamojectTableGridEventType.debounce;
}

abstract class SamojectTableGridEvent {
  SamojectTableGridEvent({
    this.type = SamojectTableGridEventType.normal,
    this.duration,
  }) : assert(
          type.isNormal || duration != null,
          'If type is normal or type is not normal then duration is required.',
        );

  final SamojectTableGridEventType type;

  final Duration? duration;

  void handler(SamojectTableGridStateManager stateManager);
}
