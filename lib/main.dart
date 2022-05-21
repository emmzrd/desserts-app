import 'package:flutter/material.dart';
import 'package:day18_desserts/screens/welcome_screen.dart';


void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      home: WelcomeScreen(),
    );

  }
}
