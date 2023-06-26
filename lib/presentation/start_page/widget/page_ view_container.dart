import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/start_page/widget/bottom_section.dart';

class PageViewContainer extends StatelessWidget {
  final String imageAssets;
  final String title;

  const PageViewContainer({super.key, required this.imageAssets, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(imageAssets),
          BottomSection(title: title)
        ],
      ),
    );
  }
}
