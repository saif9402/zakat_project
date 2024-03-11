import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_zakat/provider/my_user.dart';


class DataBaseUtils {
  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
            fromFirestore: (snapshot, _) => MyUser.fomJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson());
  }

  static Future<void> createDBUser(MyUser user) async {
    return getUsersCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> readUser(String userId) async {
    var userDocSnapshot = await getUsersCollection().doc(userId).get();
    return userDocSnapshot.data();
  }

  static Future<void> updateUser(MyUser user) async {
    return getUsersCollection().doc(user.id).update(user.toJson());
  }
}
