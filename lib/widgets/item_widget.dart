import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/electronics_catalog.dart';

class ItemWidget extends StatelessWidget {
  final MyElectronicsCatalog products;

  const ItemWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.blueGrey,
      // shape: StadiumBorder(),
      child: ListTile(
        leading: Image.network(products.productUrl),
        title: Text(products.name),
        subtitle: Text(products.desc),
        trailing: Text(
          "\$${products.price}",
          textScaler: const TextScaler.linear(1.5),
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
