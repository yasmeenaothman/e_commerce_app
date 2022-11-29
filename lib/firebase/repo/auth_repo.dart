import 'package:e_commerce_app/firebase/controllers/auth_controller.dart';
import 'package:e_commerce_app/utils/constants/constant.dart';
import 'package:e_commerce_app/utils/static_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';

class AuthRepo{

  static Future<bool> signUpWithEmailAndPass(String email,String password)async {
    try{
      await AuthController.signUpWithEmailAndPass(email, password);
      return true;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == Constant.weakPass) {
        StaticMethods.showToast(Constant.weakPass);
      } else if (e.code == Constant.emailExisted) {
        StaticMethods.showToast((Constant.emailExisted));
      }
      else if (e.code == Constant.invalidEmail) {
        StaticMethods.showToast(Constant.invalidEmail);
      }
      return false;
    }catch (e) {
      StaticMethods.showToast(e.toString());
      return false;
    }
  }

  static Future<bool> signInWithEmailAndPassword(String email,String password)async{
    try{
      await AuthController.signInWithEmailAndPassword(email,password);
      return true;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == Constant.userNotFound) {
        StaticMethods.showToast(Constant.userNotFound);
      } else if (e.code == Constant.wrongPass) {
        StaticMethods.showToast(Constant.wrongPass);
      }
      else if (e.code == Constant.invalidEmail) {
        StaticMethods.showToast(Constant.invalidEmail);
      }
      return false;
    }on Exception catch (e) {
      StaticMethods.showToast(e.toString());
      return false;
    }

  }
  static Future<bool> sendSignInWithEmailLink(String email)async{
    try{
      await AuthController.sendSignInWithEmailLink(email);
      print('the email sent');
      StaticMethods.buildSnackBar(Constant.payAttention, Constant.checkEmail);
      return true;
    }catch (e) {
      StaticMethods.showToast(e.toString());
      return false;
    }

  }
  static Future<bool> signInWithEmailLink(String email, String emailLink)async{
    bool validLink = AuthController.isSignInWithEmailLink(emailLink);
    if(validLink){
      try{
        await AuthController.signInWithEmailLink(email,emailLink);
        return true;
      }catch (e) {
        StaticMethods.showToast(e.toString());
        return false;
      }
    }
    print('the link is not valid');
    return false;
  }
}