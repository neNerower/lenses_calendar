import 'package:flutter/material.dart';
import 'package:lenses_calendar/model/date_handler.dart';

import 'day_cell.dart';

class CurrentDayCell extends StatelessWidget {
  final DateHandler date;
  final Function onTap;

  const CurrentDayCell({
    Key key,
    @required this.date,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DayCell(
      date: date,
      size: 18,
      fontWeight: FontWeight.bold,
      onTapDaySelection: onTap,
    );
  }
}
