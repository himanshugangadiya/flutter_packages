import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage_project/screens/home_screen.dart';
import 'package:get_storage_project/screens/login_screen.dart';

void main() async {
  await GetStorage.init();
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
      home: GetStorage().read('userLogin') != ''
          ? const HomeScreen()
          : const LoginScreen(),
    );
  }
}
