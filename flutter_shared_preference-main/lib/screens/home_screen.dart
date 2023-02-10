import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preference_project/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void loginUser() async {
    SharedPreferences sf = await SharedPreferences.getInstance();

    sf.setBool('token', true);
  }

  void deleteAccount() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.clear();
    log('delete account-----------------${sf.getString('email')}');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: const Text("Log out"),
              ),
              TextButton(
                onPressed: () {
                  deleteAccount();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: const Text("Delete Account"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Home screen"),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
