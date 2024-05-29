import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_2/model/electronics_catalog.dart';
import 'package:flutter_application_2/widgets/drawer_page.dart';
// import 'package:flutter_application_2/widgets/item_widget.dart';
import 'package:flutter_application_2/widgets/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];

    CatalogModel.items = List.from(productsData)
        .map<MyElectronicsCatalog>((item) => MyElectronicsCatalog.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //BELOW IS THE CODE TO ADD DUMMY ITEMS IN LIST TILE
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);

    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  const Expanded(child: CatalogList())
                else
                  const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
              ],
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: MyThemes.darkbluish,
          ),
        ),
        const Text(
          "Trending Products",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
      itemCount: CatalogModel.items.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final MyElectronicsCatalog catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Row(
          children: [
            CatalogImage(image: catalog.productUrl),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: AboutCatalog(
                  name: catalog.name,
                  desc: catalog.desc,
                  price: catalog.price.toString()),
            ))
          ],
        ),
      ),
    );
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: MyThemes.creamColor,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            width: 100,
            image,
          ),
        ),
      ),
    );
  }
}

class AboutCatalog extends StatelessWidget {
  final String name;
  final String desc;
  final String price;
  const AboutCatalog({
    super.key,
    required this.name,
    required this.desc,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            color: MyThemes.darkbluish,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          desc,
          style: TextStyle(
            color: MyThemes.darkbluish,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$$price",
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(MyThemes.darkbluish),
              ),
              onPressed: () {},
              child: const Text(
                "Buy",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
