import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimationLimiter(
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(
              100,
              (int index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 600),
                  columnCount: 3,
                  child: ScaleAnimation(
                    curve: Curves.easeInExpo,
                    child: FadeInAnimation(
                      child: Container(
                        height: 100,
                        width: 100,
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
      ),
    );
  }
}
