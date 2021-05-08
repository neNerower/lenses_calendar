import 'package:flutter/material.dart';

import 'calendar_body.dart';


class CalendarView extends StatelessWidget {
  const CalendarView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: CalendarBody(),
        ),
      ],
    );
  }
}