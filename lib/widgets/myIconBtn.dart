// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyIconBtn extends StatelessWidget {
  void Function()? ontap;
  IconData icons;
  MyIconBtn({
    Key? key,
    required this.ontap,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Icon(
        icons,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
