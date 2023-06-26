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
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .cast<Item>()
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummylist = List.generate(20, (index) => CatalogModel.items[0]);
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
        child: (CatalogModel.items != null)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      header: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.deepPurpleAccent,
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      footer: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.black,
                        child: Text(
                          item.price.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Image.network(item.image),
                    ),
                  );
                },
                itemCount: CatalogModel.items.length,
              )

            /*ListView.builder(
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: CatalogModel.items[index],
                    //item: dummylist[index],
                  );
                },
                itemCount: CatalogModel.items.length,
                //itemCount: dummylist.length,
              )*/
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
