import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/model/top_rated/top_rated_state.dart';
import 'package:netflix_clone/presentation/home/provider/top_rated/top_rated_data_provider.dart';

import '../../../../core/top_rated/top_rated_api.dart';
import '../../../../core/top_rated/top_rated_repository.dart';
import '../../../../provider/dio_provider.dart';

final topRatedApiProvider = Provider((ref) {
  return TopRatedApi(ref.read(dioClientProvider));
});

final topRatedRepositoryProvider = Provider((ref) {
  return TopRatedRepository(ref.read(topRatedApiProvider));
});

final topRatedDataProvider =
    StateNotifierProvider.autoDispose<TopRatedDataNotifier, TopRatedState>(
        (ref) {
  return TopRatedDataNotifier(ref.read(topRatedRepositoryProvider));
});
