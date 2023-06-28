import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix_clone/core/movie_details/movie_details_api.dart';
import 'package:netflix_clone/model/details/movie_details.dart';

class MovieDetailsRepository {
  final MovieDetailsApi _moviesApi;

  MovieDetailsRepository(this._moviesApi);

  Future<MovieDetails> fetchMovieDetails(int id) async {
    try {
      final res = await _moviesApi.fetchMovieDetailsApiRequest(id);
      final details = MovieDetails.fromJson(res);
      return details;
    } on DioException catch (errorMessage) {
      log(errorMessage.toString());
      rethrow;
    }
  }
}
