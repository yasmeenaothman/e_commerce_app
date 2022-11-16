import 'package:e_commerce_app/helpers/color_helper.dart';
import 'package:e_commerce_app/modules/basic/home/popular_widget.dart';
import 'package:e_commerce_app/utils/app_text_style.dart';
import 'package:e_commerce_app/utils/constants/constant.dart';
import 'package:e_commerce_app/utils/static_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'category_widget.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeScreenController controller = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (homeController) {
        return Scaffold(
        body: SafeArea(
          child: controller.isLoading?const Center(child: CircularProgressIndicator()):Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: topPartContainerStyle(),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 30.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     /* Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SearchWidget(onChanged: (text) {
                            print(text);
                          }),
                          const SizedBox(
                            width: 6,
                          ),
                          //ShoppingIcon(onTap: () {})
                        ],
                      ),*/
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        Constant.category,
                        style: AppTextStyle.buildZillaSlabMediumTextStyle(size: 20),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 110.h,
                        child: listOfCategories(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                    ],
                  ),
                ),

              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 30.h),
                child: Text(
                  Constant.popular,
                  style: AppTextStyle.buildZillaSlabMediumTextStyle(
                    size: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 30.h),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        InkWell(
                          onTap: (){
                            controller.updateSelectedProduct(controller.products[index]);
                            controller.resetNum();
                            Get.toNamed(Constant.productDetailsScreen);
                          },
                          child: PopularProductWidget(productModel: controller.products[index]),
                        ),
                    itemCount: controller.products.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      },
    );
  }

  BoxDecoration topPartContainerStyle() {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r),),
      color: ColorHelper.greyF6F6F7,
    );
  }
  ListView listOfCategories() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) => CategoryWidget(
        categoryModel: controller.categories![index],
      )),
      itemCount: controller.categories!.length,
      separatorBuilder: (context, index) => SizedBox(
        width: 10.w,
      ),
    );
  }

 /* Widget _buildWidgetBasedOnStatus() {
    return controller.categories == null
        ? StaticMethods.messageWidget(Constant.sureConnection,)
        : controller.categories!.isEmpty
        ? StaticMethods.messageWidget(Constant.noCategories,)
        : listOfCategories();
  }*/
}
