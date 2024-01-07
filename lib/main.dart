import 'package:flutter/material.dart';

void main() {
  runApp(const RiveBottomNavApp());
}

class RiveBottomNavApp extends StatelessWidget {
  const RiveBottomNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rive Bottom Navigation',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
