import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskCompleteCircularChart extends StatelessWidget {
  final double percent;

  const TaskCompleteCircularChart({
    required this.percent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 25.0,
      lineWidth: 6.0,
      // animation: true,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        " ${(percent * 100).floor()}%",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
      ),
      backgroundColor: const Color(0xFFB8C7CB).withOpacity(0.4),
      progressColor: Colors.lightGreen,
    );
  }
}
