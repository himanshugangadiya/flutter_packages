import 'package:flutter/material.dart';
import 'package:flutter_staggered_animation_project/grid_screen.dart';
import 'package:flutter_staggered_animation_project/list_screen.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Flutter staggered animation"),
        ),
        body: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListScreen(),
                    ));
              },
              title: const Text("listview animation"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GridScreen(),
                    ));
              },
              title: const Text("gridview animation"),
            ),
          ],
        ),
      ),
    );
  }
}
