import 'package:bus/app/presentation/navbar/event.dart';
import 'package:bus/app/presentation/navbar/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {

    on<TabChanged>((event, emit) {
      emit(state.copyWith(tabIndex: event.tabIndex + 1));
    });
  }
}
