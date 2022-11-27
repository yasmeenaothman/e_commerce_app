import 'package:e_commerce_app/helpers/assets_helper.dart';
import 'package:e_commerce_app/helpers/color_helper.dart';
import 'package:e_commerce_app/utils/app_text_style.dart';
import 'package:e_commerce_app/utils/static_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/constant.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    Key? key,
    required this.onChanged,
    required this.onSelected,
  }) : super(key: key);
  Function(String) onChanged;
  Function(String) onSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      padding: EdgeInsetsDirectional.only(start: 13.w,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17.5.r),
      ),
      child: TextField(
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        style: AppTextStyle.buildNunitoSansRegularTextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          suffixIcon: _buildPopupMenuButton(),
          /*StaticMethods.svgPictureWidget(
            () {},
            AssetsHelper.searchIcon,
          )*/
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          hintText: Constant.search,
          hintStyle: AppTextStyle.buildNunitoSansRegularTextStyle(
            color: ColorHelper.greyACBAC3,
          ),
        ),
      ),
    );
  }
  Widget _buildPopupMenuButton(){
    return PopupMenuButton(
      onSelected: onSelected,
      icon: Icon(Icons.arrow_drop_down,size: 24.r,color: ColorHelper.blue_126881,),
      itemBuilder: (BuildContext bc) {
        return Constant.menuItems.map((e) => PopupMenuItem(
          value: e,
          textStyle: AppTextStyle.buildQuickSandBoldTextStyle(),
          child: Text(e,),
        ),
        ).toList();
        /*[
          PopupMenuItem(
            value: Constant.category,
            textStyle: AppTextStyle.buildQuickSandBoldTextStyle(),
            child: const Text("category",),
          ),
          PopupMenuItem(
            value: Constant.products,
            textStyle: AppTextStyle.buildQuickSandBoldTextStyle(),
            child: const Text("product name",),
          ),
        ];*/
      },
    );
  }
}
