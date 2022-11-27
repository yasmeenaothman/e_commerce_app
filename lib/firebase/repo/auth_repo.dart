import 'package:e_commerce_app/firebase/controllers/auth_controller.dart';
import 'package:e_commerce_app/utils/constants/constant.dart';
import 'package:e_commerce_app/utils/static_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
}