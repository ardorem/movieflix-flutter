import 'dart:convert';

import 'package:movieflix/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";
  static const String movieImageUrl = "https://image.tmdb.org/t/p/w500";

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstance = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final movies = jsonData['results'];
      // print(movies);
      for (var movie in movies) {
        movie['backdrop_path'] = "$movieImageUrl${movie['backdrop_path']}";
        movie['poster_path'] = "$movieImageUrl${movie['poster_path']}";
        movieInstance.add(
          MovieModel.fromJson(movie),
        );
      }
      return movieInstance;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowPlayingMovies() async {
    List<MovieModel> movieInstance = [];
    final url = Uri.parse('$baseUrl/$nowPlaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final movies = jsonData['results'];
      // print(movies);
      for (var movie in movies) {
        movie['backdrop_path'] = "$movieImageUrl${movie['backdrop_path']}";
        movie['poster_path'] = "$movieImageUrl${movie['poster_path']}";
        movieInstance.add(
          MovieModel.fromJson(movie),
        );
      }
      return movieInstance;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingSoonMovies() async {
    List<MovieModel> movieInstance = [];
    final url = Uri.parse('$baseUrl/$comingSoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final movies = jsonData['results'];
      // print(movies);
      for (var movie in movies) {
        movie['backdrop_path'] = "$movieImageUrl${movie['backdrop_path']}";
        movie['poster_path'] = "$movieImageUrl${movie['poster_path']}";
        movieInstance.add(
          MovieModel.fromJson(movie),
        );
      }
      return movieInstance;
    }
    throw Error();
  }
}
