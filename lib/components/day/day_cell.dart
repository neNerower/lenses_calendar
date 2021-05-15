import 'package:flutter/material.dart';
import 'package:lenses_calendar/model/date_handler.dart';

class DayCell extends StatelessWidget {
  final DateHandler date;
  final Color color;

  const DayCell({
    Key key,
    @required this.date,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    bool isCurrentDate = (date.date == DateTime(now.year, now.month, now.day));

    return InkWell(
      child: Text(
        '${date.date.day}',
        style: TextStyle(
          color: (date.isOtherMonth) ? Colors.transparent : color,
          fontWeight: isCurrentDate ? FontWeight.bold : FontWeight.normal,
          fontSize: isCurrentDate ? 18 : 15,
        ),
      ),
    );
  }
}
