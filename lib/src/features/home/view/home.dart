import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive_bottom_nav/src/features/bottom-navigation/bloc/bottom_navigation_bloc.dart';
import 'package:rive_bottom_nav/src/features/bottom-navigation/view/bottom_nav_with_animated_icons.dart';

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
    return BlocBuilder<BottomNavigationBloc, BottomNavigationInitialState>(
      builder: (context, state) {

        // Get the selected nav index
        final selectedNavIndex = state.selectedNavIndex;

        return Scaffold(
          body: Center(
            child: Text(pages[selectedNavIndex]), 
          ),
          bottomNavigationBar: BottomNavWithAnimatedIcons(
            state: context.read<BottomNavigationBloc>(),
            selectedNavIndex: selectedNavIndex,
          ),
        );
      },
    );
  }
}
