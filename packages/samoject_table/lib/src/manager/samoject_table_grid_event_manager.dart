import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'event/samoject_table_grid_event.dart';
import 'samoject_table_grid_state_manager.dart';

class SamojectTableGridEventManager {
  final SamojectTableGridStateManager stateManager;

  SamojectTableGridEventManager({
    required this.stateManager,
  });

  final PublishSubject<SamojectTableGridEvent> _subject =
      PublishSubject<SamojectTableGridEvent>();

  PublishSubject<SamojectTableGridEvent> get subject => _subject;

  late final StreamSubscription _subscription;

  StreamSubscription get subscription => _subscription;

  void dispose() {
    _subscription.cancel();

    _subject.close();
  }

  void init() {
    final normalStream = _subject.stream.where((event) => event.type.isNormal);

    final throttleLeadingStream = _subject.stream
        .where((event) => event.type.isThrottleLeading)
        .transform(
          ThrottleStreamTransformer(
            (_) =>
                TimerStream<SamojectTableGridEvent>(_, _.duration as Duration),
            trailing: false,
            leading: true,
          ),
        );

    final throttleTrailingStream = _subject.stream
        .where((event) => event.type.isThrottleTrailing)
        .transform(
          ThrottleStreamTransformer(
            (_) =>
                TimerStream<SamojectTableGridEvent>(_, _.duration as Duration),
            trailing: true,
            leading: false,
          ),
        );

    final debounceStream = _subject.stream
        .where((event) => event.type.isDebounce)
        .transform(
          DebounceStreamTransformer(
            (_) =>
                TimerStream<SamojectTableGridEvent>(_, _.duration as Duration),
          ),
        );

    _subscription = MergeStream([
      normalStream,
      throttleLeadingStream,
      throttleTrailingStream,
      debounceStream,
    ]).listen(_handler);
  }

  void addEvent(SamojectTableGridEvent event) {
    _subject.add(event);
  }

  StreamSubscription<SamojectTableGridEvent> listener(
    void Function(SamojectTableGridEvent event) onData,
  ) {
    return _subject.stream.listen(onData);
  }

  void _handler(SamojectTableGridEvent event) {
    event.handler(stateManager);
  }
}
