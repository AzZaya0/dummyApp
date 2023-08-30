import 'package:dummyapp/database/getUsers.dart';
import 'package:dummyapp/provider/homePageProvider.dart';
import 'package:dummyapp/utils/constants.dart';
import 'package:dummyapp/widgets/myIconBtn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/userModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provs = Provider.of<homePageProvider>(context);
    List<UserModel> datalist = [];
    return Scaffold(
        body: Column(
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
                    .map((e) =>
                        UserModel.fromJson(e.data() as Map<String, dynamic>))
                    .toList();
                return _lisBuilder(datalist.length, datalist);
              }
              return Container();
            })
      ],
    ));
  }

  Widget _lisBuilder(itemCount, List<UserModel> datalist) {
    return Expanded(
        child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (ctx, index) {
              return Container(
                child: Text((datalist[index]).username),
              );
            }));
  }
}
