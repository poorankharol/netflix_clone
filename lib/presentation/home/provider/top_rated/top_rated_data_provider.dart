import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/core/top_rated/top_rated_repository.dart';
import 'package:netflix_clone/model/top_rated/top_rated_state.dart';


class TopRatedDataNotifier extends StateNotifier<TopRatedState> {
  TopRatedDataNotifier(this.movieRepository)
      : super(TopRatedState(isLoading: false)) {
    getNowPlaying();
  }

  TopRatedRepository movieRepository;

  Future<void> getNowPlaying() async {
    state = state.copyWith(isLoading: true);
    await movieRepository.fetchTopRated().then((data) {
      state = state.copyWith(topRated: data, isLoading: false);
    });
  }
}
