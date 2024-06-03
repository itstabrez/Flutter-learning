import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/electronics_catalog.dart';
import 'package:flutter_application_2/widgets/home_widget/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutCatalog extends StatelessWidget {
  final MyElectronicsCatalog catalog;
  final String name;
  final String desc;
  final String price;
  const AboutCatalog({
    super.key,
    required this.name,
    required this.desc,
    required this.price,
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          desc,
          style: const TextStyle(fontSize: 10),
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          children: [
            Text(
              "\$$price",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            AddToCart(
              catalog: catalog,
            ),
          ],
        )
      ],
    );
  }
}
