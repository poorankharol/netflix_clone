import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/main/widgets/main_title_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();
    return const Scaffold(
      body: Stack(
        children: [
          //BannerCard(),
          MainTitleCard(title: "Released in the past year",),
        ],
      ),
    );
  }
}
