// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:dummyapp/model/userModel.dart';

class MyStreamBuilder extends StatelessWidget {
  MyStreamBuilder({
    Key? key,
    required this.stream,
    required this.mainwidget,
  }) : super(key: key);
  final Stream<QuerySnapshot<Map<String, dynamic>>>? stream;
  final Widget mainwidget;

  @override
  Widget build(BuildContext context) {
    List<UserModel> userdata = [];
    return StreamBuilder(
        stream: stream,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.docs;
            userdata = data
                .map(
                    (e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
                .toList();
            return newWidget();
          }
          return Container();
        });
  }

  Widget newWidget() {
    return mainwidget;
  }
}
