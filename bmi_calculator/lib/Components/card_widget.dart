import 'package:flutter/material.dart';

class Card_Widget extends StatelessWidget {
  final Color colour;
  final Widget? cardWidget;
  final VoidCallback? onpress;

  Card_Widget({required this.colour, this.cardWidget, this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardWidget,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
