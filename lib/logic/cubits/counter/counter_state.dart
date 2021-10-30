part of 'counter_cubit.dart';


class CounterState extends Equatable {
  final int counter;
  final bool? wasIncremented;

  const CounterState({required this.counter, this.wasIncremented});

  @override
  List<Object> get props => [counter, wasIncremented ?? false];

  Map<String, dynamic> toMap() {
    return {
      'counter': counter,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counter: map['counter'] as int,
      wasIncremented: map['wasIncremented'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) {
    return CounterState.fromMap(json.decode(source));
  }

  @override
  String toString() {
    return 'CounterState{counter: $counter, wasIncremented: $wasIncremented}';
  }
}

// @immutable
// abstract class CounterState {}


// class CounterInitial extends CounterState {}
