import 'package:flutter/material.dart';

class DateHandler {
  final DateTime date;
  final bool isOtherMonth;

  DateHandler({
    @required this.date,
    this.isOtherMonth = false,
  });
}
