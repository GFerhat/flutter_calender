import 'package:flutter/material.dart';
import 'package:isoweek/isoweek.dart';

class TableGenerator extends StatelessWidget {
  DateTime date;
  TableGenerator({super.key, required this.date});
  @override
  Widget build(BuildContext context) {
    DateTime firstOfMonth = DateTime(date.year, date.month, 1);
    int daysOfMonth = DateTime(date.year, date.month + 1, 0).day;
    int daysOfPrevMonth = DateTime(date.year, date.month, 0).day;
    Week currentWeek = Week.current();
    String currentWeekString = currentWeek.toString().substring(5, 7);
    int calenderWeek = int.parse(currentWeekString);
    TableRow generateWeek(List<TableCell> day, int weekCounter) {
      if (weekCounter == 0) {
        return TableRow(children: Text(calendarWeek.toString()));
      } else {
        return TableRow(children: day);
      }
    }

    TableCell generateDay(int dayCounter, int weekCounter) {
      
      int cellContent = weekCounter * 7 + dayCounter - firstOfMonth.weekday + 1;
      if (cellContent > daysOfMonth) cellContent = cellContent - daysOfMonth;
      if (cellContent < 1) cellContent = cellContent + daysOfPrevMonth;
      return TableCell(child: Text(cellContent.toString()));
    }

    int weekCounter = 0;
    return Table(
      children: <TableRow>[
        for (weekCounter = 0; weekCounter < 6; weekCounter++)
          generateWeek([
            for (int dayCounter = 0; dayCounter <= 7; dayCounter++)
              generateDay(dayCounter, weekCounter),
          ]),
      ],
    );
  }
}
