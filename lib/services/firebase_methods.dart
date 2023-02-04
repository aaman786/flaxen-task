// import 'package:auth_flaxen/model/user_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthMethods {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // get user details
//   Future<UserModel> getUserDetails() async {
//     User currentUser = _auth.currentUser!;

//     DocumentSnapshot documentSnapshot =
//         await _firestore.collection('users').doc(currentUser.uid).get();

//     return UserModel.fromSnap(documentSnapshot);
//   }

//   // Signing Up User

//   Future<String> signUpUser({
//     required String email,
//     required String username,
//     required String password,
//     required String contact,
//     required String gender,
//   }) async {
//     String res = "Some error Occurred";
//     try {
//       if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
//         // registering user in auth with email and password
//         UserCredential cred = await _auth.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );

//         UserModel _user = UserModel(
//           username: username,
//           uid: cred.user!.uid,
//           email: email,
//           gender: gender,
//           contact: contact,
//         );

//         // adding user in our database
//         await _firestore
//             .collection("users")
//             .doc(cred.user!.uid)
//             .set(_user.toMap());

//         res = "success";
//       } else {
//         res = "Please enter all the fields";
//       }
//     } catch (err) {
//       return err.toString();
//     }
//     return res;
//   }

  // // logging in user
  // Future<String> loginUser({
  //   required String email,
  //   required String password,
  // }) async {
  //   String res = "Some error Occurred";
  //   try {
  //     if (email.isNotEmpty || password.isNotEmpty) {
  //       // logging in user with email and password
  //       await _auth.signInWithEmailAndPassword(
  //         email: email,
  //         password: password,
  //       );
  //       res = "success";
  //     } else {
  //       res = "Please enter all the fields";
  //     }
  //   } catch (err) {
  //     return err.toString();
  //   }
  //   return res;
  // }

//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }
