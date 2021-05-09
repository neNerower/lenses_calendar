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
        //if (_monthCalendar[index - 7].date = _selectedDate)
        //  return Selector(_monthCalendar[index - 7]);
        return Center(
          child: InkWell(
            child: Text('${monthCalendar[index].date.day}',
                style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}
