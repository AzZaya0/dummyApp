import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNavigationBarProvider with ChangeNotifier {
  IconData _home = Icons.home;
  IconData get home => _home;
  IconData _search = Icons.search;
  IconData get search => _search;

  IconData _post = Icons.add_box_outlined;
  IconData get post => _post;

  IconData _notification = Icons.favorite_border;
  IconData get notification => _notification;
  int _pageindex = 0;
  int get pageindex => _pageindex;

  void changeColor(int index, PageController _pageController) {
    _pageController.jumpToPage(index);
    switch (index) {
      case 0:
        _home = Icons.home;
        _search = Icons.search;
        _post = Icons.add_box_outlined;
        _notification = Icons.favorite_border;
        print('zero!');
        break; // The switch statement must be told to exit, or it will execute every case.
      case 1:
        _home = Icons.home_outlined;
        _search = Icons.search_off;
        _post = Icons.add_box_outlined;
        _notification = Icons.favorite_border;
        print('one!');
        break;
      case 2:
        _home = Icons.home_outlined;
        _search = Icons.search;
        _post = Icons.add_box;
        _notification = Icons.favorite_border;

        print('two!');
        break;
      case 3:
        _home = Icons.home_outlined;
        _search = Icons.search;
        _post = Icons.add_box_outlined;
        _notification = Icons.favorite;
        print('three!');
        break;
      case 4:
        _home = Icons.home_outlined;
        _search = Icons.search;
        _post = Icons.add_box_outlined;
        _notification = Icons.favorite_border;
        print('four!');
        break;
      default:
        print('choose a different number!');
    }
    notifyListeners();
  }
}
