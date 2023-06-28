import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/core/nowplaying/now_playing_api.dart';
import 'package:netflix_clone/model/now_playing/now_playing_state.dart';
import 'package:netflix_clone/presentation/home/provider/now_playing/now_playing_data_notifier.dart';
import 'package:netflix_clone/provider/dio_provider.dart';

import '../../../../core/nowplaying/now_playing_repository.dart';

final nowPlayingApiProvider = Provider((ref) {
  return NowPlayingApi(ref.read(dioClientProvider));
});

final nowPlayingRepositoryProvider = Provider((ref) {
  return NowPlayingRepository(ref.read(nowPlayingApiProvider));
});

final nowPlayingDataProvider =
    StateNotifierProvider.autoDispose<NowPlayingDataNotifier, NowPlayingState>(
        (ref) {
  return NowPlayingDataNotifier(ref.read(nowPlayingRepositoryProvider));
});
