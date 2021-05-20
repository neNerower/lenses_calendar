import 'package:flutter/material.dart';

import 'day_cell.dart';

class SelectedDayWrapper extends StatelessWidget {
  final DayCell child;
  final bool isSelected;

  const SelectedDayWrapper({
    Key key,
    this.child,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(20),
        color: isSelected ? Colors.green[200] : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(child: child),
    );
  }
}
