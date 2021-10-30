part of 'jokes_bloc.dart';

abstract class JokesState extends Equatable {
  const JokesState();
}

class JokesInitial extends JokesState {
  @override
  List<Object> get props => [];
}

class JokesFetchLoading extends JokesState {
  @override
  List<Object?> get props => [];

}

class JokesFetchLoaded extends JokesState {
  final Joke joke;

  const JokesFetchLoaded({required this.joke,});

  @override
  List<Object?> get props => [joke];
}

class JokesFetchError extends JokesState {
  final String errorMessage;

  const JokesFetchError({required this.errorMessage,});

  @override
  List<Object?> get props => [errorMessage];

}