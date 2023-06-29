class MovieModel {
  String id, title, backdropPath, posterPath;

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        backdropPath = json['backdrop_path'],
        posterPath = json['poster_path'];
}
