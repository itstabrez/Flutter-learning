import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool buttonChanged = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        buttonChanged = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(
          mounted ? context : context, MyRoutes.homeRoute);
      setState(() {
        buttonChanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/Images/login_page.png",
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Welcome to Login Page",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 40),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Username",
                              labelText: "Enter your Username"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a username";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Password",
                              labelText: "Enter your Password"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your password";
                            } else if (value.length < 6) {
                              return "Password length should be atleast 6 ";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Material(
                          color: Colors.blueAccent,
                          borderRadius:
                              BorderRadius.circular(buttonChanged ? 40 : 20),
                          child: InkWell(
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              height: 40,
                              width: buttonChanged ? 40 : 150,
                              duration: const Duration(seconds: 1),
                              alignment: Alignment.center,
                              child: buttonChanged
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
