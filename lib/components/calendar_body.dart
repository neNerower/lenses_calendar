import 'package:flutter/material.dart';
import 'package:lenses_calendar/model/date_handler.dart';

class CalendarBody extends StatelessWidget {
  final List<DateHandler> monthCalendar;

  const CalendarBody({
    Key key,
    this.monthCalendar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: monthCalendar.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 1,
        crossAxisCount: 7,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return Center(
          child: InkWell(
            child: Text(
              '${monthCalendar[index].date.day}',
              style: TextStyle(
                  color: (monthCalendar[index].isOtherMonth)
                      ? Colors.white.withOpacity(0)
                      : Colors.white),
            ),
          ),
        );
      },
    );
  }
}
