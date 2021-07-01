import 'dart:math';
import 'constants.dart';
import 'package:flutter/cupertino.dart';

class CalculatorBrain {

  CalculatorBrain(this.height, this.weight);

  final int height;
  final int weight;

  double _bmiResult;

  String calculateBMI(){
    _bmiResult = weight / pow(height/100, 2);
    return _bmiResult.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmiResult >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmiResult > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation(){
    if(_bmiResult >= 25) {
      return 'Your BMI is higher than normal. Try to exercise more.';
    } else if (_bmiResult > 18.5) {
      return 'Your BMI is normal. Keep up the good work!';
    } else {
      return 'Your BMI is lower than normal. Try to eat a bit more.';
    }
  }
}