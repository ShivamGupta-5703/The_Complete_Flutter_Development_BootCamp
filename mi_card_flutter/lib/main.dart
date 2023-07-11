import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green,
                backgroundImage: AssetImage('images/shivamgupta.jpg'),
              ),
              Text(
                'Shivam Gupta',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MoiraiOne'),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'TiltPrism',
                    letterSpacing: 2.5),
              ),
              SizedBox(
                height: 20.0,
                width: 200,
                child: Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal.shade800,
                  ),
                  title: Text(
                    '+91 705 203 9693',
                    style: TextStyle(color: Colors.teal.shade800, fontSize: 20),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email_rounded,
                    color: Colors.teal.shade800,
                  ),
                  title: Text(
                    'shivgupta39693@gmail.com',
                    style: TextStyle(color: Colors.teal.shade800, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
