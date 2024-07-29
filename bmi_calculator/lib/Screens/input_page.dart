import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/card_property.dart';
import '../Components/card_widget.dart';
import '../Components/constants.dart';
import 'result_page.dart';
import '../Components/bottom_container.dart';
import '../Components/round_icon_button.dart';
import '../Components/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Card_Widget(
                        onpress: () {
                          setState(
                            () {
                              selectedGender = Gender.male;
                            },
                          );
                        },
                        colour: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        cardWidget: Cardproperty(
                            Icons: FontAwesomeIcons.mars, text: 'Male'),
                      ),
                    ),
                    Expanded(
                      child: Card_Widget(
                        onpress: () {
                          setState(
                            () {
                              selectedGender = Gender.female;
                            },
                          );
                        },
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        cardWidget: Cardproperty(
                            Icons: FontAwesomeIcons.venus, text: 'FEMALE'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Card_Widget(
                        colour: kActiveCardColor,
                        cardWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Height',
                              style: kLabelTextStyle,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(height.toString(),
                                    style: kNumberTextStyle),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Color(0xFF8D8E98),
                                thumbColor: Color(0xFFEB1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15),
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 30),
                                overlayColor: Color(0x29EB1555),
                              ),
                              child: Slider(
                                  value: height.toDouble(),
                                  min: 120,
                                  max: 250,
                                  onChanged: (double newvalue) {
                                    setState(() {
                                      height = newvalue.round();
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Card_Widget(
                        colour: kActiveCardColor,
                        cardWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Weight'),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundActionButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                RoundActionButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card_Widget(
                        colour: kActiveCardColor,
                        cardWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Age'),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundActionButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                RoundActionButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              BottomContainer(
                ontap: () {
                  CalculatorBrain cb =
                      CalculatorBrain(weight: weight, height: height);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        BmiResult: cb.calculateBML(),
                        resultText: cb.getResult(),
                        resultInterpretation: cb.getFeedBack(),
                      ),
                    ),
                  );
                },
                bottontext: 'Calculate',
              ),
            ],
          ),
        ));
  }
}
