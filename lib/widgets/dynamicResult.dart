import 'package:flutter/material.dart';

class DynamicResult extends StatelessWidget {
  const DynamicResult({
    super.key,
    required this.age,
    required this.styleT,
    required this.weight,
    required this.height,
  });

  final double age;
  final TextStyle styleT;
  final double weight;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
          color: Color(0xFFFAF0D7), borderRadius: BorderRadius.circular(16.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${age.toInt()}',
            style: styleT,
          ),
          Text(
            '${weight.toInt()} kg',
            style: styleT,
          ),
          Text(
            '$height cm',
            style: styleT,
          )
        ],
      ),
    );
  }
}
