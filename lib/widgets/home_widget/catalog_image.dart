import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/theme.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: MyThemes.creamColor,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            width: 100,
            image,
          ),
        ),
      ),
    );
  }
}