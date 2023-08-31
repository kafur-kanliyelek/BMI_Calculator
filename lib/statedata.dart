import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateData with ChangeNotifier {
  double weight = 50;
  double age = 20;
  double height = 100;
  bool gender = true;
  double bmiScore = 45;

  void calculateBMI() {
    double bmi = (weight) / ((height / 100) * (height / 100));
    bmiScore = bmi;
  }

  void newWeight(newWeight) {
    weight = newWeight;
    calculateBMI();
    notifyListeners();
  }

  void newAge(newAge) {
    age = newAge;
    notifyListeners();
  }

  void newHeight(newHeight) {
    height = newHeight;
    calculateBMI();
    notifyListeners();
  }

  void changeGender(newGender) {
    gender = !newGender;
    notifyListeners();
  }
}
