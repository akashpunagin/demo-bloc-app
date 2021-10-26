part of 'counter_cubit.dart';


class CounterState extends Equatable {
  final int counter;
  final bool? wasIncremented;

  const CounterState({required this.counter, this.wasIncremented});

  @override
  List<Object> get props => [counter, wasIncremented ?? false];

}

// @immutable
// abstract class CounterState {}


// class CounterInitial extends CounterState {}
