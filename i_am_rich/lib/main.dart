import 'package:flutter/material.dart';

//The main function is the starting point of all flutter apps.
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Center(child: Text("I Am Rich")),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: const Center(
          child: Image(
            //image: NetworkImage('https://i.scdn.co/image/ab67616d0000b273b050ea18f1ea8e8d0b1b8d1f'),
            image: AssetImage('images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}
