import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShimmerScreen(),
    );
  }
}

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Shimmer package"),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 89,
          itemBuilder: (context, index) {
            return Container(
              height: 40,
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              child: Shimmer.fromColors(
                baseColor: Colors.green,
                highlightColor: Colors.yellow,
                direction: ShimmerDirection.ltr,
                child: Text(
                  'Shimmer $index',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
