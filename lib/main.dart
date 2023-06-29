import 'package:flutter/material.dart';
import 'package:movieflix/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFF272727),
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Color(0xFFD4D4D4),
          ),
        ),
        focusColor: const Color(0xFFD7FE62),
        highlightColor: const Color(0xFFFF9454),
      ),
      home: const HomeScreen(),
    );
  }
}
