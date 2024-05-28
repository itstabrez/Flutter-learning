import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/electronics_catalog.dart';

class ItemWidget extends StatelessWidget {
  final MyElectronicsCatalog product;

  const ItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.blueGrey,
      // shape: StadiumBorder(),
      child: ListTile(
        leading: Image.network(product.productUrl),
        title: Text(product.name),
        subtitle: Text(product.desc),
        trailing: Text(
          "\$${product.price}",
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
