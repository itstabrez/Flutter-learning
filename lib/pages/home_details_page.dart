import 'package:flutter/material.dart';

import 'package:flutter_application_2/model/electronics_catalog.dart';
import 'package:flutter_application_2/widgets/theme.dart';

class HomeDetailsPage extends StatelessWidget {
  final MyElectronicsCatalog catalog;
  const HomeDetailsPage({
    super.key,
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${catalog.price}",
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(MyThemes.darkbluish),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Buy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: MyThemes.creamColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(
                  catalog.productUrl,
                  height: 300,
                ),
              ),
            ),
            Expanded(
              child: ClipPath(
                clipper: CustomContainerClipper(),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Text(
                          catalog.name,
                          style: TextStyle(
                            color: MyThemes.darkbluish,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Text(
                          catalog.desc,
                          style: TextStyle(
                              color: MyThemes.darkbluish, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// FOLLOWING CODE CREATE AN ARC

class CustomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.2, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
