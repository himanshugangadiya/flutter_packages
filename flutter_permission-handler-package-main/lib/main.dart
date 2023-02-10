import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
      home: const PermissionScreen(),
    );
  }
}

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({Key? key}) : super(key: key);

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  /// handlePermission
  void handlePermission() async {
    PermissionStatus cameraPermission = await Permission.camera.request();

    if (cameraPermission.isGranted) {}
    if (cameraPermission.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("permission is required")));
    }
    if (cameraPermission.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Permission handler"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: handlePermission,
            child: const Text("Permission"),
          ),
        ),
      ),
    );
  }
}
