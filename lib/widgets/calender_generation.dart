import 'package:flutter/material.dart';

class TableGenerator extends StatelessWidget {
  const TableGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    TableRow generateWeek(List<TableCell> days) {
      return TableRow(children: days);
    }

    TableCell generateDay(int date) {
      return TableCell(child: Text(date.toString()));
    }

    return Table(
      children: <TableRow>[
        for (int i = 0; i < 6; i++)
          generateWeek([for (int j = 0; j < 8; j++) generateDay(i * 7 + j)]),
      ],
    );
  }
}
