import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget {
  final DateTime date;
  const Header({super.key, required this.date});
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text("Calendar by Ferhat"),
          Text("${date.year}.${date.month}.${date.day}"),
        ],
        spacing: 10.0,
      ),
    );
  }
}
