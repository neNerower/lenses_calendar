import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../day_cell.dart';

class PeriodDayWrapper extends StatelessWidget {
  final DayCell child;
  final Color color;

  const PeriodDayWrapper({
    Key key,
    this.child,
    this.color = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: color,
      borderType: BorderType.Circle,
      child: Center(child: child),
    );
  }
}
