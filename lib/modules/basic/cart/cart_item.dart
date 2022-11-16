import 'package:e_commerce_app/modles/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helpers/assets_helper.dart';
import '../../../helpers/color_helper.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/constants/constant.dart';
import '../../../utils/static_methods.dart';
import '../../../widgets/spin_box_idget.dart';
import '../home/home_screen_controller.dart';


class CartItem extends StatelessWidget {
  CartItem({
    Key? key,
    required this.cartModel,
  }) : super(key: key);

  CartModel cartModel;
  HomeScreenController homeController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 12.h),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 114.h,
                  width: 114.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey[200],
                    image: DecorationImage(
                      image: NetworkImage(
                        cartModel.img,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 80.w,
                            child: Text(
                              cartModel.title,
                              style: AppTextStyle.buildZillaSlabMediumTextStyle(
                                color: ColorHelper.grey_57636F,
                                size: 14,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          StaticMethods.svgPictureWidget(
                            () {
                              homeController
                                  .removeProductFromCart(cartModel.id);
                            },
                            AssetsHelper.deleteIcon,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 50.w,
                            child: Text(
                              '\$${cartModel.price}',
                              style: AppTextStyle.buildNunitoSansRegularTextStyle(
                                color: ColorHelper.blue_126881,
                                size: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SpinBoxWidget(
                            homeController: homeController,
                            cartModel: cartModel,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Divider(
              thickness: 0.2.h,
              color: ColorHelper.greyACBAC3,
            ),
            SizedBox(
              height: 7.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  Constant.subTotal,
                  style: AppTextStyle.buildNunitoSansBoldTextStyle(
                    color: ColorHelper.grey_57636F,
                    size: 12,
                  ),
                ),
                SizedBox(
                  width: 34.w,
                ),
                Text(
                  '\$${cartModel.quantity * cartModel.price}',
                  style: AppTextStyle.buildNunitoSansBoldTextStyle(
                    color: ColorHelper.pinkE4126B,
                    size: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
