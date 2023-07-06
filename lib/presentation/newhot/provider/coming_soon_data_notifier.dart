import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/core/upcoming/coming_soon_repository.dart';
import 'package:netflix_clone/model/coming_soon/coming_soon_state.dart';

class ComingSoonDataNotifier extends StateNotifier<ComingSoonState> {
  ComingSoonDataNotifier(this.movieRepository)
      : super(ComingSoonState(isLoading: false)) {
    //getNowPlaying( page: 1);
  }

  ComingSoonRepository movieRepository;

// Future<void> getNowPlaying({required int page}) async {
//   state = state.copyWith(isLoading: true);
//   await movieRepository.fetchComingSoon(page).then((data) {
//     state = state.copyWith(comingSoon: data, isLoading: false);
//   });
// }
}
