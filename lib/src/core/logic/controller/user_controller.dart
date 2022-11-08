import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static final authInstance = FirebaseAuth.instance;

  Rxn<User> _user = Rxn<User>();

  User? get user => _user.value;

  UserController() {
    authInstance.authStateChanges().listen((User? user) {
      _user.value = user;

      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });

    authInstance.userChanges().listen((User? user) {
      _user.value = user;

      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });
  }

  Future<dynamic> login(String email, String password) async {
    try {
      final credential = await authInstance.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
