import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => Navigator.of(context).pushReplacementNamed('/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 193, 192),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 244, 193, 192),
                    Color.fromARGB(255, 247, 209, 209)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
          ),
          Center(
            child: Image.asset(
              "build/images/porkin-logo.png",
              height: 250,
              width: 250,
            ),
          )
        ],
      ),
    );
  }
}
