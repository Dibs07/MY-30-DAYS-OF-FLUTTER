import 'package:flutter/material.dart';
import 'package:flutterapp/utils/routes.dart';

class Loginpage extends StatelessWidget {
  //const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/login_image.jpg",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Username",
                  labelText: "Username",
                ),
              ),
              TextFormField(
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(minimumSize: const Size(100, 50)),
                onPressed: () {
                  Navigator.pushNamed(context, Myroutes.homeRoute);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
