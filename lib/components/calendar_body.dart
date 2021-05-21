import 'package:flutter/material.dart';
import 'package:lenses_calendar/model/date_handler.dart';

import 'day/calendar_day.dart';

class CalendarBody extends StatelessWidget {
  final List<DateHandler> monthCalendar;
  final Function onDayTap;

  const CalendarBody({
    Key key,
    @required this.monthCalendar,
    this.onDayTap,
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
        return monthCalendar[index].isOtherMonth
            ? Center()
            : Center(
                child: CalendarDay(
                  dateHandler: monthCalendar[index],
                  onTap: onDayTap,
                ),
              );
      },
    );
  }
}
