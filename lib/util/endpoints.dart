class Endpoints {
  static const baseUrl = 'https://api.themoviedb.org/3/movie/';
  static const token =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNjRlZTRkMjljMGY0ZWI4NmJkYzQ4Y2RjMTUyNjRiZCIsInN1YiI6IjY0OTlhNDQ4YjM0NDA5MDBlMjcyZjg2NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0d-mfHsAQWZa_XVfZ5KUPL74s7Ep2qOH-Hmd11wGg00";
  static const nowPlaying = "now_playing?language=en-US&page=1";
  static const topRated = "top_rated?language=en-US&page=1";
  static const details = "";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  static const posterPath = "https://image.tmdb.org/t/p/original";
}