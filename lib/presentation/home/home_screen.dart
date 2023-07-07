import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/presentation/home/provider/now_playing/now_playing_provider.dart';
import 'package:netflix_clone/presentation/home/provider/top_rated/top_rated_provider.dart';
import 'package:netflix_clone/presentation/home/widgets/banner_card.dart';
import 'package:netflix_clone/presentation/home/widgets/main_title_card.dart';
import 'package:netflix_clone/util/endpoints.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String?> listOfNowPlaying = [];
    List<int?> listOfNowPlayingIds = [];

    List<String?> listOfTopRated = [];
    List<int?> listOfTopRatedIds = [];

    final nowPlaying = ref.watch(nowPlayingDataProvider).nowPlaying;
    final isLoading = ref.watch(nowPlayingDataProvider).isLoading;
    final topRated = ref.watch(topRatedDataProvider).topRated;
    final isLoadingTopRated = ref.watch(topRatedDataProvider).isLoading;

    if (nowPlaying != null) {
      listOfNowPlaying = nowPlaying.map((m) {
        return '${Endpoints.posterPath}${m!.posterPath}';
      }).toList();
      listOfNowPlayingIds = nowPlaying.map((m) {
        return m!.id;
      }).toList();
    }
    if (topRated != null) {
      listOfTopRated = topRated.map((m) {
        return '${Endpoints.posterPath}${m!.posterPath}';
      }).toList();
      listOfTopRatedIds = topRated.map((m) {
        return m!.id;
      }).toList();
    }

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              listOfNowPlayingIds.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                  : BannerCard(
                      posterPath:
                          '${Endpoints.posterPath}${listOfNowPlaying[0]}' ?? "",
                      id: listOfNowPlayingIds[0] ?? 0,
                    ),
              const SizedBox(
                height: 15,
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                  : MainTitleCard(
                      title: "Now Playing",
                      posterList: listOfNowPlaying,
                      id: listOfNowPlayingIds,
                    ),
              const SizedBox(
                height: 15,
              ),
              isLoadingTopRated
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                  : MainTitleCard(
                      title: "Top Rated",
                      posterList: listOfTopRated,
                      id: listOfTopRatedIds,
                    ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            width: double.infinity,
            height: 90,
            color: Colors.black.withOpacity(0.2),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.network(
                      'https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png',
                      width: 60,
                      height: 60,
                    ),
                    // const Spacer(),
                    // const Icon(
                    //   Icons.search,
                    //   size: 30,
                    //   color: Colors.white,
                    // ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    // const Icon(
                    //   Icons.account_box,
                    //   color: Colors.white,
                    //   size: 30,
                    // ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "TV Shows",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Movies",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Categories",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
