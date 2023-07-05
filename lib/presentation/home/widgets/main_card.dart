import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/details/appbar.dart';
import 'package:netflix_clone/presentation/details/movie_detail.dart';
import 'package:netflix_clone/presentation/details/movie_detail_silver_bar.dart';
import 'package:transparent_image/transparent_image.dart';

class MainCard extends StatelessWidget {
  final String imageUrl;

  const MainCard({
    Key? key,
    required this.imageUrl,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          print("movie id $id");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => MovieDetailScreen(
                id: id,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
            width: 130,
            height: 250,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(imageUrl),
              width: 130,
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
