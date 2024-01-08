part of 'bottom_navigation_bloc.dart';

@immutable
sealed class BottomNavigationState {}

final class BottomNavigationInitialState extends BottomNavigationState {
  final int selectedNavIndex;

  BottomNavigationInitialState({this.selectedNavIndex = 0});
}
