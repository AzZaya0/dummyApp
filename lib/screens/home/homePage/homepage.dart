import 'package:dummyapp/provider/homePageProvider.dart';

import 'package:dummyapp/utils/constants.dart';
import 'package:dummyapp/widgets/myIconBtn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenhight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    final provs = Provider.of<homePageProvider>(context);

    return Scaffold(
        backgroundColor: kprimaryColor,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppBar(
            title: Text("Dummy gram"),
            backgroundColor: kprimaryColor,
            actions: [
              MyIconBtn(
                  size: 40,
                  ontap: provs.signout,
                  icons: Icons.favorite_border_rounded),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: MyIconBtn(
                  ontap: provs.signout,
                  icons: Icons.message,
                  size: 40,
                ),
              )
            ],
          ),

          //Story Page buider added----------------------------------------------------//
          StortPage(screenhight: screenhight, screenwidth: screenwidth),
          Divider(
            color: ksubColor,
            thickness: 0.2,
          ),
          PostFeedPage(
            screenhight: screenhight,
            screenwidth: screenwidth,
          ) //---------------------------------------------------{ Post Feed Page}
        ]));
  }
}
