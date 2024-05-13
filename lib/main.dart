import 'package:flutter/material.dart';
import 'package:prizebond_application/views/landingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prizebond',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 30, 201, 95)),
        useMaterial3: true,
      ),
      home: const LandingPage(title: 'Prizebond - an ultimate solution'),
    );
  }
}
