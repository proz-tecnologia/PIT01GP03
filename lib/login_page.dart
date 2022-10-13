import 'package:flutter/material.dart';
import 'package:projeto_flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 193, 192),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(120)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Image.asset(
                          "build/images/porkin-logo.png",
                          height: 250,
                          width: 250,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const CustomEmailTextField(),
              const CustomPasswordTextField(),
              const CustomButton(),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ?"),
                  GestureDetector(
                    onTap: () => {},
                    child: const Text(" Register Now",
                        style: TextStyle(
                            color: Color.fromARGB(224, 160, 62, 62),
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
