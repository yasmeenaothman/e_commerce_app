import 'package:e_commerce_app/helpers/assets_helper.dart';
import 'package:e_commerce_app/utils/static_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/color_helper.dart';
import '../../utils/app_text_style.dart';
import '../../utils/constants/constant.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../auth/auth_screen_controller.dart';

class BasicScreen extends StatefulWidget {
  const BasicScreen({Key? key}) : super(key: key);
  @override
  _BasicScreenState createState() => _BasicScreenState();
}
class _BasicScreenState extends State<BasicScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.greyF6F6F7,
      appBar: AppBar(
        shadowColor: ColorHelper.greyF6F6F7,
        elevation: 0,
        leading: StaticMethods.svgPictureWidget(
          () {
            setState(() {
              Get.find<AuthScreenController>().signOut();
            });
          },
          AssetsHelper.logoutIcon,
        ),
        title: Text(
          'My ${Constant.tabs[selectedIndex][Constant.nameKey]}',
          style: AppTextStyle.buildQuickSandBoldTextStyle(
            color: ColorHelper.blue_7A8D9C,
            size: 16,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Constant.screens[selectedIndex],
      ),
      bottomNavigationBar: CustomBottomNavbar(
        selectedIndex: selectedIndex,
        onTabChange: (index){
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      //bottomNavigationBar: ,
    );
  }
}