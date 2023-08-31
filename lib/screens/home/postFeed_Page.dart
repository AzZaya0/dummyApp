// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:dummyapp/database/userDB.dart';
import 'package:dummyapp/model/userModel.dart';

class PostFeedPage extends StatelessWidget {
  PostFeedPage({
    Key? key,
    required this.screenwidth,
    required this.screenhight,
  }) : super(key: key);
  final double screenwidth;
  final double screenhight;

  @override
  Widget build(BuildContext context) {
    List<UserModel> userdata = [];
    return StreamBuilder(
        stream: UserDB.firestore.collection('users').snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.docs;
            userdata = data
                .map(
                    (e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
                .toList();
            return _listOfPost(
                userdata.length, userdata, screenwidth, screenhight, Index);
          }
          return Container();
        });
  }

  Widget _listOfPost(itemCount, userdata, screenwidth, screenhight, index) {
    return Expanded(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
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
                              (userdata[index]).photoUrl,
                              height: screenhight * 0.1,
                              width: screenwidth * 0.2,
                              fit: BoxFit.fill,
                            )),
                        Text(
                          (userdata[index]).username,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
