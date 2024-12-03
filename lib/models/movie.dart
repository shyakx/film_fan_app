class Movie {
  final String title;
  final String releaseDate;
  final double voteAverage;
  final String posterPath;

  Movie({
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(),
      posterPath: json['poster_path'] ?? '',
    );
  }
}
