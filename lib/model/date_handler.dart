import 'package:flutter/material.dart';

class DateHandler {
  final DateTime date;
  final bool isOtherMonth;
  final bool isCurrent;
  final bool isSelected;
  final bool isTimeToChange;

  DateHandler({
    @required this.date,
    this.isOtherMonth = false,
    this.isCurrent = false,
    this.isSelected = false,
    this.isTimeToChange = false, 
  });
}
