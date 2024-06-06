import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/pages/home.dart';
import 'package:todoapp/theme/theme.dart';
import 'package:todoapp/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
