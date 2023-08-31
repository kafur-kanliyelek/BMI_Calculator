import 'package:bmi_calculator_new/widgets/home.dart';
import 'package:bmi_calculator_new/statedata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(ChangeNotifierProvider<StateData>(
      create: (BuildContext context) {
        return StateData();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const Home(),
    );
  }
}
