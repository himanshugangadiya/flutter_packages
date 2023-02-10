import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PackageInfoScreen());
  }
}

class PackageInfoScreen extends StatefulWidget {
  const PackageInfoScreen({Key? key}) : super(key: key);

  @override
  State<PackageInfoScreen> createState() => _PackageInfoScreenState();
}

class _PackageInfoScreenState extends State<PackageInfoScreen> {
  PackageInfo packageInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
    installerStore: '',
    buildSignature: '',
  );

  void getInfo() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });

    log(info.toString());
  }

  Widget info(String title, String information) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "$title : $information",
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Package info plus"),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              info('appName', packageInfo.appName),
              info('packageName', packageInfo.packageName),
              info('buildNumber', packageInfo.buildNumber),
              info('version', packageInfo.version),
              info('buildSignature', packageInfo.buildSignature),
              info('installerStore', packageInfo.installerStore.toString()),
            ],
          )),
    );
  }
}
