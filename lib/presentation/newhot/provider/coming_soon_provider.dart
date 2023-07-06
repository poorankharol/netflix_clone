import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/provider/dio_provider.dart';

import '../../../core/upcoming/coming_soon_api.dart';
import '../../../core/upcoming/coming_soon_repository.dart';
import '../../../model/coming_soon/coming_soon.dart';

final comingSoonApiProvider = Provider((ref) {
  return ComingSoonApi(ref.read(dioClientProvider));
});

final comingSoonRepositoryProvider = Provider((ref) {
  return ComingSoonRepository(ref.read(comingSoonApiProvider));
});

final comingSoonDataProvider =
    FutureProvider.family<ComingSoon, int>((ref, page) {
  return ref.read(comingSoonRepositoryProvider).fetchComingSoon(page);
});

final totalCountProvider = Provider<AsyncValue<int>>(
    (ref) => ref
        .watch(comingSoonDataProvider(0))
        .whenData((value) => value.totalResults),
    dependencies: [comingSoonDataProvider]);

final listIndexProvider = Provider<int>((_) {
  throw UnimplementedError();
});

final dataAtIndexProvider =
    Provider.family<AsyncValue<Results>, int>((ref, index) {
  final indexInPage = index % 20;
  final page = index ~/ 20;

  final res = ref.watch(comingSoonDataProvider(page));
  return res.whenData((value) => value.results[indexInPage]);
}, dependencies: [comingSoonDataProvider]);

// var comingSoonDataProvider = StateNotifierProvider<ComingSoonDataNotifier, ComingSoonState>((ref) {
//   return ComingSoonDataNotifier(ref.read(comingSoonRepositoryProvider));
// });
