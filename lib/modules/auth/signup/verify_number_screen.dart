import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helpers/color_helper.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/constants/constant.dart';

class VerifyNumberScreen extends StatelessWidget {
  const VerifyNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              SizedBox(
                height: 113.h,
              ),
              Text(
                Constant.verifyNum,
                style: AppTextStyle.buildZillaSlabMediumTextStyle(
                  color: ColorHelper.blue_126881,
                  size: 18,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                Constant.enterPinCode,
                style: AppTextStyle.buildNunitoSansRegularTextStyle(color: Colors.black,size: 16),
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
