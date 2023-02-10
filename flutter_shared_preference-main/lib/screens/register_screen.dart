import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullName = TextEditingController();

  void register() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      SharedPreferences sf = await SharedPreferences.getInstance();
      sf.setString('email', emailController.text);
      sf.setString('password', passwordController.text).then((value) {
        Navigator.pop(context);
      });

      log('email--------------${sf.getString('email')}');
      log('password--------------${sf.getString('password')}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Register'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),

              /// full name
              TextField(
                controller: fullName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter full name',
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              /// email
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter email',
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              /// password
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter password',
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              /// register screen text button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Already have an account ?"),
              ),

              const Spacer(),

              /// login button
              ElevatedButton(
                onPressed: () {
                  register();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(500, 50),
                ),
                child: const Text("Register"),
              ),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
