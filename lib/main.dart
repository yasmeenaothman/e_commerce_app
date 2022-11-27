import 'package:e_commerce_app/app/app_init.dart';
import 'package:e_commerce_app/modules/auth/signin/signin_screen.dart';
import 'package:e_commerce_app/modules/splash/splash_screen.dart';
import 'package:e_commerce_app/utils/constants/constant.dart';
import 'package:e_commerce_app/utils/static_methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'firebase_options.dart';
import 'helpers/color_helper.dart';
import 'db/object_box_helper.dart';
import 'modules/auth/auth_screen_controller.dart';
import 'modules/basic/basic_screen.dart';
import 'modules/basic/home/home_screen.dart';

late ObjectBoxHelper objectBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  objectBox = await ObjectBoxHelper.init();
  AppInit.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Constant.size,
      builder: (_, child) => GetMaterialApp(
        theme: StaticMethods.buildLightTheme(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: Constant.routes,
      ),
    );
  }
}

