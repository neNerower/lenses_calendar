class Calendar{
  // Amount of days in months
  // [JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC]
  final List<int> _monthLengths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  // Check for leap year
  bool _isLeapYear(int year){
    if (year % 4 == 0){
      if (year % 100 == 0){
        if (year % 400 == 0)
          return true;
        return false;
      }
      return true;
    }
    return false;
  }

}

enum FirstWeekDay{
  sunday, 
  monday
}