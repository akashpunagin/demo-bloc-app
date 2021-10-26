import 'package:bloc_demo/logic/cubit/counter/counter_cubit.dart';
import 'package:bloc_demo/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatefulWidget {
  final String title;
  final Color color;


  const ThirdScreen({Key? key, required this.title, required this.color}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:',),
            BlocConsumer<CounterCubit, CounterState>(
              // bloc: context.read<CounterCubit>(),
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("INCREMENT"), duration: Duration(milliseconds: 300),));
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("DECREMENT"), duration: Duration(milliseconds: 300)));
                }
              },
              builder: (context, state) {
                return Text(
                  state.counter % 2 == 0 ? "EVEN: ${state.counter}" : "ODD: ${state.counter}",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    // BlocProvider.of<CounterCubit>(context).increment();
                    context.read<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    context.read<CounterCubit>().reset();
                  },
                  tooltip: 'RESET',
                  child: const Icon(Icons.cancel),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<CounterCubit>(),
                    child: const SecondScreen(title: "Second screen", color: Colors.black54),
                  ),
                ));
              },
              child: const Text("GO TO SECOND SCREEN", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
