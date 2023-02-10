import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

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
      home: const ScreenShotScreen(),
    );
  }
}

/// screenshot screen
class ScreenShotScreen extends StatefulWidget {
  const ScreenShotScreen({Key? key}) : super(key: key);

  @override
  State<ScreenShotScreen> createState() => _ScreenShotScreenState();
}

class _ScreenShotScreenState extends State<ScreenShotScreen> {
  final controller = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
          onPressed: () async {
            final image = controller.captureFromWidget(buildWidget());
            saveAndShare(await image);
          },
          icon: const Icon(Icons.share),
        )),
        body: Screenshot(
          controller: controller,
          child: Center(
            child: buildWidget(),
          ),
        ),
      ),
    );
  }

  /// screenshot share
  Future saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);

    await Share.shareXFiles([XFile(image.path)]);
  }
}

Widget buildWidget() {
  return Column(
    children: [
      Container(
        height: 200,
        width: double.infinity,
        color: Colors.red,
      ),
      Container(
        height: 200,
        width: double.infinity,
        color: Colors.green,
      ),
      Container(
        height: 200,
        width: double.infinity,
        color: Colors.yellow,
      ),
    ],
  );
}
