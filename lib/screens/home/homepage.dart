import 'package:dummyapp/database/getUsers.dart';
import 'package:dummyapp/provider/homePageProvider.dart';
import 'package:dummyapp/utils/constants.dart';
import 'package:dummyapp/widgets/myIconBtn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/userModel.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenhight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    final provs = Provider.of<homePageProvider>(context);
    List<UserModel> datalist = [];
    return Scaffold(
        backgroundColor: kprimaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              title: Text("dummy app"),
              backgroundColor: kprimaryColor,
              actions: [
                MyIconBtn(
                    ontap: provs.signout, icons: Icons.favorite_border_rounded),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: MyIconBtn(ontap: provs.signout, icons: Icons.message),
                )
              ],
            ),
            StreamBuilder(
                stream: getallusers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!.docs;
                    datalist = data
                        .map((e) => UserModel.fromJson(
                            e.data() as Map<String, dynamic>))
                        .toList();
                    return _lisBuilder(
                        datalist.length, datalist, screenwidth, screenhight);
                  }
                  return Container(
                    height: 100,
                    width: 100,
                  );
                })
          ],
        ));
  }

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
                  right: screenwidth * 0.02, left: screenwidth * 0.02),
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
