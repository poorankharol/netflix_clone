import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/model/details/movie_details.dart';
import 'package:netflix_clone/presentation/details/provider/movie_details_provider.dart';
import 'package:netflix_clone/presentation/details/widget/poster_image.dart';
import 'package:netflix_clone/presentation/details/widget/production_companies.dart';
import 'package:netflix_clone/util/endpoints.dart';
import 'package:readmore/readmore.dart';

class MovieDetailScreen extends ConsumerWidget {
  const MovieDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Future<MovieDetails> movie =
    ref.read(movieDetailsDataProvider.notifier).getNowPlaying(id);

    return Scaffold(
      body: FutureBuilder<MovieDetails>(
        future: movie,
        builder:
            (BuildContext context, AsyncSnapshot<MovieDetails> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: id,
                    child: PosterImage(
                      image: snapshot.data!.posterpath!,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.title!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5),
                        ),
                        Text(
                          snapshot.data!.tagline!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              snapshot.data!.releasedate!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              snapshot.data!.status!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${snapshot.data!.runtime.toString()} min",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ReadMoreText(
                          snapshot.data!.overview!,
                          trimLines: 2,
                          colorClickableText: Colors.white,
                          trimCollapsedText: "more",
                          trimExpandedText: "Less",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            "Genres",
                            style: TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                        ),
                        Column(
                          children: [
                            for (var genre in snapshot.data!.genres!)
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    genre!.name!,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                          child: Text(
                            "Language",
                            style: TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                        ),
                        Column(
                          children: [
                            for (var language
                            in snapshot.data!.spokenlanguages!)
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    language!.name!,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                          child: Text(
                            "Production Companies",
                            style: TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                        ),
                        Column(
                          children: [
                            for (var companies
                            in snapshot.data!.productioncompanies!)
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ProductionCompanies(
                                  name: companies!.name!,
                                  image: companies.logopath != null
                                      ? '${Endpoints.posterPath}${companies
                                      .logopath!}'
                                      : "https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png",
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
