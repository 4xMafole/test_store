import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'eComerce',
          style: TextStyle(
            fontSize: 70,
            color: Color.fromARGB(255, 31, 108, 114),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
