import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimationLimiter(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 600),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  horizontalOffset: -50.0,
                  child: FadeInAnimation(
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.red,
                      margin: const EdgeInsets.all(10),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
