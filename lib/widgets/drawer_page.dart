import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: DrawerHeader(
          child: ListBody(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Tabrez Alam"),
              accountEmail: Text("tabrezamrath@gmail.com"))
        ],
      )),
    );
  }
}
