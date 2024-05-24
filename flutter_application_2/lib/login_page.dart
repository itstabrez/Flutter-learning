import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool buttonChanged = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Username",
                          labelText: "Enter your Username"),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          labelText: "Enter your Password"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          buttonChanged = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        if (mounted) {
                          Navigator.pushNamed(
                              mounted ? context : context, MyRoutes.homeRoute);
                        }
                      },
                      child: AnimatedContainer(
                        height: 40,
                        width: buttonChanged ? 40 : 150,
                        duration: const Duration(seconds: 1),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(buttonChanged ? 40 : 20),
                          color: const Color.fromARGB(255, 133, 127, 237),
                        ),
                        alignment: Alignment.center,
                        child: buttonChanged
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
