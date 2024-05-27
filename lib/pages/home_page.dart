import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/electronics_catalog.dart';
import 'package:flutter_application_2/widgets/drawer_page.dart';
import 'package:flutter_application_2/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //BELOW IS THE CODE TO ADD DUMMY ITEMS IN LIST TILE
    final dummyList = List.generate(20, (index) => CatalogModel.products[0]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Catalogue App",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          // itemCount: CatalogModel.products.length,
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              product: dummyList[index],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
