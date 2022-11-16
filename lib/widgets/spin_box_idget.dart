import 'package:e_commerce_app/modles/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/assets_helper.dart';
import '../helpers/color_helper.dart';
import '../modules/basic/home/home_screen_controller.dart';
import '../utils/app_text_style.dart';

class SpinBoxWidget extends StatelessWidget {
  SpinBoxWidget({
    Key? key,
    required this.homeController,
    this.cartModel,
  }) : super(key: key);

  HomeScreenController homeController;
  CartModel? cartModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(() {
          if(cartModel!=null){
            cartModel!.quantity--;
            cartModel!.quantity < 1
                ? homeController.removeProductFromCart(cartModel!.id)
                : homeController.insertProductToCart(cartModel!);
            return;
          }
          homeController.setNum(false);

        },AssetsHelper.lessIcon),
        Container(
          height: 30.h,
          width: 63.w,
          decoration: _buildBoxDecorationWithCounter(),
          child: Center(child: Text('${cartModel != null ?cartModel!.quantity:homeController.num}',style: AppTextStyle.buildQuickSandBoldTextStyle(),)),
        ),
        _buildIconButton(() {
          if(cartModel!=null){
            cartModel!.quantity++;
            homeController.insertProductToCart(cartModel!);
            return;
          }
          homeController.setNum(true);
        },AssetsHelper.addIcon),
      ],
    );
  }
  Widget _buildIconButton(VoidCallback onPressed, path){
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: 30.h,
        width: 30.h,
        decoration: _buildBoxDecorationWithCounter(),
        child: SvgPicture.asset('${AssetsHelper.imgBaseURL}$path',fit: BoxFit.none,),
      ),
    );
  }
  _buildBoxDecorationWithCounter(){
    return  BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: ColorHelper.greyF6F6F7,
    );
  }
}
