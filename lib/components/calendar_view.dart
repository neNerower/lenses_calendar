import 'package:flutter/material.dart';
import 'package:lenses_calendar/constants/constants.dart';
import 'package:lenses_calendar/model/calendar_model.dart';
import 'package:lenses_calendar/model/date_handler.dart';

import 'calendar_body.dart';

class CalendarView extends StatelessWidget {
  final ScrollController controller;
  final DateTime currentDate;
  final DateTime selectedDate;
  final Function onDayTap;

  const CalendarView({
    Key key,
    @required this.controller,
    this.currentDate,
    this.selectedDate,
    this.onDayTap,
  }) : super(key: key);

  List<DateHandler> _getCalendarForMonth(int year, int month) {
    return CalendarModel().getMonthCalendar(year: year, month: month);
  }

  @override
  Widget build(BuildContext context) {
    int startYear = DateTime.now().year + 1;

    return ListView.builder(
      controller: controller,
      reverse: true,
      itemExtent: kCalendarBodyHeight,
      itemBuilder: (context, index) {
        int year = startYear - index ~/ kMonthAmount;
        int month = kMonthAmount - index % kMonthAmount;

        return Column(
          children: <Widget>[
            Divider(color: Colors.grey[400]),
            SizedBox(height: 15),
            Center(
              child: Text(
                "${kMonthNames[month - 1]}" +
                    (startYear - year == 1 ? "" : ", $year"),
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 15),
            Flexible(
              child: CalendarBody(
                monthCalendar: _getCalendarForMonth(year, month),
                currentDate: currentDate,
                selectedDate: selectedDate,
                onDayTap: onDayTap,
              ),
            ),
          ],
        );
      },
    );
  }
}
