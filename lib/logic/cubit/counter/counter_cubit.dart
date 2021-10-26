import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/constants/enums.dart';
import 'package:bloc_demo/logic/cubit/internet/internet_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit}) : super(const CounterState(counter: 0)) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription = internetCubit.listen((event) {
      if (event is InternetConnected && event.connectionType == ConnectionType.wifi) {
        increment();
      } else if (event is InternetConnected && event.connectionType == ConnectionType.mobile) {
        decrement();
      }
    });
  }


  void increment() => emit(CounterState(counter: state.counter + 1, wasIncremented: true));

  void decrement() => emit(CounterState(counter: state.counter - 1, wasIncremented: false));

  void reset() => emit(const CounterState(counter: 0));

}
