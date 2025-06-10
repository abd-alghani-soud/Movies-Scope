import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_scope/features/constant/my_string.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';

class DataHome {
  Future<List<MovieModel>> getMoviePlayingNow() async {
    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '/3/movie/now_playing',
      queryParameters: {"api_key": MyString.apiKey},
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<MovieModel> listMovie = [];
      for (var element in jsonDecode(response.body)) {
        listMovie.add(MovieModel.fromJson(element));
      }
      return listMovie;
    } else {
      throw Exception();
    }
  }
}
