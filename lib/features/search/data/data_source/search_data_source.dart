import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movies_scope/constant/my_string.dart';
import 'package:movies_scope/features/home/data/models/models_home.dart';
@injectable
class SearchDataSource {
  Future<List<MovieModel>> getMovieFromSearch(String movie) async {
    final url = Uri(
      scheme: 'https',
      path: '/3/search/movie',
      host: 'api.themoviedb.org',
      queryParameters: {"api_key": MyString.apiKey, "query": movie},
    );
    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List<MovieModel> listMovie = [];
      for (var element in jsonDecode(response.body)['results']) {
        listMovie.add(MovieModel.fromMap(element));
      }
      return listMovie;
    } else {
      throw Exception();
    }
  }
}
