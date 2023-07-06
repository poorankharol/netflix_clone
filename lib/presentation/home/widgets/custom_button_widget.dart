import 'package:flutter/material.dart';

import '../../details/movie_detail.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconSize = 25,
      this.textSize = 18,
      this.letterSpacingtext = 0,
      this.id,
      required this.onTapped})
      : super(key: key);

  final int? id;
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final double letterSpacingtext;
  final void Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (id == null) {
          onTapped();
          return;
        }
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
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: textSize,
                letterSpacing: letterSpacingtext),
          ),
        ],
      ),
    );
  }
}
