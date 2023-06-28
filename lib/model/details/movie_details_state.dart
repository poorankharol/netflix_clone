
import 'package:netflix_clone/model/details/movie_details.dart';

class MovieDetailsState {
  final MovieDetails? movieDetails;
  final bool isLoading;

  MovieDetailsState({this.movieDetails, required this.isLoading});

  MovieDetailsState copyWith({MovieDetails? movieDetails, required bool isLoading}) {
    return MovieDetailsState(movieDetails: movieDetails ?? this.movieDetails,
        isLoading: this.isLoading);
  }
}
