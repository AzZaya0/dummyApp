import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNavigationBarProvider with ChangeNotifier {
  IconData _home=  Icons.home_outlined;
  IconData get home=>_home;

  void changeColor( int index) {
    
  }
}
