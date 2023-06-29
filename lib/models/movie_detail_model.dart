class MovieDetailModel {
  String originalTitle, overView, backdropPath, posterPath;
  int runtime, voteAverage;
  List<String> genres;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : originalTitle = json['originalTitle'],
        voteAverage = json['voteAverage'],
        overView = json['overView'],
        runtime = json['runtime'],
        genres = json['genres'],
        backdropPath = json['backdrop_path'],
        posterPath = json['poster_path'];
}
