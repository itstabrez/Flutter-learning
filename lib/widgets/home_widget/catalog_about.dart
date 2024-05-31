import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/cart.dart';
import 'package:flutter_application_2/model/electronics_catalog.dart';
import 'package:flutter_application_2/widgets/theme.dart';
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
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$$price",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            _AddToCart(catalog),
          ],
        ).wHalf(context)
      ],
    );
  }
}

class _AddToCart extends StatefulWidget {
  final MyElectronicsCatalog catalog;
  const _AddToCart(this.catalog);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(MyThemes.darkbluish),
      ),
      onPressed: () {
        final myCatalog = CatalogModel();
        final cart = CartModel();
        cart.catalog = myCatalog;
        cart.addItem(widget.catalog);
        isAdded = isAdded.toggle();
        setState(() {});
      },
      child: isAdded
          ? const Icon(Icons.done)
          : const Text(
              "Add to cart",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
    );
  }
}
