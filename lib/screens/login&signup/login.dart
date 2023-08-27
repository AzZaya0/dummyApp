import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'lib/assets/icons/google.png',
                height: 100,
                width: 100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
