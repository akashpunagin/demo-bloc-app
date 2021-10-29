import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {

  CounterCubit() : super(const CounterState(counter: 0));

  void increment() => emit(CounterState(counter: state.counter + 1, wasIncremented: true));

  void decrement() => emit(CounterState(counter: state.counter - 1, wasIncremented: false));

  void reset() => emit(const CounterState(counter: 0));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {

    // addError(Exception("Couldn't convert to toJson"), StackTrace.current);

    return state.toMap();
  }

  @override
  String toString() {
    return 'CounterCubit{}';
  }

// @override
  // void onChange(Change<CounterState> change) {
  //   print(change);
  //   super.onChange(change);
  // }
  //
  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   print("SOME ERROR IN COUNTER CUBIT - ${error}");
  //   super.onError(error, stackTrace);
  // }

}
