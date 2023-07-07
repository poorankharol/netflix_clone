import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widgets/bottom_navigation_widget.dart';
import 'package:netflix_clone/presentation/newhot/new_and_hot.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _pages = [
    const HomeScreen(),
    const NewAndHotScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationWidget(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (BuildContext context, value, Widget? child) {
            return _pages[value];
          },
        ),
      ),
    );
  }
}
