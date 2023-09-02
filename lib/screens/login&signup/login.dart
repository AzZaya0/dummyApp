import 'package:dummyapp/provider/loginPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logprov = Provider.of<LoginPageProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Text(
              'login',
              style: TextStyle(fontSize: 40),
            ),
          )),
          Center(
            child: GestureDetector(
              onTap: () {
                logprov.SigninwithGoogle();
              },
              // child: Image.asset(
              //   'lib/assets/icons/google.png',
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
