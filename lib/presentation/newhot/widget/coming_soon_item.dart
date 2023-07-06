import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/util/endpoints.dart';
import 'package:transparent_image/transparent_image.dart';

import '../provider/coming_soon_provider.dart';

class ComingSoonItem extends ConsumerStatefulWidget {
  const ComingSoonItem({super.key});

  @override
  ConsumerState<ComingSoonItem> createState() => _ComingSoonItemState();
}

class _ComingSoonItemState extends ConsumerState<ComingSoonItem> {
  var tapped = false;

  @override
  Widget build(BuildContext context) {
    final index = ref.read(listIndexProvider);
    final asyncData = ref.watch(dataAtIndexProvider(index));
    return asyncData.when(data: (movie) {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jul",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                Text(
                  "15",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 5, bottom: 10, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FadeInImage(
                        image: NetworkImage(
                            "${Endpoints.posterPath}/${movie.posterPath}"),
                        fit: BoxFit.fill,
                        width: double.maxFinite,
                        height: 180,
                        placeholder: MemoryImage(kTransparentImage),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              movie.title,
                              softWrap: false,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButtonWidget(
                                  key: (ValueKey(movie.id)),
                                  icon: tapped
                                      ? Icons.notifications_active_rounded
                                      : Icons.notifications_outlined,
                                  title: "Remind me",
                                  iconSize: 20,
                                  textSize: 10,
                                  letterSpacingtext: 0,
                                  onTapped: () {
                                    setState(() {
                                      tapped = !tapped;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                CustomButtonWidget(
                                  key: (ValueKey(movie.title)),
                                  icon: Icons.info_outline_rounded,
                                  title: "Info",
                                  iconSize: 20,
                                  textSize: 10,
                                  onTapped: () {},
                                  id: movie.id,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Coming on Friday",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Quirky",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }, error: (error, s) {
      return Text(
        "$error\n$s",
        style: const TextStyle(color: Colors.white),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    });
  }
}
