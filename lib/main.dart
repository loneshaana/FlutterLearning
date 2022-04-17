import 'package:basics/screens/bmi_screen.dart';
import 'package:basics/screens/intro_screen.dart';
import 'package:basics/screens/weather_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const IntroScreen(),
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BmiScreen(),
        '/weather': (context) => const WeatherScreen(),
      },
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}
