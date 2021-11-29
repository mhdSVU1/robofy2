import 'package:cloud_firestore/cloud_firestore.dart';

class ModelUser {
  static const String collections_users = 'Users';

  static const String EMAIL = 'email';
  static const String PHONE_NUMBER = 'phoneNumber`';
  static const String NAME = 'name';
  static const String ID = 'id';

  String email;
  String phoneNumber;
  String name;
  String id;

  ModelUser({this.email, this.phoneNumber, this.name, this.id});

  ModelUser.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    var data = doc.data() as Map<String, dynamic>;
    if (data != null) {//TODO
      email = data[EMAIL];
      name = data[NAME];
      id = data[ID];
      phoneNumber = data[PHONE_NUMBER];
    }
  }

  Map toJson() => {
        EMAIL: email,
        PHONE_NUMBER: phoneNumber,
        NAME: name,
        ID: id,
      };
}
