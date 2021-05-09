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
    //return ListView.builder(itemBuilder: (context, index) {});

    return Column(
      children: <Widget>[
        Center(
          child: Text(
            _monthNames[_focusedDate.month],
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
        Flexible(
          child: CalendarBody(monthCalendar: _monthCalendar),
        ),
        // Flexible(
        //   child: CalendarBody(monthCalendar: _monthCalendar),
        // ),
      ],
    );
  }
}
