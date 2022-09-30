import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'event/table_grid_event.dart';
import 'table_grid_state_manager.dart';

class TableGridEventManager {
  final TableGridStateManager stateManager;

  TableGridEventManager({
    required this.stateManager,
  });

  final PublishSubject<TableGridEvent> _subject =
      PublishSubject<TableGridEvent>();

  PublishSubject<TableGridEvent> get subject => _subject;

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
            (_) => TimerStream<TableGridEvent>(_, _.duration as Duration),
            trailing: false,
            leading: true,
          ),
        );

    final throttleTrailingStream = _subject.stream
        .where((event) => event.type.isThrottleTrailing)
        .transform(
          ThrottleStreamTransformer(
            (_) => TimerStream<TableGridEvent>(_, _.duration as Duration),
            trailing: true,
            leading: false,
          ),
        );

    final debounceStream =
        _subject.stream.where((event) => event.type.isDebounce).transform(
              DebounceStreamTransformer(
                (_) => TimerStream<TableGridEvent>(_, _.duration as Duration),
              ),
            );

    _subscription = MergeStream([
      normalStream,
      throttleLeadingStream,
      throttleTrailingStream,
      debounceStream,
    ]).listen(_handler);
  }

  void addEvent(TableGridEvent event) {
    _subject.add(event);
  }

  StreamSubscription<TableGridEvent> listener(
    void Function(TableGridEvent event) onData,
  ) {
    return _subject.stream.listen(onData);
  }

  void _handler(TableGridEvent event) {
    event.handler(stateManager);
  }
}
