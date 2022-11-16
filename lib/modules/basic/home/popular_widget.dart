import 'package:e_commerce_app/helpers/assets_helper.dart';
import 'package:e_commerce_app/helpers/color_helper.dart';
import 'package:e_commerce_app/modles/cart_model.dart';
import 'package:e_commerce_app/modles/favourite_model.dart';
import 'package:e_commerce_app/utils/app_text_style.dart';
import 'package:e_commerce_app/utils/static_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../modles/product_model.dart';
import 'home_screen_controller.dart';

class PopularProductWidget extends StatelessWidget {
  const PopularProductWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        builder: (homeController)=> Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 132.h,
          child: Row(children: [
            Container(
              width: 105.w,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.grey[200],
                image: DecorationImage(
                  image: NetworkImage(productModel.images[0],),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  style: AppTextStyle.buildZillaSlabMediumTextStyle(
                    color: ColorHelper.grey_57636F,
                    size: 14,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  '\$${productModel.price}',
                  style: AppTextStyle.buildNunitoSansBoldTextStyle(
                    color: ColorHelper.blue_126881,
                    size: 18,
                  ),
                )
              ],
            )
          ]),
        ),
        Positioned(
          bottom: 20.h,
          right: 20.w,
          child: Row(
              children: [
                StaticMethods.svgPictureWidget(
                        () {
                          CartModel? cartModel = homeController.cartProducts.firstWhereOrNull((element) => element.title == productModel.title);
                          if(cartModel!=null){
                            cartModel.quantity++;
                            homeController.insertProductToCart(cartModel);
                            return;
                          }
                          homeController.insertProductToCart(CartModel(
                            title: productModel.title,
                            quantity: 1,
                            price: (productModel.price),
                            img: productModel.images[0],
                          ));
                        },
                        AssetsHelper.shopIcon,
                      ),
                SizedBox(width: 100.w,),
                StaticMethods.svgPictureWidget(
                  () {
                    if(homeController.favouriteProducts.any((element) => element.title == productModel.title)){
                      int id = homeController.favouriteProducts.firstWhere((element) => element.title == productModel.title).id;
                      homeController.removeProductFromFavourite(id);
                    }
                    else{
                      homeController.insertProductToFavourite(FavouriteModel(
                        title: productModel.title,
                        price: productModel.price,
                        img: productModel.images[0],
                      ));
                    }

                  print(homeController.favouriteProducts.length);

                  },
                  homeController.favouriteProducts.any((element) => element.title == productModel.title)
                      ? AssetsHelper.heartIconFill
                      : AssetsHelper.heartIcon,
                ),
              ],
            ),
        ),
      ],
        )
    );
  }
}