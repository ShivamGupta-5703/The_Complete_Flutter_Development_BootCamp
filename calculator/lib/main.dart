import 'package:flutter/material.dart';
import 'package:calculator/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //debug banner off.
      home:Scaffold(
        body: Center(child:Text("Tinchu", style: TextStyle(fontSize: 32,color: Colors.red),),),
      )
    );
  }
}
