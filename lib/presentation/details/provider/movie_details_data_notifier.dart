import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/core/movie_details/movie_details_repository.dart';
import 'package:netflix_clone/model/details/movie_details_state.dart';

import '../../../model/details/movie_details.dart';


class MovieDetailsDataNotifier extends StateNotifier<MovieDetailsState> {
  MovieDetailsDataNotifier(this.movieRepository)
      : super(MovieDetailsState(isLoading: false));

  MovieDetailsRepository movieRepository;

  Future<MovieDetails> getNowPlaying(int id) async {
    // state = state.copyWith(isLoading: true);
    // await movieRepository.fetchMovieDetails(id).then((data) {
    //   state = state.copyWith(movieDetails: data, isLoading: false);
    // });
    final movieData = await movieRepository.fetchMovieDetails(id);
    return movieData;
  }
}
