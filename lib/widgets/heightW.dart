import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';

class HeightPicker extends StatelessWidget {
  const HeightPicker({
    super.key,
    required this.heightF,
    required this.gender,
  });

  final Function heightF;
  final bool gender;

  @override
  Widget build(BuildContext context) {
    return HorizontalPicker(
        backgroundColor: _projectColors().bg,
        activeItemTextColor:
            gender ? _projectColors().active2 : _projectColors().active,
        passiveItemsTextColor:
            gender ? _projectColors().passive2 : _projectColors().passive,
        cursorColor:
            gender ? _projectColors().cursor : _projectColors().passive,
        activeFontSize: 30.0,
        passiveFontSize: 15.0,
        minValue: 100,
        maxValue: 270,
        divisions: 340,
        height: 100,
        onChanged: (value) {
          heightF(value);
        });
  }
}

class _projectColors {
  Color bg = const Color(0xFFFAF0D7);
  Color active = const Color(0xFFFF4194);
  Color passive = const Color(0xFFFF74B1);
  Color active2 = const Color(0xFF64AAD3);
  Color passive2 = const Color(0xFF8CC0DE);
  Color cursor = Color(0xFF64AAD3);
}
