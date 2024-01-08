import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationInitialState> {
  BottomNavigationBloc() : super(BottomNavigationInitialState()) {
    on<BottomNavigationTappedEvent>(_bottomNavigationTappedEvent);
  }

  void _bottomNavigationTappedEvent(
    BottomNavigationTappedEvent event,
    Emitter<BottomNavigationInitialState> emit,
  ) {
    emit(BottomNavigationInitialState(
      selectedNavIndex: event.selectedNavIndex,
    ));
  }
}
