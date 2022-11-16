import 'package:e_commerce_app/modles/cart_model.dart';
import 'package:e_commerce_app/modles/favourite_model.dart';
import 'package:e_commerce_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../helpers/assets_helper.dart';
import '../helpers/color_helper.dart';
import '../modles/product_model.dart';
import '../modules/basic/home/home_screen_controller.dart';

class StaticMethods{
  static buildLightTheme(){
    return ThemeData.light().copyWith(primaryColor: ColorHelper.blue_126881);
  }

  static changeStatusBar(){
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorHelper.greyF6F6F7,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
  static Widget messageWidget(String msg){
    return Center(child: Text(msg,style: AppTextStyle.buildZillaSlabMediumTextStyle(),));
  }
  static svgPictureWidget(VoidCallback onPressed,String path,){
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset('${AssetsHelper.imgBaseURL}$path',),
    );
  }
  static checkFavourite(HomeScreenController controller,FavouriteModel favouriteModel){
    if(controller.favouriteProducts.any((element) => element.title == favouriteModel.title)){
      int id = controller.favouriteProducts.firstWhere((element) => element.title == favouriteModel.title).id;
      controller.removeProductFromFavourite(id);
    }
    else{
      controller.insertProductToFavourite(favouriteModel);
    }
   /* controller.favouriteProducts.any((element) => element.title == favouriteModel.title)
        ? controller
        .removeProductFromFavourite(favouriteModel.id)
        : controller.insertProductToFavourite(favouriteModel);*/

    print(controller.favouriteProducts.length);
  }
  static int calTotalPrice(List<CartModel> cartProducts){
    int total = 0;
    cartProducts.forEach((element) => total+= element.price* element.quantity);
    return total;
  }
  static buildSnackBar(String title,String msg){
    return Get.snackbar(
      title,
      msg,
      colorText: ColorHelper.blue_126881,
    );
  }
}