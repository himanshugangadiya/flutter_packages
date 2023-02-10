import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                controller: nameController,
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

              /// login screen text button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Already have an account ?"),
              ),

              const Spacer(),

              /// register button
              ElevatedButton(
                onPressed: () {
                  GetStorage().write('email', emailController.text);
                  GetStorage().write('password', passwordController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Account register')));
                  Navigator.pop(context);
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
