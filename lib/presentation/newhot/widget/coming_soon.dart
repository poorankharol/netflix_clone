import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/presentation/newhot/provider/coming_soon_provider.dart';
import 'package:netflix_clone/presentation/newhot/widget/coming_soon_item.dart';

class ComingSoon extends ConsumerWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(totalCountProvider);
    return Scaffold(
      body: data.when(data: (data) {
        return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            itemCount: data,
            itemBuilder: (_, index) {
              return ProviderScope(
                  overrides: [listIndexProvider.overrideWith((_) => index)],
                  child: const ComingSoonItem());
            });
      }, error: (error, s) {
        return Text(
          "$error\n$s",
          style: const TextStyle(color: Colors.white),
        );
      }, loading: () {
        return null;
      }),
    );
  }
}
