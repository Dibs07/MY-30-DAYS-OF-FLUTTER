import 'package:flutter/material.dart';
import 'package:flutterapp/models/catalog.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  final count = 1000;
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
