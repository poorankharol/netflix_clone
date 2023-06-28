import 'package:netflix_clone/model/top_rated/top_rated.dart';

class TopRatedState {
  final List<Results?>? topRated;
  final bool isLoading;

  TopRatedState({this.topRated, required this.isLoading});

  TopRatedState copyWith({List<Results?>? topRated, required bool isLoading}) {
    return TopRatedState(topRated: topRated ?? this.topRated,
        isLoading: this.isLoading);
  }
}
