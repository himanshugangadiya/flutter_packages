import 'package:flutter/material.dart';

 
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: const SpinKitScreen(),
    );
  }
}

/// spinKit screen
class SpinKitScreen extends StatefulWidget {
  const SpinKitScreen({Key? key}) : super(key: key);

  @override
  State<SpinKitScreen> createState() => _SpinKitScreenState();
}

class _SpinKitScreenState extends State<SpinKitScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("SpinKit"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SpinKitSpinningLines(
                    color: Colors.black,
                    duration: Duration(seconds: 3),
                    lineWidth: 2,
                    size: 30,
                  ),
                  SpinKitDualRing(
                    color: Colors.black,
                    duration: Duration(seconds: 3),
                    lineWidth: 2,
                    size: 30,
                  ),
                  SpinKitFadingCircle(
                    color: Colors.black,
                    duration: Duration(seconds: 3),
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SpinKitWave(
                    color: Colors.black,
                    duration: Duration(seconds: 3),
                    size: 30,
                    type: SpinKitWaveType.start,
                  ),
                  SpinKitRing(
                    color: Colors.black,
                    duration: Duration(seconds: 1),
                    lineWidth: 2,
                    size: 30,
                  ),
                  SpinKitHourGlass(
                    color: Colors.black,
                    duration: Duration(seconds: 3),
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
