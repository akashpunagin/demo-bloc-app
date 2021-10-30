import 'package:bloc_demo/logic/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  final String title;
  final Color color;


  const SecondScreen({Key? key, required this.title, required this.color}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

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
                ElevatedButton(
                  onPressed: () {
                    // BlocProvider.of<CounterCubit>(context).increment();
                    context.read<CounterCubit>().increment();
                  },
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().reset();
                  },
                  child: const Icon(Icons.cancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed("/third");
              },
              child: const Text("GO TO Third SCREEN", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
