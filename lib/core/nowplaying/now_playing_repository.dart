import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix_clone/core/nowplaying/now_playing_api.dart';
import 'package:netflix_clone/model/now_playing/now_playing.dart';

class NowPlayingRepository {
  final NowPlayingApi _moviesApi;

  NowPlayingRepository(this._moviesApi);

  Future<List<Results?>?> fetchNowPlaying() async {
    try {
      final res = await _moviesApi.fetchNowPlayingApiRequest();
      final nowPlayingModel = NowPlaying.fromJson(res);
      return nowPlayingModel.results;
    } on DioException catch (errorMessage) {
      log(errorMessage.toString());
      rethrow;
    }
  }
}