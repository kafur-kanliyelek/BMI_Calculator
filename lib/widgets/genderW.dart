import 'package:flutter/material.dart';

class GenderBtn extends StatelessWidget {
  const GenderBtn({
    super.key,
    required this.genderF,
    required this.gender,
    required List<bool> genderList,
  }) : _genderList = genderList;

  final Function genderF;
  final bool gender;
  final List<bool> _genderList;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      selectedColor: gender ? _projectColors().color1 : _projectColors().color2,
      selectedBorderColor:
          gender ? _projectColors().color1 : _projectColors().color2,
      fillColor: gender
          ? _projectColors().color1.withOpacity(0.1)
          : _projectColors().color2.withOpacity(0.1),
      splashColor: !gender ? _projectColors().color1 : _projectColors().color2,
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.1,
          minWidth: MediaQuery.of(context).size.height * 0.06),
      direction: Axis.vertical,
      borderRadius: BorderRadius.circular(30.0),
      onPressed: (index) {
        genderF(gender);
      },
      isSelected: _genderList,
      children: [
        BtnIcons().male,
        BtnIcons().female,
      ],
    );
  }
}

class BtnIcons {
  Icon male = const Icon(Icons.male);
  Icon female = const Icon(Icons.female);
}

class _projectColors {
  Color color1 = Color(0xFF64AAD3);
  Color color2 = Color(0xFFFF4194);
}
