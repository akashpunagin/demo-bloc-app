part of 'jokes_bloc.dart';

abstract class JokesEvent extends Equatable {
  const JokesEvent();
}

class JokesFetched extends JokesEvent {
  @override
  List<Object?> get props => [];

}