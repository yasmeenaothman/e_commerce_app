import 'package:e_commerce_app/helpers/assets_helper.dart';
import 'package:e_commerce_app/helpers/color_helper.dart';
import 'package:flutter/cupertino.dart';

class AppTextStyle{
  static buildNunitoSansBoldTextStyle({Color color= ColorHelper.blue_126881, double size = 14}){
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.nunitoSansFontFamily,
      fontWeight: FontWeight.w700,
    );
  }
  static buildNunitoSansRegularTextStyle({Color color= ColorHelper.blue_7A8D9C, double size = 12}){
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.nunitoSansFontFamily,
     // fontWeight: FontWeight.w400,
    );
  }
  static buildNunitoSansSemiBoldTextStyle({Color color= ColorHelper.blue_126881, double size = 18}){
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.nunitoSansFontFamily,
      fontWeight: FontWeight.w600,
    );
  }
  static buildQuickSandBoldTextStyle({Color color= ColorHelper.grey_57636F, double size = 12}){
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.quicksandFontFamily,
      fontWeight: FontWeight.w700,
    );
  }
  static buildZillaSlabMediumTextStyle({Color color= ColorHelper.blue_7A8D9C, double size = 12}){
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: AssetsHelper.zillaSlabFontFamily,
      fontWeight: FontWeight.w500,
    );
  }
}