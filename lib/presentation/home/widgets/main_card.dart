import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/details/movie_detail.dart';

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
        child: Container(
          width: 130,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}