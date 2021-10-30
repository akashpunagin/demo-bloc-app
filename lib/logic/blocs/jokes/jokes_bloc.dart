import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/data/models/api_response.dart';
import 'package:bloc_demo/data/models/jokes.dart';
import 'package:bloc_demo/data/repositories/jokes/jokes.dart';
import 'package:equatable/equatable.dart';

part 'jokes_event.dart';
part 'jokes_state.dart';

class JokesBloc extends Bloc<JokesEvent, JokesState> {

  JokesRepository jokesRepository;

  JokesBloc({required this.jokesRepository}) : super(JokesInitial()) {
    on<JokesEvent>((event, emit) async {
      if (event is JokesFetched) {
        emit(JokesFetchLoading());
        ApiResponse response = await jokesRepository.getRandomJoke();
        if (response.isError) {
          emit(JokesFetchError(errorMessage: response.errorMessage as String));
        } else {
          emit(JokesFetchLoaded(joke: response.data));
        }
      }
    });
  }
}















