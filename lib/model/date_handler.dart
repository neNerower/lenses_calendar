import 'package:flutter/material.dart';

class DateHandler {
  final DateTime date;
  final bool isOtherMonth;
  final bool isCurrent;
  final bool isSelected;

  DateHandler({
    @required this.date,
    this.isOtherMonth = false,
    this.isCurrent = false,
    this.isSelected = false,
  });
}
