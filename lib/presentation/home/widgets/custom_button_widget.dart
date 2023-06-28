import 'package:flutter/material.dart';

import '../../details/movie_detail.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key, required this.icon, required this.title, required this.id});

  final IconData icon;
  final String title;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => MovieDetailScreen(
              id: id!,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18,letterSpacing: 0),
          ),
        ],
      ),
    );
  }
}
