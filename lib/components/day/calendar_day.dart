import 'package:flutter/material.dart';
import 'package:lenses_calendar/model/date_handler.dart';

import 'day_cell.dart';
import 'wrappers/selected_day_wrapper.dart';

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
      child: DateTime(currentDate.year, currentDate.month, currentDate.day) ==
              date.date
          ? DayCell(
              date: date,
              size: 18,
              fontWeight: FontWeight.bold,
              onTapDaySelection: onTap,
            )
          : DayCell(
              date: date,
              onTapDaySelection: onTap,
            ),
    );
  }
}
