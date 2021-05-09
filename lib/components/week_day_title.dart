import 'package:flutter/material.dart';

class WeekDayTitle extends StatelessWidget {
  const WeekDayTitle({Key key}) : super(key: key);

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

    List<Widget> titles = [];

    for (int i = 0; i < weekDays.length; i++) {
      titles.add(Text(weekDays[i],
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 12,
          )));
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: titles,
      ),
    );
  }
}
