import 'package:flutter/material.dart';

class WeekDayTitle extends StatelessWidget {
  final int weekDayIndex;

  const WeekDayTitle({
    Key key,
    this.weekDayIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> weekDays = [
      'MON',
      'TUE',
      'WED',
      'THU',
      'FRI',
      'SAT',
      'SUN',
    ];

    return Text(
      weekDays[weekDayIndex],
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 12,
      ),
    );
  }
}
