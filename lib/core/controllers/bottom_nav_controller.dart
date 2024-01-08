import 'package:rive_bottom_nav/core/models/bottom_nav_item_model.dart';
import 'package:rive_bottom_nav/core/models/rive_model.dart';

class BottomNavController {
  List<BottomNavItemModel> bottomNavItems = [

    // Chat
    BottomNavItemModel(
      title: "Chat",
      rive: RiveModel(
        src: "assets/rive/animated-icons.riv",
        artBoard: "CHAT",
        stateMachineName: "CHAT_Interactivity",
      ),
    ),

    // Search
    BottomNavItemModel(
      title: "Search",
      rive: RiveModel(
        src: "assets/rive/animated-icons.riv",
        artBoard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity",
      ),
    ),

    // Timer
    BottomNavItemModel(
      title: "Timer",
      rive: RiveModel(
        src: "assets/rive/animated-icons.riv",
        artBoard: "TIMER",
        stateMachineName: "TIMER_Interactivity",
      ),
    ),

    // Notification
    BottomNavItemModel(
      title: "Notification",
      rive: RiveModel(
        src: "assets/rive/animated-icons.riv",
        artBoard: "BELL",
        stateMachineName: "BELL_Interactivity",
      ),
    ),

    // Profile
    BottomNavItemModel(
      title: "Profile",
      rive: RiveModel(
        src: "assets/rive/animated-icons.riv",
        artBoard: "USER",
        stateMachineName: "USER_Interactivity",
      ),
    ),
  ];
}
