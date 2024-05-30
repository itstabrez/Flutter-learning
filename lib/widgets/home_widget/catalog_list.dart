import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/electronics_catalog.dart';
import 'package:flutter_application_2/pages/home_details_page.dart';
import 'package:flutter_application_2/widgets/home_widget/catalog_about.dart';
import 'package:flutter_application_2/widgets/home_widget/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailsPage(
                catalog: catalog,
              ),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
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
        decoration: BoxDecoration(
          color: context.cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.productUrl),
            ),
            AboutCatalog(
                name: catalog.name,
                desc: catalog.desc,
                price: catalog.price.toString())
          ],
        ),
      ),
    );
  }
}
