import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/start_page/widget/appbar_top.dart';
import 'package:netflix_clone/presentation/start_page/widget/page_%20view_container.dart';
import 'package:netflix_clone/presentation/start_page/widget/signup_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarTop(),
            Expanded(
              child: PageView(
                controller: controller,
                children: const [
                  PageViewContainer(
                    title: "Watch on any Device",
                    imageAssets: 'assets/images/image2.png',
                  ),
                  PageViewContainer(
                    title: "Download and Go",
                    imageAssets: 'assets/images/image3.png',
                  ),
                  PageViewContainer(
                    title: "No pesky Contracts",
                    imageAssets: 'assets/images/image4.png',
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const SwapEffect(
                    activeDotColor: Color.fromARGB(255, 216, 14, 0),
                    dotHeight: 6,
                    dotWidth: 6,
                  ),
                ),
                const SignUpButton()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
