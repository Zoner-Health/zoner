import 'package:flutter/material.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/auth/onboarding/doctor_patient_selector_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Zoner',
        debugShowCheckedModeBanner: false,
        theme: ZonerThemeData.lightTheme,
        darkTheme: ZonerThemeData.darkTheme,
        themeMode: ThemeMode.system,
        home: const DoctorPatientSelectorScreen());
  }
}
