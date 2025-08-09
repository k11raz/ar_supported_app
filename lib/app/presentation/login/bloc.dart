import 'package:bus/app/presentation/login/event.dart';
import 'package:bus/app/presentation/login/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncrementPressed>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });
    on<CounterDecrementPressed>((event, emit) {
      emit(state.copyWith(count: state.count -1));
    });
  }
}
