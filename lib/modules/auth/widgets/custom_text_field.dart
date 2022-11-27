import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../helpers/color_helper.dart';
import '../../../utils/app_text_style.dart';
import '../auth_screen_controller.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      //required this.onChanged,
      required this.controller,
      this.suffixIcon,})
      : super(key: key);
  final String hintText;
  final Widget? suffixIcon;
  //final Function(String) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 62.h,
        padding: EdgeInsetsDirectional.only(start: 20.w, end: 10.w),
        decoration: BoxDecoration(
          color: ColorHelper.greyF6F6F7,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: TextField(
          //onChanged: onChanged,
          controller: controller,
          obscureText: suffixIcon!=null?!(Get.find<AuthScreenController>().isPassVisible):false,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h,),
            hintText: hintText,
            hintStyle: AppTextStyle.buildNunitoSansRegularTextStyle(
              color: ColorHelper.greyACBAC3,
              size: 14,
            ),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      );
  }
}
