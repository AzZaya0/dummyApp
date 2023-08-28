import 'package:dummyapp/database/userDB.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPageProvider with ChangeNotifier {
//

  SigninwithGoogle() async {
    //Open the google account window on device
    GoogleSignInAccount? guser = await GoogleSignIn().signIn();

    if (guser == null) {
      return;
    } else {
      final GoogleSignInAuthentication gauth = await guser.authentication;
      // creats the crediantial for user to login
      final credential = GoogleAuthProvider.credential(
          accessToken: gauth.accessToken, idToken: gauth.idToken);
      //provide the crediantial and login
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        if (await UserDB.checkuserLogin()) {
        } else {
          UserDB.createuser();
        }
      });
    }
  }
}
