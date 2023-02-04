import 'package:auth_flaxen/model/user_model.dart';
import 'package:auth_flaxen/state_management/firebase_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/firebase_constant.dart';

final userRepositoryProvider = Provider((ref) {
  return UserRepository(firestore: ref.watch(firestoreProvider));
});

class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.userCollection);

  Stream<List<UserModel>> getAllUserData() {
    return _users.snapshots().map((event) {
      List<UserModel> allUsers = [];
      for (var doc in event.docs) {
        allUsers.add(UserModel.fromMap(doc.data() as Map<String, dynamic>));
      }
      return allUsers;
    });
  }
}
