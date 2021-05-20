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
    return isSelected
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green[200],
            ),
            child: child,
          )
        : Container(
            child: child,
          );
  }
}
