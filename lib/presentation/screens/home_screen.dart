import 'package:bloc_demo/constants/enums.dart';
import 'package:bloc_demo/logic/cubit/counter/counter_cubit.dart';
import 'package:bloc_demo/logic/cubit/internet/internet_cubit.dart';
import 'package:bloc_demo/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Color color;


  const HomeScreen({Key? key, required this.title, required this.color}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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

            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected && state.connectionType == ConnectionType.wifi) {
                  return Text("WIFI");
                } else if (state is InternetConnected && state.connectionType == ConnectionType.mobile) {
                  return Text("MOBILE");
                } else if (state is InternetDisconnected) {
                  return Text("DISCONNECTED");
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),

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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () {
            //         // BlocProvider.of<CounterCubit>(context).increment();
            //         context.read<CounterCubit>().increment();
            //       },
            //       child: const Icon(Icons.add),
            //     ),
            //     ElevatedButton(
            //       onPressed: () {
            //         context.read<CounterCubit>().reset();
            //       },
            //       child: const Icon(Icons.cancel),
            //     ),
            //     ElevatedButton(
            //       onPressed: () {
            //         context.read<CounterCubit>().decrement();
            //       },
            //       child: const Icon(Icons.remove),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 20,),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed("/second");
              },
              child: const Text("GO TO SECOND SCREEN", style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed("/third");
              },
              child: const Text("GO TO THIRD SCREEN", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
