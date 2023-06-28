import 'package:netflix_clone/model/now_playing/now_playing.dart';

class NowPlayingState {
  final List<Results?>? nowPlaying;
  final bool isLoading;

  NowPlayingState({this.nowPlaying, required this.isLoading});

  NowPlayingState copyWith({List<Results?>? nowPlaying, required bool isLoading}) {
    return NowPlayingState(nowPlaying: nowPlaying ?? this.nowPlaying,
        isLoading: this.isLoading);
  }
}
