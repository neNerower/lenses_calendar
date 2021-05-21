import 'package:flutter/material.dart';
import 'package:lenses_calendar/model/date_handler.dart';

import 'day_cell.dart';
import 'wrappers/period_day_wrapper.dart';
import 'wrappers/selected_day_wrapper.dart';

class CalendarDay extends StatelessWidget {
  final DateHandler dateHandler;
  final DateTime currentDate;
  final DateTime selectedDate;
  final Function onTap;

  const CalendarDay({
    Key key,
    @required this.dateHandler,
    this.currentDate,
    this.selectedDate,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectedDayWrapper(
      isSelected: selectedDate == dateHandler.date,
      child: PeriodDayWrapper(
        color: Colors.red,
        child: DateTime(currentDate.year, currentDate.month, currentDate.day) ==
                dateHandler.date
            ? DayCell(
                date: dateHandler.date,
                size: 18,
                fontWeight: FontWeight.bold,
                onTapDaySelection: onTap,
              )
            : DayCell(
                date: dateHandler.date,
                onTapDaySelection: onTap,
              ),
      ),
    );
  }
}
