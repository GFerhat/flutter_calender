import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget {
  const Header({super.key});
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(title: Text("Calendar by Ferhat"));
  }
}
