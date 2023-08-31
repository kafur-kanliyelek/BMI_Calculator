import 'package:bmi_calculator_new/widgets/ageandWeightW.dart';
import 'package:bmi_calculator_new/widgets/genderW.dart';
import 'package:bmi_calculator_new/widgets/heightW.dart';
import 'package:bmi_calculator_new/widgets/resultW.dart';
import 'package:bmi_calculator_new/statedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:bmi_calculator_new/widgets/dynamicResult.dart';

import 'resultLineW.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //bmiScore
    double bmiScore = Provider.of<StateData>(context).bmiScore;
    //screenSize
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    //gender
    bool gender = Provider.of<StateData>(context).gender;
    List<bool> genderList = [gender, !gender];
    //dynamicresult
    double age = Provider.of<StateData>(context).age;
    double weight = Provider.of<StateData>(
      context,
    ).weight;
    double height = Provider.of<StateData>(
      context,
    ).height;

    TextStyle styleT = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: (gender
            ? _projectColors().selectedColor2
            : _projectColors().selectedColor));

    TextStyle styleT20 = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: (gender
            ? _projectColors().selectedColor2
            : _projectColors().selectedColor));

    //providerFunc
    Function newWeight = Provider.of<StateData>(context).newWeight;
    Function newAge = Provider.of<StateData>(context).newAge;
    Function newHeight = Provider.of<StateData>(context).newHeight;
    Function genderF = Provider.of<StateData>(context).changeGender;
    Function bmi = Provider.of<StateData>(context).calculateBMI;

    return Scaffold(
      backgroundColor: _projectColors().scaffoldBG,
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: gender
                  ? _projectColors().selectedColor2
                  : _projectColors().selectedColor,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DynamicResult(
                age: age, styleT: styleT20, weight: weight, height: height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'age',
                  style: styleT,
                ),
                Text(
                  'weight',
                  style: styleT,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.4,
                  decoration: BoxDecoration(
                      color: _projectColors().containerBG,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                          color: gender
                              ? _projectColors().unselectedColor2
                              : _projectColors().unselectedColor,
                          width: 1)),
                  child: AgeandWeightPicker(
                      selectedColor: gender
                          ? _projectColors().selectedColor2
                          : _projectColors().selectedColor,
                      unSelectedColor: gender
                          ? _projectColors().unselectedColor2
                          : _projectColors().unselectedColor,
                      minValue: 10,
                      maxValue: 110,
                      providerFunc: newAge,
                      providerData: age),
                ),
                Container(
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.4,
                  decoration: BoxDecoration(
                      color: _projectColors().containerBG,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                          color: gender
                              ? _projectColors().unselectedColor2
                              : _projectColors().unselectedColor,
                          width: 1)),
                  child: AgeandWeightPicker(
                      selectedColor: gender
                          ? _projectColors().selectedColor2
                          : _projectColors().selectedColor,
                      unSelectedColor: gender
                          ? _projectColors().unselectedColor2
                          : _projectColors().unselectedColor,
                      minValue: 25,
                      maxValue: 150,
                      providerFunc: newWeight,
                      providerData: weight),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'height',
                  style: styleT,
                ),
                SizedBox(
                  height: 5,
                ),
                HeightPicker(
                  heightF: newHeight,
                  gender: gender,
                ),
              ],
            ),
            Row(
              children: [
                ResultWidget(
                  resultText: bmiScore,
                ),
                GenderBtn(
                    genderF: genderF, gender: gender, genderList: genderList)
              ],
            ),
            ResultLineW(
              resultValue: bmiScore,
            ),
          ],
        ),
      ),
    );
  }
}

class _projectColors {
  Color selectedColor = const Color(0xFFFF4194);
  Color unselectedColor = const Color(0xFFFF74B1);
  Color selectedColor2 = const Color(0xFF64AAD3);
  Color unselectedColor2 = const Color(0xFF8CC0DE);
  Color containerBG = const Color(0xFFFAF0D7);
  Color scaffoldBG = const Color(0xFFFFF5E4);
}
