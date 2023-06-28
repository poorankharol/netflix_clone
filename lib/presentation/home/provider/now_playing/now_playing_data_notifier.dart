import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/model/now_playing/now_playing_state.dart';

import '../../../../core/nowplaying/now_playing_repository.dart';


class NowPlayingDataNotifier extends StateNotifier<NowPlayingState> {
  NowPlayingDataNotifier(this.movieRepository)
      : super(NowPlayingState(isLoading: false)) {
    getNowPlaying();
  }

  NowPlayingRepository movieRepository;

  Future<void> getNowPlaying() async {
    state = state.copyWith(isLoading: true);
    await movieRepository.fetchNowPlaying().then((data) {
      state = state.copyWith(nowPlaying: data, isLoading: false);
    });
  }
}
