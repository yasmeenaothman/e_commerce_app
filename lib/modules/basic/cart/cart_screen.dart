import 'package:e_commerce_app/helpers/assets_helper.dart';
import 'package:e_commerce_app/helpers/color_helper.dart';
import 'package:e_commerce_app/modules/basic/cart/cart_item.dart';
import 'package:e_commerce_app/utils/static_methods.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_text_style.dart';
import '../../../utils/constants/constant.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../home/home_screen_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (homeController) => homeController.cartProducts.isEmpty
          ? StaticMethods.messageWidget(Constant.noProductsCart)
          : Scaffold(
        backgroundColor: ColorHelper.greyF6F6F7,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: homeController.cartProducts.length,
                  itemBuilder: (context, index) => CartItem(cartModel: homeController.cartProducts[index],),
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constant.total,
                      style: AppTextStyle.buildNunitoSansBoldTextStyle(
                        color: ColorHelper.blue_7A8D9C,
                        size: 16,
                      ),
                    ),
                    Text(
                      '\$${StaticMethods.calTotalPrice(homeController.cartProducts)}',
                      style: AppTextStyle.buildNunitoSansSemiBoldTextStyle(
                        color: ColorHelper.pinkE4126B,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w,vertical: 10.h),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    onPressed: (){
                    },
                    btnName: Constant.checkOut,
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
