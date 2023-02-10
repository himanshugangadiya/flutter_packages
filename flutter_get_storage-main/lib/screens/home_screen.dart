import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage_project/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              GetStorage().write('userLogin', '');
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
            },
            icon: const Icon(Icons.logout),
          ),
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
