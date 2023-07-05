import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widgets/main_card.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard(
      {super.key,
      required this.title,
      required this.posterList,
      required this.id});

  final String title;
  final List<String?> posterList;
  final List<int?> id;

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
              posterList.length,
              (index) => Hero(
                tag: id[index]!,
                child: MainCard(imageUrl: posterList[index]!, id: id[index]!),
              ),
            ),
          ),
        )
      ],
    );
  }
}
