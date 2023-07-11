import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dicee',
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftmouseclick = 1;
  int rightmouseclick = 1;
  void change() {
    leftmouseclick = Random().nextInt(6) + 1;
    rightmouseclick = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  change();
                });
              },
              child: Image.asset('images/dice$leftmouseclick.png'),
            ),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    change();
                  });
                },
                child: Image.asset('images/dice$rightmouseclick.png')),
          ),
        ],
      ),
    );
  }
}
