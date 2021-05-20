import 'package:flutter/material.dart';
import 'package:lenses_calendar/model/date_handler.dart';

import 'current_day_cell.dart';
import 'day_cell.dart';
import 'selected_day_wrapper.dart';

class CalendarDay extends StatelessWidget {
  final DateHandler date;
  final DateTime currentDate;
  final DateTime selectedDate;
  final Function onTap;

  const CalendarDay({
    Key key,
    @required this.date,
    this.currentDate,
    this.selectedDate,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectedDayWrapper(
      isSelected: selectedDate == date.date,
      child: currentDate == date.date
          ? CurrentDayCell(
              date: date,
              onTap: onTap,
            )
          : DayCell(
              date: date,
              onTapDaySelection: onTap,
            ),
    );
  }
}
