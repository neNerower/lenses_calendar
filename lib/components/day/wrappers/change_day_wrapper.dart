import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../day_cell.dart';

class ChangeDayWrapper extends StatelessWidget {
  final DayCell child;
  final bool isTimeToChange;
  final Color color;

  const ChangeDayWrapper({
    Key key,
    this.child,
    this.color = Colors.transparent,
    this.isTimeToChange = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: isTimeToChange ? color : Colors.transparent,
      borderType: BorderType.Circle,
      dashPattern: [6, 4],
      child: Center(child: child),
    );
  }
}
