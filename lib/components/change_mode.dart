import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/theme/theme_provider.dart';

class changeMode extends StatefulWidget {
  const changeMode({super.key});

  @override
  State<changeMode> createState() => _changeModeState();
}

class _changeModeState extends State<changeMode> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          isSwitched = value;
        });
      },
    );
  }
}
