import 'package:fl_peliculas/models/movie.dart';
import 'package:fl_peliculas/models/now_playing_response.dart';
import 'package:fl_peliculas/models/popular_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  String _lenguaje = 'es-MX';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(
      _baseUrl,
      '3/movie/now_playing',
      {
        'api_key': _apiKey,
        'language': _lenguaje,
        'page': '1',
      },
    );

    final response = await http.get(url);
    final nowplayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowplayingResponse.results;
    //Todos los widgets que escuchan se redibujen
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(
      _baseUrl,
      '3/movie/popular',
      {
        'api_key': _apiKey,
        'language': _lenguaje,
        'page': '1',
      },
    );

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    //primero concatenamos popularMovies y despues concatenamos la paginacion
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
