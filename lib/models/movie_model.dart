class MovieModel {
  String title, backdropPath, posterPath;
  int id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        backdropPath = json['backdrop_path'],
        posterPath = json['poster_path'];
}
