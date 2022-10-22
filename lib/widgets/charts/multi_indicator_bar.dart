import 'package:flutter/material.dart';

import '../overlays/menu_with_buttons.dart';

Widget createMultiIndicator(List<IndicatorData> percents) {
  percents.sort((a, b) => a.sortIndex.compareTo(b.sortIndex));
  double lastValue = 0;
  List<Widget> items = [];
  for (var progress in percents) {
    lastValue += progress.value;
    items.add(
      wrapWithTooltip(
        wrap: progress.description != null,
        description: progress.description ?? "",
        child: LinearProgressIndicator(
          value: lastValue,
          backgroundColor: lastValue > 0 ? Colors.transparent : null,
          color: progress.color,
        ),
      ),
    );
  }
  return Stack(
    children: items.reversed.toList(),
  );
}

class IndicatorData {
  final double value;
  final Color color;
  final int sortIndex;
  final String? description;

  IndicatorData(
    this.value,
    this.color, {
    this.description,
    this.sortIndex = 1000,
  });
}
