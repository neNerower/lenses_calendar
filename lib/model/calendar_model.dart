import 'package:flutter/material.dart';
import 'package:lenses_calendar/constants/constants.dart';

import 'date_handler.dart';
import 'first_week_day.dart';

class CalendarModel {
  final DateTime currentDate;
  final DateTime selectedDate;
  final List<DateTime> changeDates;
  final FirstWeekDay firstWeekDay;

  CalendarModel({
    @required this.currentDate,
    @required this.selectedDate,
    this.changeDates, 
    this.firstWeekDay = FirstWeekDay.monday,
  });

  // Check for leap year
  bool _isLeapYear(int year) {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        if (year % 400 == 0) return true;
        return false;
      }
      return true;
    }
    return false;
  }

  // Get amount of days in processed month
  int _getDaysAmount(int year, int month) {
    int daysAmount = monthLengths[month - 1];
    // If this is a leap year and month is february
    if (_isLeapYear(year) && month == DateTime.february) daysAmount++;

    return daysAmount;
  }

  DateHandler _getDateHandler(
      {int year, int month, int day, bool isOtherMonth = false}) {
    DateTime date = DateTime(year, month, day);

    return DateHandler(
      date: date,
      isOtherMonth: isOtherMonth,
      isCurrent: currentDate == date,
      isSelected: selectedDate == date,
      isTimeToChange: changeDates.contains(date),
    );
  }

  // Get calendar by month
  List<DateHandler> getMonthCalendar({
    @required int year,
    @required int month,
  }) {
    // Check passing arguments
    if (year == null || month == null || month < 1 || month > 12)
      throw ArgumentError('Invalid year or month');

    List<DateHandler> calendar = [];

    // Get amount of days in processed month
    int daysAmount = _getDaysAmount(year, month);

    // Fill calendar month with dates
    for (int i = 0; i < daysAmount; i++) {
      calendar.add(
        _getDateHandler(year: year, month: month, day: i + 1),
      );
    }

    int otherYear;
    int otherMonth;
    int leftDays;

    // Fill unfilding starting week days
    if ((firstWeekDay == FirstWeekDay.monday &&
            calendar.first.date.weekday != DateTime.monday) ||
        (firstWeekDay == FirstWeekDay.sunday &&
            calendar.first.date.weekday != DateTime.sunday)) {
      //Get previous month and year
      if (month == DateTime.january) {
        otherYear = year - 1;
        otherMonth = DateTime.december;
      } else {
        otherYear = year;
        otherMonth = month - 1;
      }

      daysAmount = _getDaysAmount(otherYear, otherMonth);

      // Shift left days if first week day is monday
      leftDays = daysAmount -
          calendar.first.date.weekday +
          ((firstWeekDay == FirstWeekDay.sunday) ? 0 : 1);

      for (int i = daysAmount; i > leftDays; i--) {
        // Add days to start of month calendar to save sequence
        calendar.insert(
          0,
          _getDateHandler(
            year: year,
            month: month,
            day: i,
            isOtherMonth: true,
          ),
        );
      }
    }

    // Fill unfilding ending week days
    if ((firstWeekDay == FirstWeekDay.monday &&
            calendar.first.date.weekday != DateTime.sunday) ||
        (firstWeekDay == FirstWeekDay.sunday &&
            calendar.first.date.weekday != DateTime.saturday)) {
      //Get next month and year
      if (month == DateTime.december) {
        otherYear = year + 1;
        otherMonth = DateTime.january;
      } else {
        otherYear = year;
        otherMonth = month + 1;
      }

      daysAmount = _getDaysAmount(otherYear, otherMonth);

      leftDays = 7 -
          calendar.last.date.weekday -
          ((firstWeekDay == FirstWeekDay.sunday) ? 1 : 0);
      if (leftDays == -1) leftDays = 6;

      for (int i = 0; i < leftDays; i++) {
        calendar.add(
          _getDateHandler(
            year: year,
            month: month,
            day: i + 1,
            isOtherMonth: true,
          ),
        );
      }
    }
    return calendar;
  }
}
