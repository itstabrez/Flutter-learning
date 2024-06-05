import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_2/widgets/theme.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          Expanded(child: const _CartList().p32()),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList();

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    return cart.items.isEmpty
        ? const Center(
            child: Text(
              "Nothing to show here",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  cart.removeItem(cart.items[index]);
                  setState(() {});
                },
              ),
              title: cart.items[index].name.text.make(),
              subtitle: cart.items[index].desc.text.make(),
            ),
            itemCount: cart.items.length,
          );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${cart.totalPrice}".text.xl4.make(),
          const SizedBox(
            width: 30,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(MyThemes.darkbluish),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet".text.make()));
            },
            child: "Buy".text.xl2.white.make(),
          ).w24(context),
        ],
      ),
    );
  }
}
