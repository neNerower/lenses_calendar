import 'package:flutter/material.dart';
import 'package:lenses_calendar/model/calendar_model.dart';
import 'package:lenses_calendar/model/date_handler.dart';

import 'calendar_body.dart';

class CalendarView extends StatefulWidget {
  CalendarView({Key key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime _currentDate;
  DateTime _focusedDate;
  List<List<DateHandler>> _calendar = [];

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
    DateTime now = DateTime.now();
    _currentDate = now;
    _focusedDate = now;

    // Todo: Find some info
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() => _getCalendarForYear(now.year));
    });
  }

  // Get calendar for current year
  void _getCalendarForYear(int year) {
    for (int month = 1; month <= 12; month++) {
      _calendar.add(
        CalendarModel().getMonthCalendar(year: year, month: month),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int monthAmount = _monthNames.length;
    int startYear = _currentDate.year + 1;

    return Expanded(
      child: ListView.builder(
        reverse: true,
        itemBuilder: (context, index) {
          int year = startYear - index ~/ monthAmount;
          int month = monthAmount - index % monthAmount - 1;

          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                Center(
                  child: Text(
                    "${_monthNames[month]}, $year",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Flexible(
                  child: CalendarBody(monthCalendar: _calendar[month]),
                ),
                Divider(color: Colors.grey[400]),
              ],
            ),
          );
        },
      ),
    );
  }
}
