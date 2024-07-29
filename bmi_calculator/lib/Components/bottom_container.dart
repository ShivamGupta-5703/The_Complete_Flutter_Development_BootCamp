import 'package:flutter/material.dart';
import 'constants.dart';
import '../Screens/result_page.dart';

class BottomContainer extends StatelessWidget {
  final VoidCallback ontap;
  final String bottontext;

  BottomContainer({required this.ontap, required this.bottontext});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kBottomContainerColor,
        ),
        child: Center(
          child: Text(
            bottontext.toString(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
