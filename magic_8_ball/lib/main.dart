import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: Ball(),
      ),
    );

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Center(
            child: Text(
              'Ask me Anything !!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          )),
      body: MagicBall(),
    );
  }
}

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  @override
  int number = 1;
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(
            () {
              number = Random().nextInt(5) + 1;
            },
          );
        },
        child: Image.asset('images/ball$number.png'),
      ),
    );
  }
}
