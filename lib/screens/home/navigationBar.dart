import 'package:dummyapp/screens/home/homePage/mainHomepage.dart';

import 'package:dummyapp/screens/home/profile/profilePage.dart';
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
        Padding(
          padding: EdgeInsets.only(
              top: screenhight * 0.02,
              bottom: screenhight * 0.02,
              right: screenwidth * 0.05,
              left: screenwidth * 0.05),
          child: Align(
            alignment: Alignment(0, 1),
            child: Container(
              height: screenhight * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenhight * 0.032),
                color: Color(0xff323232),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
