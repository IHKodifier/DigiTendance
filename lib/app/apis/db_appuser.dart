import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_digitendance/app/models/app_user.dart';

import '../models/institution.dart';
import '../utilities.dart';

class DbAppUser {
  final db = FirebaseFirestore.instance;

  DbAppUser();
  Future createSignUpUserInDb({
    required AppUser appUser,
    // required String email,
    // String? photoURL,
    // List<UserRole>? roles,
    //  String? userId,

  }) async {}

  Future<String> createInstitution(Institution institution) async {
    var _docref = db.collection('instittutions').doc();
    institution.docRef = _docref;
    await db.collection('institutions').doc().set(institution.toMap()).then(
          (value) => Utils.log(
            'Instituioncreated ${institution.toString()}',
          ),
        );
    return _docref.path;
  }
}
