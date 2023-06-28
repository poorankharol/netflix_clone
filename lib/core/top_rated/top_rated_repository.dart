import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix_clone/core/top_rated/top_rated_api.dart';
import '../../model/top_rated/top_rated.dart';

class TopRatedRepository {
  final TopRatedApi _moviesApi;

  TopRatedRepository(this._moviesApi);

  Future<List<Results?>?> fetchTopRated() async {
    try {
      final res = await _moviesApi.fetchTopRatedApiRequest();
      final topRatedModel = TopRated.fromJson(res);
      return topRatedModel.results;
    } on DioException catch (errorMessage) {
      log(errorMessage.toString());
      rethrow;
    }
  }
}