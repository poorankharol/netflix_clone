import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix_clone/core/upcoming/coming_soon_api.dart';

import '../../model/coming_soon/coming_soon.dart';

class ComingSoonRepository {
  final ComingSoonApi _moviesApi;

  ComingSoonRepository(this._moviesApi);

  Future<ComingSoon> fetchComingSoon(int page) async {
    try {
      final res = await _moviesApi.fetchComingSoonApiRequest(page);
      return ComingSoon.fromJson(res);
    } on DioException catch (errorMessage) {
      log(errorMessage.toString());
      rethrow;
    }
  }
}
