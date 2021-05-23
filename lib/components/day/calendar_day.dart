import 'package:flutter/material.dart';
import 'package:lenses_calendar/model/date_handler.dart';

import 'day_cell.dart';
import 'wrappers/change_day_wrapper.dart';
import 'wrappers/selected_day_wrapper.dart';

class CalendarDay extends StatelessWidget {
  final DateHandler dateHandler;
  final Function onTap;

  const CalendarDay({
    Key key,
    @required this.dateHandler,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectedDayWrapper(
      isSelected: dateHandler.isSelected,
      child: ChangeDayWrapper(
        color: Colors.red,
        isTimeToChange: dateHandler.isTimeToChange,
        child: dateHandler.isCurrent
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
