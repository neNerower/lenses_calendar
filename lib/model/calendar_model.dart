import 'date_handler.dart';
import 'first_week_day.dart';

class CalendarModel {
  // Amount of days in months
  // [JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC]
  final List<int> _monthLengths = [
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

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
    int daysAmount = _monthLengths[month - 1];
    // If this is a leap year and month is february
    if (_isLeapYear(year) && month == DateTime.february) daysAmount++;

    return daysAmount;
  }

  // Get calendar by month
  List<DateHandler> getMonthCalendar(
      {int year, int month, FirstWeekDay firstWeekDay = FirstWeekDay.monday}) {
    // Check passing arguments
    if (year == null || month == null || month < 1 || month > 12)
      throw ArgumentError('Invalid year or month');

    List<DateHandler> calendar = [];

    // Get amount of days in processed month
    int daysAmount = _getDaysAmount(year, month);

    // Fill calendar month with dates
    for (int i = 0; i < daysAmount; i++) {
      calendar.add(DateHandler(
        date: DateTime(year, month, i + 1),
      ));
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
          DateHandler(
            date: DateTime(otherYear, otherMonth, i),
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
          ((firstWeekDay == FirstWeekDay.sunday) ? 0 : 1);

      for (int i = 0; i < leftDays; i++) {
        calendar.add(
          DateHandler(
            date: DateTime(otherYear, otherMonth, i + 1),
          ),
        );
      }
    }
    return calendar;
  }
}
