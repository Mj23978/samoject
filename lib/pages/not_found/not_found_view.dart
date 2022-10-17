import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/helpers.dart';

class NotFoundPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final beamingHistory = context.beamingHistory.reversed.toList();
    final lastPage = beamingHistory.length > 1 ? beamingHistory[1] : beamingHistory[0];
    final state = lastPage.state as BeamState;
    final retryCount = useState(0);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page Not Found',
                style: textStyle(context, 22, weight: FontWeight.w400)),
            const SizedBox(height: 25),
            ElevatedButton(
              child: Text(
                  'Back to ${state.uri}',
                  style: textStyle(context, 16, weight: FontWeight.w400)),
              onPressed: () {
                if (retryCount.value == 0) {
                  retryCount.value = retryCount.value + 1;
                  context.beamBack();
                } else {
                context.beamToNamed(
                  state.uri.path,
                  stacked: false,
                );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
