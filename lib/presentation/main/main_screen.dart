import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/main/widgets/bottom_navigation_widget.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _pages = [
    const HomeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/netflix_logo.png"),
        actions: const [
          Icon(Icons.search,size: 30,),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.account_box,size: 30,),
          SizedBox(
            width: 10,
          )
        ],
      ),
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
