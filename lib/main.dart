import 'package:flutter/material.dart';
import 'package:prizebond_application/views/landing_page.dart';
import 'styles/sk.dart';

void main() {
  runApp(const MyApp());
}

ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 30, 201, 95),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    sk.setTheme(context);
    return MaterialApp(
      title: 'Prizebond',
      theme: themeData,
      home: const LandingPage(title: 'Prizebond - an ultimate solution'),
    );
  }
}
