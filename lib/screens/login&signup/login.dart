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
              child: Image.network(
                'data:image/png;base64,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',
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
