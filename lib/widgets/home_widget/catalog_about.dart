import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/theme.dart';

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
          style: TextStyle(
            color: MyThemes.darkbluish,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          desc,
          style: TextStyle(
            color: MyThemes.darkbluish,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$$price",
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(MyThemes.darkbluish),
              ),
              onPressed: () {},
              child: const Text(
                "Buy",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
