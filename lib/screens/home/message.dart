// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dummyapp/utils/constants.dart';
import 'package:dummyapp/widgets/myIconBtn.dart';

class MessagePage extends StatefulWidget {
  MessagePage({
    Key? key,
    required this.ontap,
  }) : super(key: key);
  void Function()? ontap;

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: Row(
          children: [
            MyIconBtn(ontap: widget.ontap, icons: Icons.arrow_back),
            SizedBox(
              width: 20,
            ),
            Text('MessagePage')
          ],
        ),
      ),
    );
  }
}
