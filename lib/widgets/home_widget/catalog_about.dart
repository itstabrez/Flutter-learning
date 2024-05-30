import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutCatalog extends StatelessWidget {
  final String name;
  final String desc;
  final String price;
  const AboutCatalog({
    super.key,
    required this.name,
    required this.desc,
    required this.price,
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
        ),
        const SizedBox(
          height: 7,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$$price",
              style: TextStyle(
                fontSize: 16,
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
                ),
              ),
            )
          ],
        ).w60(context)
      ],
    );
  }
}
