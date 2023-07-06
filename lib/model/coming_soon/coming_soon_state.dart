import 'package:netflix_clone/model/coming_soon/coming_soon.dart';

class ComingSoonState {
  final List<Results?>? comingSoon;
  final bool isLoading;

  ComingSoonState({this.comingSoon, required this.isLoading});

  ComingSoonState copyWith(
      {List<Results?>? comingSoon, required bool isLoading}) {
    return ComingSoonState(
        comingSoon: comingSoon ?? this.comingSoon, isLoading: this.isLoading);
  }
}
