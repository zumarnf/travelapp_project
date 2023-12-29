import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String?> register({
    required String email,
    required String password,
    required String name,
    required String address,
    required String phone,
  }) async {
    try {
      UserCredential uc = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var id = uc.user!.uid;
      _firestore.collection("users").doc(id).set({
        "name": name,
        "address": address,
        "phone": phone,
      });
      return 'Registration Success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Login Success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
