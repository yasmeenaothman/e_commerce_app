import 'package:e_commerce_app/helpers/assets_helper.dart';
import 'package:e_commerce_app/utils/app_text_style.dart';
import 'package:e_commerce_app/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../helpers/color_helper.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int) onTabChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3.h),
            blurRadius: 6.r,
            color: ColorHelper.greyACBAC3,
          )
        ],
      ),
      child: BottomNavigationBar(
          selectedLabelStyle: AppTextStyle.buildNunitoSansBoldTextStyle(
            size: 15
          ),
          unselectedLabelStyle: AppTextStyle.buildNunitoSansRegularTextStyle(
              color: ColorHelper.greyACBAC3
          ),
          selectedItemColor: ColorHelper.blue_126881,
          currentIndex: selectedIndex,
          onTap: onTabChange,
          items: Constant.tabs.map((e) =>
              _buildBottomNavigationItem(
                  iconName: e[Constant.iconKey],
                  label: e[Constant.nameKey]
              ),).toList()
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationItem(
      { required String iconName, required String label}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: SvgPicture.asset('${AssetsHelper.imgBaseURL}$iconName',
          fit: BoxFit.none,
          color: ColorHelper.greyACBAC3,
        ),
      ),
      label: label,
      activeIcon: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: SvgPicture.asset(
          '${AssetsHelper.imgBaseURL}$iconName',
          fit: BoxFit.none,
          color: ColorHelper.blue_126881,),
      ),
    );
  }
}
