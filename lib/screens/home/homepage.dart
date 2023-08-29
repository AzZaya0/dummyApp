import 'package:dummyapp/provider/homePageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provs = Provider.of<homePageProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("dummy app"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  provs.signout();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 40,
                ))
          ],
        ),
        body: Container(
          child: Text("Welcome back user"),
        ));
  }
}
