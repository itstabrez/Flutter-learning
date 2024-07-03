import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/cart.dart';
import 'package:flutter_application_2/model/electronics_catalog.dart';
import 'package:flutter_application_2/utils/cart_provider.dart';
import 'package:flutter_application_2/widgets/theme.dart';
import 'package:provider/provider.dart';

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
    var cart = Provider.of<CartProvider>(context);
    bool isInCart = cart.isInCart(widget.catalog);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(MyThemes.darkbluish),
      ),
      onPressed: () {
        if (!isInCart) {
          cart.addItem(widget.catalog);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Item is already added"),
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
