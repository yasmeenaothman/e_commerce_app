import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../db/object_box_helper.dart';
import '../main.dart';
import '../modules/basic/home/category/category_screen_controller.dart';
import '../modules/basic/home/home_screen_controller.dart';
import '../utils/static_methods.dart';

class AppInit{
  static init() async {
    Get.put(HomeScreenController());
    Get.put(CategoryScreenController());
    StaticMethods.changeStatusBar();
  }
}