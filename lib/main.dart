import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/mobile_screens/home.dart';
// import 'package:flutter_application_for_learning/mobile_screens/home_screen_mobile.dart';
import 'package:flutter_application_for_learning/systems/responsive_layout.dart';
import 'package:flutter_application_for_learning/tablet_screens/home.dart';
// import 'package:flutter_application_for_learning/tablet_screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample Flutter App",
      home: ResponsiveLayout(
        mobileBody: const HomeMobile(),
        tabletBody: const HomeTablet(),
      ),
    );
  }
}
