import 'package:bloc_demo/logic/cubits/counter/counter_cubit.dart';
import 'package:bloc_demo/logic/cubits/internet/internet_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:test/test.dart';

void main() {
  group("CounterCubit", () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();

    });

    tearDown(() {
      counterCubit.close();
    });

    test("counter initial state", () {
      expect(counterCubit.state, const CounterState(counter: 0));
    });

    blocTest(
      "increment counter",
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.increment(),
      expect: () => [const CounterState(counter: 1, wasIncremented: true)],
    );

    blocTest(
      "decrement counter",
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.decrement(),
      expect: () => [const CounterState(counter: -1, wasIncremented: false)],
    );

    blocTest(
      "reset counter",
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.reset(),
      expect: () => [const CounterState(counter: 0, wasIncremented: false)],
    );

  });
}