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
    int startYear = _currentDate.year - 1;

    // return ListView.builder(
    //   itemCount: _calendar.length,
    //   itemBuilder: (context, index) {
    //     return Container(
    //       child: Column(
    //         children: <Widget>[
    //           Center(
    //             child: Text(
    //               "${_monthNames[index % 12 + 1]}",
    //               style: TextStyle(
    //                 fontSize: 22,
    //                 color: Colors.white,
    //               ),
    //             ),
    //           ),
    //           CalendarBody(monthCalendar: _calendar[index]),
    //         ],
    //       ),
    //     );
    //   },
    // );

    // return ListView.builder(
    //   // // Add prev next and curr years to list
    //   // itemCount: 3 * monthAmount,
    //   reverse: true,
    //   itemBuilder: (context, index) {
    //     for (int i = 1; i <= monthAmount; i++) {
    //       _getCalendar(year: startYear + index, month: i);
    //       return Expanded(
    //         child: Column(
    //           children: <Widget>[
    //             Center(
    //               child: Text(
    //                 "${_monthNames[i]}, ${startYear + index}",
    //                 style: TextStyle(
    //                   fontSize: 22,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //             ),
    //             Flexible(
    //               child: CalendarBody(monthCalendar: _calendar[index]),
    //             ),
    //           ],
    //         ),
    //       );
    //     }
    //   },
    // );

    return Column(
      children: <Widget>[
        Center(
          child: Text(
            _monthNames[_currentDate.month],
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
        Flexible(
          child: CalendarBody(monthCalendar: _calendar[4]),
        ),
        // Flexible(
        //   child: CalendarBody(monthCalendar: _monthCalendar),
        // ),
      ],
    );
  }
}
