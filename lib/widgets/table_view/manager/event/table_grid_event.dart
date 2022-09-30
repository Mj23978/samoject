
import '../table_grid_state_manager.dart';

enum TableGridEventType {
  normal,
  throttleTrailing,
  throttleLeading,
  debounce;

  bool get isNormal => this == TableGridEventType.normal;

  bool get isThrottleTrailing => this == TableGridEventType.throttleTrailing;

  bool get isThrottleLeading => this == TableGridEventType.throttleLeading;

  bool get isDebounce => this == TableGridEventType.debounce;
}

abstract class TableGridEvent {
  TableGridEvent({
    this.type = TableGridEventType.normal,
    this.duration,
  }) : assert(
          type.isNormal || duration != null,
          'If type is normal or type is not normal then duration is required.',
        );

  final TableGridEventType type;

  final Duration? duration;

  void handler(TableGridStateManager stateManager);
}
