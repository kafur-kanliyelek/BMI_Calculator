import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    super.key,
    required this.resultText,
  });

  final double resultText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Text(
            'BMI: ${resultText.toStringAsFixed(2)}',
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: Colors.black),
          ),
          Text(bmiClass(resultText))
        ],
      ),
    );
  }
}

String bmiClass(bmiScore) {
  String bmi;
  if (bmiScore <= 18) {
    bmi = 'underweight';
  } else if (bmiScore < 25) {
    bmi = 'normal';
  } else if (bmiScore < 30) {
    bmi = 'overweight';
  } else if (bmiScore < 40) {
    bmi = 'obese';
  } else {
    bmi = 'extremely obese';
  }

  return bmi;
}
