import 'package:dummyapp/screens/home/homePage/mainHomepage.dart';
import 'package:dummyapp/screens/home/profile/profilePage.dart';
import 'package:dummyapp/utils/constants.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  MyNavigationBar({super.key});
  PageController _pageController = PageController();
  List<Widget> _pages = [MainHomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    final screenhight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          children: _pages,
          physics: NeverScrollableScrollPhysics(),
        ),
        Align(
          alignment: Alignment(0, 1),
          child: Container(
            height: screenhight * 0.05,
            decoration: BoxDecoration(
              color: kprimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
