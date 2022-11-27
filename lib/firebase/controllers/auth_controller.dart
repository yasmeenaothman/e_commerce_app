import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController{
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static Future<UserCredential> signUpWithEmailAndPass(String email,String password){
    return firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future<UserCredential> signInWithEmailAndPassword(String email,String password){
    return firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
}