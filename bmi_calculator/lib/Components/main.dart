import 'package:flutter/material.dart';
import '../Screens/input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xFF0A0A21)),
        scaffoldBackgroundColor: Color(0xFF0A0A21),
      ),
      home: InputPage(),
    );
  }
}
