import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/newhot/widget/coming_soon.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "New & Hot",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
            ),
            // actions: const [
            //   Icon(
            //     Icons.search,
            //     size: 30,
            //     color: Colors.white,
            //   ),
            //   SizedBox(
            //     width: 15,
            //   ),
            // ],
            bottom: TabBar(
              labelColor: Colors.black,
              isScrollable: true,
              unselectedLabelColor: Colors.white,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              tabs: const [
                SizedBox(
                  height: 35,
                  child: Center(child: Text("🍿Coming Soon")),
                ),
                SizedBox(
                  height: 35,
                  child: Center(child: Text("👀 Everyone's Watching")),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            const ComingSoon(),
            Container(),
          ],
        ),
      ),
    );
  }
}
