import 'package:dummyapp/provider/loginPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LoginPageProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                prov.googleSignIn();
              },
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
