import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/home_page.dart';
import 'package:flutterapp/Screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final count = 1000;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: const Homepage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
      ),
      initialRoute: "/Home",
      routes: {
        "/": (context) => const Loginpage(),
        "/Home": (context) => const Homepage(),
        "/Login": (context) => const Loginpage(),
      },
    );
  }
}
