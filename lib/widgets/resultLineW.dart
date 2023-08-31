import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultLineW extends StatelessWidget {
  const ResultLineW({
    super.key,
    required this.resultValue,
  });

  final double resultValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: SfLinearGauge(
        useRangeColorForAxis: true,
        animateAxis: true,
        axisTrackStyle: LinearAxisTrackStyle(thickness: 1),
        minimum: 0,
        maximum: 50,
        interval: 5,
        //animateRange: true,
        markerPointers: [
          LinearShapePointer(
            value: resultValue,
            color: changeColor(resultValue),
          )
        ],
        ranges: <LinearGaugeRange>[
          LinearGaugeRange(
            startValue: 0,
            endValue: 18.5,
            color: _projectColors().color1,
          ),
          LinearGaugeRange(
            startValue: 18.5,
            endValue: 25,
            color: _projectColors().color2,
          ),
          LinearGaugeRange(
            startValue: 25,
            endValue: 30,
            color: _projectColors().color3,
          ),
          LinearGaugeRange(
            startValue: 30,
            endValue: 40,
            color: _projectColors().color4,
          ),
          LinearGaugeRange(
            startValue: 40,
            endValue: 50,
            color: _projectColors().color5,
          )
        ],
      ),
    );
  }
}

Color changeColor(number) {
  Color chosenColor = Colors.black;
  if (number <= 18.5) {
    chosenColor = _projectColors().color1;
  } else if (number <= 25) {
    chosenColor = _projectColors().color2;
  } else if (number <= 30) {
    chosenColor = _projectColors().color3;
  } else if (number <= 40) {
    chosenColor = _projectColors().color4;
  } else {
    chosenColor = _projectColors().color5;
  }
  return chosenColor;
}

class _projectColors {
  Color color1 = Colors.blueAccent;
  Color color2 = Colors.green;
  Color color3 = Colors.yellow;
  Color color4 = Colors.orange;
  Color color5 = Colors.red;
}
