import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/main/widgets/main_card.dart';
import 'package:netflix_clone/util/constant.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        LimitedBox(
          maxHeight: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              5,
              (index) => const MainCard(
                  imageUrl:
                      "https://i.etsystatic.com/13367669/r/il/db21fd/2198543930/il_570xN.2198543930_4qne.jpg",
                  id: 1),
            ),
          ),
        )
      ],
    );
  }
}
