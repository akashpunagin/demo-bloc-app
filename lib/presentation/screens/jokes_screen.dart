import 'package:bloc_demo/logic/blocs/jokes/jokes_bloc.dart';
import 'package:bloc_demo/logic/cubits/internet/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokesScreen extends StatefulWidget {
  const JokesScreen({Key? key}) : super(key: key);

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {


  Widget getFetchJokesButton({required BuildContext context}) {
    return ElevatedButton(
      style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
      onPressed: () {
        context.read<JokesBloc>().add(JokesFetched());
      },
      child: Text("GET JOKE"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JOKES SCREEN"),
        actions: [
          getFetchJokesButton(context: context),
        ],
      ),
      body: Builder(
          builder: (context) {
            final InternetState internetState = context.watch<InternetCubit>().state;

            if (internetState is InternetDisconnected) {
              return const Text("Please connect to internet");
            }

            return BlocConsumer<JokesBloc, JokesState>(
              bloc: context.read<JokesBloc>(),
              listener: (context, state) {
                if (state is JokesFetchLoaded) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar(
                      reason: SnackBarClosedReason.swipe);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Joke Fetched"),));
                }
              },
              builder: (context, state) {
                if (state is JokesInitial) {
                  return getFetchJokesButton(context: context);
                } else if (state is JokesFetchLoading) {
                  return const CircularProgressIndicator();
                } else if (state is JokesFetchError) {
                  return Text("OOPS! ${state.errorMessage}");
                } else if (state is JokesFetchLoaded) {
                  return Text("DETAILS: ${state.joke.toJson().toString()}");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            );
          }
      ),
    );
  }
}
