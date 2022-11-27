import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/color_helper.dart';
import '../utils/app_text_style.dart';
import '../utils/constants/constant.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.btnName,
  }) : super(key: key);
  VoidCallback onPressed;
  String btnName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: ColorHelper.blue_126881,
        fixedSize: Size(double.infinity,60.h),
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
      ),
      child: Text(
        btnName,
        style: AppTextStyle.buildQuickSandBoldTextStyle(
          color: Colors.white,
          size: 14,
        ),
      ),
    );
  }
}
