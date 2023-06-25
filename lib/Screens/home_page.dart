import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  final count = 1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        //elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "MyCatalog",
          //style: TextStyle(
          //color: Colors.black,
          // ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text("I love flutter $count"),
      ),
      drawer: const MyDrawer(),
    );
  }
}
