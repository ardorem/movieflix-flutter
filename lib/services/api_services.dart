import 'dart:convert';

import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";
  static const String detail = "movie?id=";
  static const String movieImageUrl = "https://image.tmdb.org/t/p/w500";

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstance = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final movies = jsonData['results'];
      for (var movie in movies) {
        movie['backdrop_path'] = "$movieImageUrl${movie['backdrop_path']}";
        movie['poster_path'] = "$movieImageUrl${movie['poster_path']}";
        movie['id'] = movie['id'].toString();

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
      for (var movie in movies) {
        movie['backdrop_path'] = "$movieImageUrl${movie['backdrop_path']}";
        movie['poster_path'] = "$movieImageUrl${movie['poster_path']}";
        movie['id'] = movie['id'].toString();
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
      for (var movie in movies) {
        movie['backdrop_path'] = "$movieImageUrl${movie['backdrop_path']}";
        movie['poster_path'] = "$movieImageUrl${movie['poster_path']}";
        movie['id'] = movie['id'].toString();
        movieInstance.add(
          MovieModel.fromJson(movie),
        );
      }
      return movieInstance;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getDetailMovies(String id) async {
    final MovieDetailModel movie;
    final List<String> genres = [];
    final url = Uri.parse('$baseUrl/$detail$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var movieFromJson = jsonDecode(response.body);
      movieFromJson['backdrop_path'] =
          "$movieImageUrl${movieFromJson['backdrop_path']}";
      movieFromJson['poster_path'] =
          "$movieImageUrl${movieFromJson['poster_path']}";
      movieFromJson['vote_average'] =
          (movieFromJson['vote_average'] / 2).round();
      for (var genre in movieFromJson['genres']) {
        genres.add(genre['name']);
      }
      movieFromJson['genres'] = genres;
      movie = MovieDetailModel.fromJson(movieFromJson);
      print(movie.voteAverage);
      return movie;
    }
    throw Error();
  }
}
