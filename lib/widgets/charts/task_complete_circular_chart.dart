import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskCompleteCircularChart extends StatelessWidget {
  const TaskCompleteCircularChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 25.0,
      lineWidth: 6.0,
      // animation: true,
      percent: 0.27,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        " 25%",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
      ),
      backgroundColor: const Color(0xFFB8C7CB).withOpacity(0.4),
      progressColor: Colors.lightGreen,
    );
  }
}
