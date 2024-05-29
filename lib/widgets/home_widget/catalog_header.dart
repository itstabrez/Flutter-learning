import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/theme.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: MyThemes.darkbluish,
          ),
        ),
        const Text(
          "Trending Products",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
