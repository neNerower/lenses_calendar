import 'package:flutter/material.dart';
import 'package:lenses_calendar/constants/constants.dart';

class WeekDayTitle extends StatelessWidget {
  const WeekDayTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> titles = [];

    for (int i = 0; i < kWeekDays.length; i++) {
      titles.add(Text(
        kWeekDays[i],
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 12,
        ),
      ));
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: titles,
      ),
    );
  }
}
