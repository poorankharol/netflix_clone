import 'package:flutter/material.dart';

class ProductionCompanies extends StatelessWidget {
  const ProductionCompanies(
      {super.key, required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage(image),
            height: 30,
            width: 30,
            color: Colors.white,
          ),
          const SizedBox(width: 15,),
          Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
