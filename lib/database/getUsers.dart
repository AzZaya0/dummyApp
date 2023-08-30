import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummyapp/database/userDB.dart';

Stream<QuerySnapshot> getallusers() {
  return UserDB.firestore.collection('users').snapshots();
}
