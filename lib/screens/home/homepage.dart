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
      ),
      body: GestureDetector(
        onTap: () {
          provs.signout();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(14)),
                height: 100,
                width: 100,
                alignment: Alignment.center,
                color: Colors.deepPurpleAccent,
                child: Text("signout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
