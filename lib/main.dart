import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FilmFanApp());
}

class FilmFanApp extends StatelessWidget {
  const FilmFanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film Fan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
