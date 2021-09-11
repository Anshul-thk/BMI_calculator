import 'dart:math';

import 'package:flutter/material.dart';
class CalculatorBrain
{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;

  double _bmi;

  String CalculateBMI(){
    double _bmi=weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String GetResult(){
    if(_bmi>=25){
      return 'Overweight';
    }
    else if(_bmi>18.5){
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }
  }
  String GetInterpretataion(){
    if(_bmi>=25){
      return 'You Have a higher than normal body Weight, try to exercise more.';
    }
    else if(_bmi>18.5){
      return 'You have a normal body weight, Good Job.';
    }
    else{
      return 'You have a lower than normal body weight, You can eat a bit more.';
    }
  }
}

