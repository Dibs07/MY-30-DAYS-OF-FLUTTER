import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/models/catalog.dart';
import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final count = 1000;
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
  }

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        //elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "MyCatalog",
          //style: TextStyle(color: Colors.black, ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ItemWidget(
              //item: CatalogModel.items[index],
              item: dummylist[index],
            );
          },
          //itemCount: CatalogModel.items.length,
          itemCount: dummylist.length,
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
