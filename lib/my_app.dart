import 'package:flutter/material.dart';
import 'package:inmotion_practical/app/screens/dashboard/view/dashbaord_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      // home: const HomeScreen(),
      home: WeatherScreen(),
    );
  }
}
