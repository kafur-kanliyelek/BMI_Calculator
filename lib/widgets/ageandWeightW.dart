import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/numberPicker.dart';
import '../statedata.dart';

class AgeandWeightPicker extends StatelessWidget {
  const AgeandWeightPicker({
    super.key,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.minValue,
    required this.maxValue,
    required this.providerFunc,
    required this.providerData,
  });

  final Color selectedColor;
  final Color unSelectedColor;
  final int minValue;
  final int maxValue;
  final Function providerFunc;
  final double providerData;

  @override
  Widget build(BuildContext context) {
    return NumberPickerWidget(
      itemExtent: 60,
      selectedColor: selectedColor,
      unSelectedColor: unSelectedColor,
      minValue: minValue,
      maxValue: maxValue,
      selectedFontSize: 60,
      unSelectedFontSize: 20,
      providerFunc: providerFunc,
      providerData: providerData,
    );
  }
}
