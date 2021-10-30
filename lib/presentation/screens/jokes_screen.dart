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
      child: const Text("GET JOKE"),
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
      body: BlocListener<JokesBloc, JokesState>(
        listener: (context, state) {
          if (state is JokesFetchLoaded) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Joke Fetched",), duration: Duration(milliseconds: 300),
            ));
          }
        },
        child: Builder(
          builder: (context) {
            final InternetState internetState = context.watch<InternetCubit>().state;
            final JokesState jokesState = context.watch<JokesBloc>().state;

            if (internetState is InternetDisconnected) {
              return const Text("Please connect to internet");
            } else if (jokesState is JokesInitial) {
              return getFetchJokesButton(context: context);
            } else if (jokesState is JokesFetchLoading) {
              return const CircularProgressIndicator();
            } else if (jokesState is JokesFetchError) {
              return Text("OOPS! ${jokesState.errorMessage}");
            } else if (jokesState is JokesFetchLoaded) {
              return Text("DETAILS: ${jokesState.joke.toJson().toString()}");
            } else {
              return const CircularProgressIndicator();
            }
          }
        ),
      ),
    );
  }
}
