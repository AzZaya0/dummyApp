import 'package:dummyapp/screens/home/homePage/homepage.dart';
import 'package:dummyapp/screens/home/homePage/message.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      controller: _controller,
      children: [
        HomePage(),
        MessagePage(ontap: () {
          _controller.previousPage(
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        })
      ],
    );
  }
}
