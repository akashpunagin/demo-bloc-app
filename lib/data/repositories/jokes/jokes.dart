import 'dart:convert';

import 'package:bloc_demo/data/data_providers/jokes/jokes.dart';
import 'package:bloc_demo/data/models/api_response.dart';
import 'package:bloc_demo/data/models/jokes.dart';

abstract class JokesRepository {
  Future<ApiResponse<Joke>> getRandomJoke();
}

class JokesRepositoryImpl extends JokesRepository {
  @override
  Future<ApiResponse<Joke>> getRandomJoke() async {
    ApiResponse response = await JokesDataProvider.getRandomJoke();
    if (response.isError) {
      return ApiResponse(isError: response.isError, errorMessage: response.errorMessage);
    } else {
      return ApiResponse(isError: response.isError, data: Joke.fromRawJson(response.data));
    }
  }
}