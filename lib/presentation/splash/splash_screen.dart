import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/presentation/start_page/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigatorHome();
  }

  navigatorHome() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const OnBoardingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Lottie.asset("assets/splash/data.json"),
          ),
        ],
      ),
    );
  }
}
