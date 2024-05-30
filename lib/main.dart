import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/cart_page.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:flutter_application_2/widgets/theme.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      themeMode: ThemeMode.system,
      theme: MyThemes.darkTheme(context),

      title: "My App",
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.cartDetailsRoute: (context) => const MyCartPage(),
      },
    );
  }
}
