import 'package:bloc_demo/data/models/api_response.dart';
import 'package:http/http.dart' as http;

class JokesDataProvider {

  static Future<ApiResponse> getRandomJoke() async {
    const String url = "https://v2.jokeapi.dev/joke/Any";

    Uri parsedUrl = Uri.parse(url);

    try {
      http.Response response = await http.get(parsedUrl);

      if (response.statusCode == 200) {
        return ApiResponse(isError: false, data: response.body);
      } else {
        return ApiResponse(isError: true, errorMessage: "There was some error while getting jokes");
      }
    } catch (e) {
      return ApiResponse(isError: true, errorMessage: "There was some error while getting jokes from http");
    }

  }

}