import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      XylophoneApp(),
    );

class XylophoneApp extends StatelessWidget {
  void SoundPlay(int x) => AudioPlayer().play(AssetSource('note$x.wav'));

  Expanded BuildKey({required Color color, required int x}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          SoundPlay(x);
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
          enableFeedback: false,
        ),
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                BuildKey(color: Colors.red, x: 1),
                BuildKey(color: Colors.orange, x: 2),
                BuildKey(color: Colors.yellow, x: 3),
                BuildKey(color: Colors.green, x: 4),
                BuildKey(color: Colors.teal, x: 5),
                BuildKey(color: Colors.blue, x: 6),
                BuildKey(color: Colors.purple, x: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
