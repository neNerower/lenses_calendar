import 'package:flutter/material.dart';
import 'package:lenses_calendar/components/calendar_view.dart';
import 'package:lenses_calendar/components/week_day_title.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: WeekDayTitle(),
          preferredSize: Size.fromHeight(4),
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
        child: CalendarView(),
      ),
    );
  }
}
