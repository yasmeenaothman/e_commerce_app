import 'package:e_commerce_app/modles/favourite_model.dart';
import 'package:e_commerce_app/utils/constants/constant.dart';
import 'package:e_commerce_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../helpers/assets_helper.dart';
import '../../../../helpers/color_helper.dart';
import '../../../../modles/cart_model.dart';
import '../../../../utils/app_text_style.dart';
import '../../../../utils/static_methods.dart';
import '../../../../widgets/images_slider.dart';
import '../../../../widgets/spin_box_idget.dart';
import '../home_screen_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key}) : super(key: key);
  HomeScreenController homeController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeScreenController>(
        builder: (homeController) =>SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImagesSlider(
                widget: Container(
                  height: 300.h,
                  decoration: _buildBoxDecoration(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StaticMethods.svgPictureWidget(
                              () {
                            Get.offAndToNamed(Constant.basicScreen);
                          },
                          AssetsHelper.backIcon,
                        ),
                        StaticMethods.svgPictureWidget(
                              () {
                            FavouriteModel favouriteProduct =FavouriteModel(
                              title: homeController.selectedProduct!.title,
                              price: homeController.selectedProduct!.price,
                              img: homeController.selectedProduct!.images[0],
                            );
                            StaticMethods.checkFavourite(homeController, favouriteProduct);
                          },
                          homeController.favouriteProducts.any((element) => element.title == homeController.selectedProduct!.title)
                              ? AssetsHelper.heartIconFill
                              : AssetsHelper.heartIcon,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      homeController.selectedProduct!.title,
                      style: AppTextStyle.buildZillaSlabMediumTextStyle(
                        color: ColorHelper.grey_57636F,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 30.w),
                    child: Text(
                      Constant.description,
                      style: AppTextStyle.buildNunitoSansBoldTextStyle(
                        color: ColorHelper.blue_7A8D9C,
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      homeController.selectedProduct!.description,
                      style: AppTextStyle.buildNunitoSansRegularTextStyle(
                        size: 14,
                      ),
                    ),
                  ),

                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            Constant.quantity,
                            style: AppTextStyle.buildNunitoSansBoldTextStyle(
                              color: ColorHelper.blue_7A8D9C,
                              size: 16,
                            ),
                          ),
                        ),
                        SpinBoxWidget(homeController: homeController,)
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${homeController.selectedProduct!.price}',
                style: AppTextStyle.buildNunitoSansSemiBoldTextStyle(
                  color: ColorHelper.blue_126881,
                  size: 30,
                ),
              ),
              CustomElevatedButton(
                onPressed: (){
                  CartModel? cartModel = homeController.cartProducts.firstWhereOrNull((element) => element.title == homeController.selectedProduct!.title);
                  if(cartModel!=null){
                    cartModel.quantity+= homeController.num;
                    homeController.insertProductToCart(cartModel);
                    return;
                  }
                  homeController.insertProductToCart(CartModel(
                    title: homeController.selectedProduct!.title,
                    quantity: homeController.num,
                    price: (homeController.selectedProduct!.price),
                    img: homeController.selectedProduct!.images[0],
                  ));
                 /* homeController.insertProductToCart(CartModel(
                    title: homeController.selectedProduct!.title,
                    quantity: homeController.num,
                    price: homeController.selectedProduct!.price,
                    img: homeController.selectedProduct!.images[0],
                  ));*/
                },
                btnName: Constant.addToCart,
              ),
            ],
          ),
        ),
      ],

    );
  }


   _buildBoxDecoration(){
    return BoxDecoration(
      color: ColorHelper.greyF6F6F7,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.r),
        bottomRight: Radius.circular(20.r),
      ),
      image: DecorationImage(
        image: NetworkImage(homeController.selectedProduct!.images[homeController.sliderIndex]),
        fit: BoxFit.fill
      )
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
