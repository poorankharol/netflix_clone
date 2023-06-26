import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/main/widgets/custom_button_widget.dart';
import 'package:netflix_clone/util/constant.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(image: NetworkImage(mainScrenImage)),
          ),
          foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.2, 0.8, 1])),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  icon: Icons.add,
                  title: "My List",
                ),
                _playButton(),
                const CustomButtonWidget(
                  icon: Icons.info,
                  title: "More",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: Colors.black,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          "Play",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
