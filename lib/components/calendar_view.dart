import 'package:flutter/material.dart';
import 'package:lenses_calendar/constants/constants.dart';
import 'package:lenses_calendar/model/calendar_model.dart';
import 'package:lenses_calendar/model/date_handler.dart';

import 'calendar_body.dart';

class CalendarView extends StatefulWidget {
  final ScrollController controller;

  const CalendarView({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime _currentDate;
  DateTime _selectedDate;

  @override
  void initState() { 
    super.initState();

    DateTime now = DateTime.now();
    _currentDate = DateTime(now.year, now.month, now.day);
  }

  List<DateHandler> _getCalendarForMonth(int year, int month) {
    CalendarModel calendarModel = CalendarModel(
      currentDate: _currentDate,
      selectedDate: _selectedDate,
    );
    return calendarModel.getMonthCalendar(year: year, month: month);
  }

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    int startYear = DateTime.now().year + 1;

    return ListView.builder(
      controller: widget.controller,
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
                onDayTap: _selectDate,
              ),
            ),
          ],
        );
      },
    );
  }
}

