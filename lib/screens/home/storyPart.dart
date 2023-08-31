// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dummyapp/database/getUsers.dart';
import 'package:dummyapp/model/userModel.dart';

class StortPage extends StatelessWidget {
  StortPage({
    Key? key,
    required this.screenhight,
    required this.screenwidth,
  }) : super(key: key);
  final double screenhight;
  final double screenwidth;
  @override
  Widget build(BuildContext context) {
    List<UserModel> datalist = [];
    return StreamBuilder(
        stream: getallusers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.docs;
            datalist = data
                .map(
                    (e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
                .toList();
            return _lisBuilder(
                datalist.length, datalist, screenwidth, screenhight);
          }
          return Container(
            height: 100,
            width: 100,
          );
        });
  }

// item for stream buider added----------------------------------------------------//
  Widget _lisBuilder(
      itemCount, List<UserModel> datalist, screenwidth, screenhight) {
    return Container(
      height: screenhight * 0.15,
      width: screenwidth,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: screenwidth * 0.02,
                  left: screenwidth * 0.02,
                  top: screenhight * 0.015,
                  bottom: 0),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.network(
                        (datalist[index]).photoUrl,
                        height: screenhight * 0.1,
                        width: screenwidth * 0.2,
                        fit: BoxFit.fill,
                      )),
                  Text(
                    (datalist[index]).username,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
