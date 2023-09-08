// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyImageButton extends StatelessWidget {
  MyImageButton({
    Key? key,
    required this.screenhight,
    required this.ontap,
    required this.imageUrl,
  }) : super(key: key);
  final double screenhight;
  final void Function()? ontap;
  final dynamic imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: screenhight,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(200)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
