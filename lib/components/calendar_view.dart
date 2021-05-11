import 'package:flutter/material.dart';
import 'package:lenses_calendar/constants/constants.dart';
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
  List<List<DateHandler>> _calendar = [];
  ScrollController _controller;

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

    _controller = ScrollController(
        initialScrollOffset: kBlockHeight * (kMonthAmount * 2 - now.month));
    // _controller.addListener();

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

  void goToCurrentMonth() {
    _controller.jumpTo(kBlockHeight * (kMonthAmount * 2 - _currentDate.month));
  }

  @override
  Widget build(BuildContext context) {
    int startYear = _currentDate.year + 1;

    return ListView.builder(
      controller: _controller,
      reverse: true,
      itemBuilder: (context, index) {
        int year = startYear - index ~/ kMonthAmount;
        int month = kMonthAmount - index % kMonthAmount - 1;

        return Container(
          height: kBlockHeight,
          child: Column(
            children: <Widget>[
              Divider(color: Colors.grey[400]),
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
                // TODO: Fix one-year bug
                child: CalendarBody(monthCalendar: _calendar[month]),
              ),
            ],
          ),
        );
      },
    );
  }
}
