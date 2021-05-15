import 'package:flutter/material.dart';
import 'package:lenses_calendar/model/date_handler.dart';

import 'day/day_cell.dart';

class CalendarBody extends StatelessWidget {
  final List<DateHandler> monthCalendar;

  const CalendarBody({
    Key key,
    @required this.monthCalendar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: monthCalendar.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 1,
        crossAxisCount: 7,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return Center(
          child: DayCell(
            date: monthCalendar[index],
          ),
        );
      },
    );
  }
}
