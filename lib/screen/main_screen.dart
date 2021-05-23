import 'package:flutter/material.dart';
import 'package:lenses_calendar/components/calendar_view.dart';
import 'package:lenses_calendar/components/week_day_title.dart';
import 'package:lenses_calendar/constants/constants.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime _now;
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();

    _controller = ScrollController(
      initialScrollOffset:
          kCalendarBodyHeight * (kMonthAmount * 2 - _now.month),
    );
    // _controller.addListener();
  }

  void _goToCurrentMonth() {
    _controller.animateTo(
      kCalendarBodyHeight * (kMonthAmount * 2 - _now.month),
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.calendar_today,
              size: 22,
            ),
            tooltip: "Go to current date",
            // splashColor: Colors.transparent,
            splashRadius: 10,
            onPressed: () => _goToCurrentMonth(),
          ),
        ],
        bottom: PreferredSize(
          child: WeekDayTitle(),
          preferredSize: Size.fromHeight(10),
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
        child: CalendarView(
          controller: _controller,
        ),
      ),
    );
  }
}
