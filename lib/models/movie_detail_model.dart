class MovieDetailModel {
  String originalTitle, overview, backdropPath, posterPath;
  int runtime;
  double voteAverage;
  List<String> genres;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : originalTitle = json['original_title'],
        voteAverage = json['vote_average'],
        overview = json['overview'],
        runtime = json['runtime'],
        genres = json['genres'],
        backdropPath = json['backdrop_path'],
        posterPath = json['poster_path'];
}
