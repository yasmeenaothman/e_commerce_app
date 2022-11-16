import 'package:e_commerce_app/helpers/color_helper.dart';
import 'package:e_commerce_app/modules/basic/home/category/category_screen_controller.dart';
import 'package:e_commerce_app/modules/basic/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../utils/app_text_style.dart';
import '../../../../utils/constants/constant.dart';
import '../popular_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 30.w),
          child: GetBuilder<CategoryScreenController>(
            builder: (categoryController) =>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  '${categoryController.selectedCategory!.name}:',
                  style: AppTextStyle.buildZillaSlabMediumTextStyle(size: 20,),
                ),
                SizedBox(
                  height: 20.h,
                ),
                categoryController.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3.w,
                          color: ColorHelper.blue_126881,
                        ),
                      )
                    : GetBuilder<HomeScreenController>(
                        builder: (homeController) => Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                homeController.updateSelectedProduct(
                                  categoryController.categoryProducts[index],
                                );
                                homeController.resetNum();
                                homeController.setSliderIndex(0);
                                Get.toNamed(Constant.productDetailsScreen);
                              },
                              child: PopularProductWidget(
                                productModel:
                                    categoryController.categoryProducts[index],
                              ),
                            ),
                            itemCount:
                                categoryController.categoryProducts.length,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 15.h,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
