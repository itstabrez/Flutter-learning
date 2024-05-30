import 'package:flutter/material.dart';

import 'package:flutter_application_2/model/electronics_catalog.dart';
import 'package:flutter_application_2/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          price: catalog.price.toString(),
        ),
        backgroundColor: context.canvasColor,
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
                  color: context.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 40),
                    child: Column(
                      children: [
                        Text(
                          catalog.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Text(
                          catalog.desc,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "dataOf chamber theeby the tempter of is to shall visiter sitting. A said unseen floor my, take yore a madam respiterespite, my betook my and obeisance, a i sitting raven in ungainly eyes what nevermore have, from i our tapping stern flown that had. That dreaming utters form shall his.My soul i beguiling my of curtain i many the me, i i thee evilprophet gently. Whom from hath i.",
                          style: TextStyle(
                            fontFamily: "lato",
                          ),
                        )
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

// BOTTOM PRICE AND BUY BUTTON NAVIGATION BAR

class MyBottomNavigationBar extends StatelessWidget {
  final String price;

  const MyBottomNavigationBar({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$$price",
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(MyThemes.darkbluish),
              ),
              onPressed: () {},
              child: const Text(
                "Add to cart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
