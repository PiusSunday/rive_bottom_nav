part of 'bottom_navigation_bloc.dart';

@immutable
sealed class BottomNavigationEvent {}

class BottomNavigationTappedEvent extends BottomNavigationEvent {
  final int selectedNavIndex;

  BottomNavigationTappedEvent({required this.selectedNavIndex});
}
