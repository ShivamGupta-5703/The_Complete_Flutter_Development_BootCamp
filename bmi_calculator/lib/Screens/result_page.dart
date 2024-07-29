import 'package:bmi_calculator/Components/bottom_container.dart';
import 'package:flutter/material.dart';
import '../Components/constants.dart';
import '../Components/card_widget.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  final String BmiResult;
  final String resultText;
  final String resultInterpretation;

  ResultPage(
      {required this.BmiResult,
      required this.resultText,
      required this.resultInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Card_Widget(
              colour: kActiveCardColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    BmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    resultInterpretation,
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                  BottomContainer(
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InputPage(),
                        ),
                      );
                    },
                    bottontext: 'Re-Calculate',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
