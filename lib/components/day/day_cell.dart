import 'package:flutter/material.dart';
import 'package:lenses_calendar/model/date_handler.dart';

class DayCell extends StatelessWidget {
  final DateHandler date;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final Function onTapDaySelection;

  const DayCell({
    Key key,
    @required this.date,
    this.color = Colors.white,
    this.size = 15.0,
    this.fontWeight,
    this.onTapDaySelection,
  }) : super(key: key);

  void _selectDay() {
    onTapDaySelection(date.date);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        '${date.date.day}',
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
        ),
      ),
      onTap: _selectDay,
    );
  }
}
