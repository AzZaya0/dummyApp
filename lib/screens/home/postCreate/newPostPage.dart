import 'package:dummyapp/utils/constants.dart';
import 'package:flutter/material.dart';

class NewPostPage extends StatelessWidget {
  const NewPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: kprimaryColor, title: Text("postingPage")),
      body: Container(),
    );
  }
}
