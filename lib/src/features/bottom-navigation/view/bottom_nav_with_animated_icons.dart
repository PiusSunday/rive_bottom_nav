import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_bottom_nav/core/components/animated_bar_indicator.dart';
import 'package:rive_bottom_nav/core/controllers/bottom_nav_controller.dart';
import 'package:rive_bottom_nav/src/features/bottom-navigation/bloc/bottom_navigation_bloc.dart';

const Color bottomNavBgColor = Color(0xFF17203A);

class BottomNavWithAnimatedIcons extends StatefulWidget {
  const BottomNavWithAnimatedIcons({
    super.key,
    required this.state,
    required this.selectedNavIndex,
  });

  final BottomNavigationBloc state;
  final int selectedNavIndex;

  @override
  State<BottomNavWithAnimatedIcons> createState() =>
      _BottomNavWithAnimatedIconsState();
}

class _BottomNavWithAnimatedIconsState
    extends State<BottomNavWithAnimatedIcons> {
  // Instance of BottomNavController
  final BottomNavController _bottomNavController = BottomNavController();

  List<SMIBool> riveIconInputs = [];

  List<StateMachineController> controllers = [];

  // animate the rive icon
  void animateRiveIcon(int index) {
    // Set the active state of the icon to true
    riveIconInputs[index].change(true);

    // Set the active state of the icon to false after 0.5 seconds
    Future.delayed(const Duration(milliseconds: 500), () {
      riveIconInputs[index].value = false;
    });
  }

  // rive onInit method
  void riveOnInit(Artboard artboard, {required String stateMachineName}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);

    // Add the controller to the artboard
    artboard.addController(controller!);

    controllers.add(controller);

    // Add the controller to the list of inputs
    riveIconInputs.add(controller.findInput<bool>("active") as SMIBool);
  }

  @override
  void dispose() {
    // Dispose the controllers
    for (var controller in controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the list of BottomNavItems
    final bottomNavItems = _bottomNavController.bottomNavItems;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: bottomNavBgColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: bottomNavBgColor.withOpacity(0.3),
              offset: const Offset(0, 20),
              blurRadius: 20,
            ),
          ],
        ),

        // Bottom Navigation Bar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomNavItems.length,
            (index) {
              final riveIcon = bottomNavItems[index].rive;

              return GestureDetector(
                onTap: () {
                  // Animate the rive icon
                  animateRiveIcon(index);

                  // Add the index to the selectedNavIndex stream
                  widget.state.add(
                    BottomNavigationTappedEvent(selectedNavIndex: index),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon Animated Bar Indicator
                    AnimatedBarIndicator(
                      isActive: widget.selectedNavIndex == index,
                    ),

                    // Icon
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: Opacity(
                        opacity:
                            widget.selectedNavIndex == index ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          riveIcon.src,
                          artboard: riveIcon.artBoard,
                          onInit: (artboard) {
                            riveOnInit(
                              artboard,
                              stateMachineName: riveIcon.stateMachineName,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
