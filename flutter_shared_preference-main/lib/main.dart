import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preference_project/screens/home_screen.dart';
import 'package:shared_preference_project/screens/login_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  bool? token = prefs.getBool('token');
  log('==============$email');
  log('==============$token');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: token == true ? const HomeScreen() : const LoginScreen(),
  ));
}
