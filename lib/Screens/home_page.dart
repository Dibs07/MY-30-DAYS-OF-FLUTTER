import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  final count = 1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("I love flutter $count"),
      ),
      drawer: const Drawer(),
    );
  }
}
