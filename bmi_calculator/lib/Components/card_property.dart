import 'package:flutter/material.dart';
import 'constants.dart';

class Cardproperty extends StatelessWidget {
  final String? text;
  final Icons;
  Cardproperty({this.Icons, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text.toString(),
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
