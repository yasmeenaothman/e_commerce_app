import 'package:e_commerce_app/helpers/color_helper.dart';
import 'package:e_commerce_app/modules/basic/home/popular_widget.dart';
import 'package:e_commerce_app/utils/app_text_style.dart';
import 'package:e_commerce_app/utils/constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'category/category_screen_controller.dart';
import 'category_widget.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeScreenController controller = Get.find<HomeScreenController>();
  CategoryScreenController categoryController = Get.find<CategoryScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: controller.isLoading && categoryController.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3.w,
                  color: ColorHelper.blue_126881,
                ),
              )
            : Column(
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
                            style: AppTextStyle.buildZillaSlabMediumTextStyle(
                                size: 20),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GetBuilder<CategoryScreenController>(
                            builder: (categoryController) => SizedBox(
                              height: 110.h,
                              child: listOfCategories(),
                            ),
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
                  GetBuilder<HomeScreenController>(
                    builder: (homeController) => Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 30.h),
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              controller.updateSelectedProduct(
                                  controller.products[index]);
                              controller.resetNum();
                              controller.setSliderIndex(0);
                              Get.toNamed(Constant.productDetailsScreen);
                            },
                            child: PopularProductWidget(
                                productModel: controller.products[index]),
                          ),
                          itemCount: controller.products.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 15.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
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
      itemBuilder: ((context, index) => InkWell(
        onTap: () async {
          categoryController.updateSelectedCategory(categoryController.categories[index]);
          categoryController.getAllProductsByCategoryRequest();
          Get.toNamed(Constant.categoryScreen);
        },
        child: CategoryWidget(
          categoryModel: categoryController.categories![index],
        ),
      )),
      itemCount: categoryController.categories!.length,
      separatorBuilder: (context, index) => SizedBox(
        width: 10.w,
      ),
    );
  }

}
