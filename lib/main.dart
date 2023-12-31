import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/home_page.dart';
import 'package:flutterapp/Screens/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

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
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Loginpage(),
        "/Home": (context) => const Homepage(),
        "/Login": (context) => Loginpage(),
      },
    );
  }
}
