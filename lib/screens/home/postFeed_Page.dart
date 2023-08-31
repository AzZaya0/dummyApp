// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummyapp/screens/home/storyPart.dart';
import 'package:dummyapp/utils/constants.dart';
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

  Widget _listOfPost(
      itemCount, List<UserModel> userdata, screenwidth, screenhight, index) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: screenhight * 0.03),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: screenhight * 0.02, left: screenwidth * 0.05),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.network(
                            (userdata[index]).photoUrl,
                            height: screenhight * 0.05,
                            width: screenwidth * 0.1,
                            fit: BoxFit.fill,
                          )),
                      SizedBox(
                        width: screenwidth * 0.02,
                      ),
                      Text(
                        (userdata[index]).username,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
                Container(
                  height: screenhight * 0.4,
                  width: screenwidth,
                  child: Image.network(
                    (userdata[index]).photoUrl,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}