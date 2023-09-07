// ignore_for_file: prefer_const_constructors

import 'package:dummyapp/auth/authpage.dart';
import 'package:dummyapp/firebase_options.dart';
import 'package:dummyapp/provider/homePageProvider.dart';
import 'package:dummyapp/provider/loginPageProvider.dart';
import 'package:dummyapp/provider/navigationBarProvider.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginPageProvider()),
      ChangeNotifierProvider(create: (_) => homePageProvider()),
      ChangeNotifierProvider(create: (_) => MyNavigationBarProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    ),
  ));
}
