import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});
  final int height;
  final int weight;

  late double _bmi;

  String calculateBML() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getFeedBack() {
    if (_bmi >= 25) {
      return 'You have a higher bmi than a normal body weight,Exercise more...';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight.';
    } else {
      return 'You have a lower bmi than a normal body weight,Eat more...';
    }
  }
}
