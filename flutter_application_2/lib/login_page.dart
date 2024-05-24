import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Center(
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
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          print("login Success");
                        },
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.black),
                        child: const Text("Submit"))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
