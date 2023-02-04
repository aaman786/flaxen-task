class UserModel {
  final String username;
  final String email;
  final String contact;
  final String uid;
  final String gender;

  UserModel(
      {required this.username,
      required this.email,
      required this.contact,
      required this.uid,
      required this.gender});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'contact': contact,
      'uid': uid,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      contact: map['contact'] ?? '',
      uid: map['uid'] ?? '',
      gender: map['gender'] ?? '',
    );
  }

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, contact: $contact, uid: $uid, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.username == username &&
        other.email == email &&
        other.contact == contact &&
        other.uid == uid &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        contact.hashCode ^
        uid.hashCode ^
        gender.hashCode;
  }
}

// class UserModel {
//   final String username;
//   final String email;
//   final String contact;
//   final String uid;
//   final String gender;

//   const UserModel({
//     required this.username,
//     required this.uid,
//     required this.email,
//     required this.contact,
//     required this.gender,
//   });

//   static UserModel fromSnap(DocumentSnapshot snap) {
//     var snapshot = snap.data() as Map<String, dynamic>;

//     return UserModel(
//       username: snapshot["username"],
//       uid: snapshot["uid"],
//       email: snapshot["email"],
//       gender: snapshot["gender"],
//       contact: snapshot["contact"],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "username": username,
//         "uid": uid,
//         "email": email,
//         "gender": gender,
//         "contact": contact,
//       };
// }
