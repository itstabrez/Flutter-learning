import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/drawer_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue App"),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text("Catalogue App Interface"),
      ),
      drawer: MyDrawer(),
    );
  }
}
