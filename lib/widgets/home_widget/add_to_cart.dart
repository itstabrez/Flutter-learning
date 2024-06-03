import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/cart.dart';
import 'package:flutter_application_2/model/electronics_catalog.dart';
import 'package:flutter_application_2/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final MyElectronicsCatalog catalog;

  const AddToCart({super.key, required this.catalog});

  @override
  State<AddToCart> createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  final cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = cart.items.contains(widget.catalog);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(MyThemes.darkbluish),
      ),
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final myCatalog = CatalogModel();
          cart.catalog = myCatalog;
          cart.addItem(widget.catalog);
          setState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: "Item is already added".text.make(),
            ),
          );
        }
      },
      child: isInCart
          ? const Icon(
              Icons.done,
              color: Colors.white,
            )
          : const Text(
              "Add to cart",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
    );
  }
}
