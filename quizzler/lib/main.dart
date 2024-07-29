import 'package:flutter/material.dart';
import 'question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank question_bank = QuestionBank();
void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Quizzler(),
          ),
        ),
      ),
    );
  }
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> markers = [];

  void CheckAnswer(bool userpicked) {
    bool ans = question_bank.getAnswer();
    setState(
      () {
        if (question_bank.isFinished()) {
          Alert(
                  context: context,
                  title: 'Finished!',
                  desc: 'You\'ve reached the end of the quiz.')
              .show();
          question_bank.reset();
          markers = [];
        } else {
          if (userpicked == ans) {
            markers.add(
              const Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          } else {
            markers.add(
              const Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }
        }
        question_bank.nextquestion();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                question_bank.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              onPressed: () {
                CheckAnswer(true);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              onPressed: () {
                CheckAnswer(false);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Row(
          children: markers,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
