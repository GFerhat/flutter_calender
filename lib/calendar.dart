import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_calender/widgets/calender_generation.dart';
import 'package:flutter_calender/widgets/headsection.dart';

class Calendar extends StatelessWidget {
  Calendar({super.key});
  DateTime date = DateTime(2025, 11, 9);
  // DateTime get localDateTime => date;

  Widget build(BuildContext context) {
    print(date.weekday);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // or your desired height
        child: Header(), // Replace 'YourTitle' with the required argument
      ),
      body: TableGenerator(date: date),
    );
  }
}
