import 'package:dummyapp/provider/navigationBarProvider.dart';
import 'package:dummyapp/screens/home/homePage/mainHomepage.dart';
import 'package:dummyapp/screens/home/profile/profilePage.dart';
import 'package:dummyapp/utils/constants.dart';
import 'package:dummyapp/widgets/myIconBtn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyNavigationBar extends StatelessWidget {
  MyNavigationBar({super.key});
  PageController _pageController = PageController();
  List<Widget> _pages = [MainHomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    final povs = Provider.of<MyNavigationBarProvider>(context, listen: false);
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
            height: screenhight * 0.07,
            decoration: BoxDecoration(
              color: kprimaryColor,
            ),
            child: Consumer<MyNavigationBarProvider>(
                builder: (context, snapshot, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyIconBtn(
                      ontap: () {
                        snapshot.changeColor(0, _pageController);
                      },
                      icons: snapshot.home,
                      size: screenwidth * 0.1),
                  MyIconBtn(
                      ontap: () {
                        snapshot.changeColor(1, _pageController);
                      },
                      icons: snapshot.search,
                      size: screenwidth * 0.1),
                  MyIconBtn(
                      ontap: () {
                        snapshot.changeColor(2, _pageController);
                      },
                      icons: Icons.add_box_outlined,
                      size: screenwidth * 0.1),
                  MyIconBtn(
                      ontap: () {
                        snapshot.changeColor(3, _pageController);
                      },
                      icons: Icons.favorite_border,
                      size: screenwidth * 0.1),
                  MyIconBtn(
                      ontap: () {
                        snapshot.changeColor(4, _pageController);
                      },
                      icons: Icons.person_2_outlined,
                      size: screenwidth * 0.1),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
