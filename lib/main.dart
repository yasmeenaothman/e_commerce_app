import 'package:e_commerce_app/app/app_init.dart';
import 'package:e_commerce_app/utils/constants/constant.dart';
import 'package:e_commerce_app/utils/static_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'helpers/color_helper.dart';
import 'db/object_box_helper.dart';
import 'modules/basic/basic_screen.dart';
import 'modules/basic/home/home_screen.dart';

late ObjectBoxHelper objectBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBoxHelper.init();
  AppInit.init();
  /*objectBox = await ObjectBoxHelper.init();
  StaticMethods.changeStatusBar();*/
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
        home: const BasicScreen(),
        routes: Constant.routes,
      ),
    );
  }
}

