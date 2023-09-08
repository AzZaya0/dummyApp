import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNavigationBarProvider with ChangeNotifier {
  IconData _home = Icons.home;
  IconData get home => _home;
  IconData _search = Icons.search;
  IconData get search => _search;

  int _pageindex = 0;
  int get pageindex => _pageindex;

  void changeColor(int index, PageController _pageController) {
    _pageController.jumpToPage(index);
    switch (index) {
      case 0:
        _home = (_home == Icons.home) ? Icons.home_outlined : Icons.home;
        _search = (_search == Icons.search) ? Icons.search_off : Icons.search;
        print('zero!');
        break; // The switch statement must be told to exit, or it will execute every case.
      case 1:
        _home =
            (_home == Icons.home_outlined) ? Icons.home : Icons.home_outlined;
        _search = Icons.search_off;
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
    notifyListeners();
  }
}
