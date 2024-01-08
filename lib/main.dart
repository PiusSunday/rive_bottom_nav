import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive_bottom_nav/src/features/bottom-navigation/bloc/bottom_navigation_bloc.dart';
import 'package:rive_bottom_nav/src/features/home/view/home.dart';

void main() {
  runApp(const RiveBottomNavApp());
}

class RiveBottomNavApp extends StatelessWidget {
  const RiveBottomNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rive Bottom Navigation',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
