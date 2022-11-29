import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/constants/constant.dart';

class AuthController{
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static Future<UserCredential> signUpWithEmailAndPass(String email,String password){
    return firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future<UserCredential> signInWithEmailAndPassword(String email,String password){
    return firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
  static Future<void> sendSignInWithEmailLink(String email){
    return firebaseAuth.sendSignInLinkToEmail(
       email: email,
      actionCodeSettings: ActionCodeSettings(
        url: Constant.emailLinkUrl,
        handleCodeInApp: true,
        androidPackageName: Constant.packageName,
      ),
    );
  }

  static Future<UserCredential> signInWithEmailLink(String email, String emailLink ){
    return firebaseAuth.signInWithEmailLink(email: email, emailLink: emailLink);
  }
  static bool isSignInWithEmailLink(String emailLink ){
    return firebaseAuth.isSignInWithEmailLink(emailLink);
  }

}