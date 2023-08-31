import 'dart:developer';

import 'package:flutter/material.dart';

class NumberPickerWidget extends StatefulWidget {
  final double itemExtent;
  final int minValue;
  final int maxValue;
  final Color selectedColor;
  final Color unSelectedColor;
  final double selectedFontSize;
  final double unSelectedFontSize;
  final Function providerFunc;
  final double providerData;
  const NumberPickerWidget(
      {Key? key,
      required this.itemExtent,
      required this.selectedColor,
      required this.unSelectedColor,
      required this.minValue,
      required this.maxValue,
      required this.selectedFontSize,
      required this.unSelectedFontSize,
      required this.providerFunc,
      required this.providerData})
      : super(key: key);

  @override
  _NumberPickerWidgetState createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  @override
  Widget build(BuildContext context) {
    final int _minValue = widget.minValue;
    final int _maxValue = widget.maxValue;
    Function weightF2 = widget.providerFunc;
    double _selectedNumber = widget.providerData;
    return RotatedBox(
      quarterTurns: 3,
      child: SizedBox(
        width: 200,
        height: 200,
        child: ListWheelScrollView(
          controller:
              FixedExtentScrollController(initialItem: _minValue.toInt()),
          physics: FixedExtentScrollPhysics(),
          diameterRatio: 2.0,
          itemExtent: widget.itemExtent, // Adjust the item extent as needed
          onSelectedItemChanged: (index) {
            weightF2(index.toDouble() + _minValue);
          },
          children: List.generate(_maxValue - _minValue + 1, (index) {
            final number = _minValue + index;

            return Center(
              child: RotatedBox(
                quarterTurns: 1,
                child: FittedBox(
                  child: Text(
                    '${number}',
                    style: TextStyle(
                      fontSize: _selectedNumber - _minValue == index
                          ? widget.selectedFontSize
                          : widget.unSelectedFontSize,
                      fontWeight: FontWeight.bold,
                      color: _selectedNumber - _minValue == index
                          ? (widget.selectedColor)
                          : widget.unSelectedColor,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
