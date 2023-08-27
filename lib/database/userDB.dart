import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummyapp/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDB {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User user = auth.currentUser!;
  static String UsersUsername = user.email!.split('@')[0];
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<bool> checkuserLogin() async {
    return (await firestore.collection('users').doc(UsersUsername).get())
        .exists;
  }

  static Future<void> createuser() async {
    UserModel newUser = UserModel(
        username: UsersUsername,
        email: user.email.toString(),
        photoUrl: user.photoURL.toString(),
        number: user.phoneNumber.toString());
    firestore.collection('users').doc(UsersUsername).set(newUser.toJson());
  }
}
