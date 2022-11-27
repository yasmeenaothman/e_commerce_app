import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../firebase_options.dart';
import '../helpers/shared_prefe_helper.dart';
import '../modules/auth/auth_screen_controller.dart';
import '../modules/auth/signin/signin_screen.dart';
import '../modules/basic/basic_screen.dart';
import '../modules/basic/home/category/category_screen_controller.dart';
import '../modules/basic/home/home_screen_controller.dart';
import '../utils/static_methods.dart';

class AppInit{
  static init() async {
    /*await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );*/
    SharedPreferenceHelper.sharedHelper.initSharedPreferences();
    Get.put(HomeScreenController());
    Get.put(CategoryScreenController());
    Get.put(AuthScreenController());
    StaticMethods.changeStatusBar();}
}