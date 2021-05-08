import 'package:flutter/material.dart';
import 'package:lenses_calendar/model/calendar_model.dart';
import 'package:lenses_calendar/model/date_handler.dart';

import 'week_day_title.dart';

class CalendarBody extends StatefulWidget {
  CalendarBody({Key key}) : super(key: key);

  @override
  _CalendarBodyState createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  DateTime _focusedDate;
  List<DateHandler> _monthCalendar = [];

  final List<String> _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'Desember',
  ];

  @override
  void initState() {
    super.initState();
    _focusedDate = DateTime.now();

    // Todo: Find some info
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() => _getCalendar());
    });
  }

  // Get calendar for current month
  void _getCalendar() {
    _monthCalendar = CalendarModel().getMonthCalendar(
      year: _focusedDate.year,
      month: _focusedDate.month,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _monthCalendar.length + 7,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20,
        crossAxisCount: 7,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        if (index < 7) return WeekDayTitle(weekDayIndex: index);
        //if (_monthCalendar[index - 7].date = _selectedDate)
        //  return Selector(_monthCalendar[index - 7]);
        return InkWell(
          child: Text(
            '${_monthCalendar[index - 7].date.day}',
            style: TextStyle(color: Colors.white)
          ),
        );
      },
    );
  }
}
