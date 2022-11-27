import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../helpers/assets_helper.dart';
import '../../utils/static_methods.dart';
import '../auth/auth_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
    .then((value) => Get.offAndToNamed(Get.find<AuthScreenController>().checkIsLogin()));//signInScreen
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('${AssetsHelper.imgBaseURL}${AssetsHelper.splashImg}',),
      ),
    );
  }
}
