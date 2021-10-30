import 'package:bloc_demo/logic/blocs/jokes/jokes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokesScreen extends StatefulWidget {
  const JokesScreen({Key? key}) : super(key: key);

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {

  late JokesBloc jokesBloc;

  Widget getFetchJokesButton({required BuildContext context}) {
    return ElevatedButton(
      onPressed: () {
        jokesBloc.add(JokesFetched());
      },
      child: Text("GET JOKE"),
    );
  }

  @override
  void initState() {
    jokesBloc = BlocProvider.of<JokesBloc>(context);
    jokesBloc.add(JokesFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JOKES SCREEN"),
      ),
      body: BlocConsumer<JokesBloc, JokesState>(
        bloc: context.watch<JokesBloc>(),
        listener: (context, state) {
          if (state is JokesFetchLoaded) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar(reason: SnackBarClosedReason.swipe);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Joke Fetched"),));
          }
        },
        builder: (context, state) {
          print("STATE IS : $state");
          if (state is JokesInitial) {
            return getFetchJokesButton(context: context);
          } else if (state is JokesFetchLoading) {
            return CircularProgressIndicator();
          } else if (state is JokesFetchError) {
            return Column(
              children: [
                Text("OOPS! ${state.errorMessage}"),
                getFetchJokesButton(context: context),
              ],
            );
          } else if (state is JokesFetchLoaded) {
            return Column(
              children: [
                Text("DETAILS: ${state.joke.toJson().toString()}"),

                getFetchJokesButton(context: context),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
