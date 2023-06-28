import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/core/movie_details/movie_details_api.dart';
import 'package:netflix_clone/core/movie_details/movie_details_repository.dart';
import 'package:netflix_clone/model/details/movie_details_state.dart';
import 'package:netflix_clone/presentation/details/provider/movie_details_data_notifier.dart';
import '../../../../provider/dio_provider.dart';

final movieDetailsApiProvider = Provider((ref) {
  return MovieDetailsApi(ref.read(dioClientProvider));
});

final movieDetailsRepositoryProvider = Provider((ref) {
  return MovieDetailsRepository(ref.read(movieDetailsApiProvider));
});

final movieDetailsDataProvider = StateNotifierProvider.autoDispose
    <MovieDetailsDataNotifier, MovieDetailsState>((ref) {
  return MovieDetailsDataNotifier(ref.read(movieDetailsRepositoryProvider));
});
