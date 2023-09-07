import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNavigationBarProvider with ChangeNotifier {
  IconData _home = Icons.home_outlined;
  IconData get home => _home;
  int _pageindex = 0;
  int get pageindex => _pageindex;

  void changeColor(int index) {
    switch (index) {
      case 0:
        print('zero!');
        break; // The switch statement must be told to exit, or it will execute every case.
      case 1:
        print('one!');
        break;
      case 2:
        print('two!');
        break;
      case 3:
        print('three!');
        break;
      case 4:
        print('four!');
        break;
      default:
        print('choose a different number!');
    }
  }
}
