import 'package:flutter/material.dart';
import 'package:rive_bottom_nav/core/components/bottom_nav_with_animated_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> pages = [
    'Chat',
    'Search',
    'Timer',
    'Notifications',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
      bottomNavigationBar: BottomNavWithAnimatedIcons(),
    );
  }
}