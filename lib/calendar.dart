import 'package:flutter/material.dart';
import 'package:flutter_calender/widgets/calender_generation.dart';
import 'package:flutter_calender/widgets/headsection.dart';

class Calendar extends StatelessWidget {
  Calendar({super.key});
  final date = DateTime(2025, 4, 1);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // or your desired height
        child: Header(), // Replace 'YourTitle' with the required argument
      ),
      body: TableGenerator(date: date),
    );
  }
}
