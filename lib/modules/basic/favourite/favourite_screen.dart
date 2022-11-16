import 'package:e_commerce_app/modules/basic/favourite/favourite_item.dart';
import 'package:e_commerce_app/utils/constants/constant.dart';
import 'package:e_commerce_app/utils/static_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../home/home_screen_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeScreenController>(
          builder: (homeController) => homeController.favouriteProducts.isEmpty
              ? StaticMethods.messageWidget(Constant.noFavourite)
              : GridView(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: _buildSliverGrid(),
                  padding: EdgeInsetsDirectional.all(20.w),
                  shrinkWrap: true,
                  children: homeController.favouriteProducts
                      .map((e) => FavouriteItem(favouriteModel: e,),).toList(),
                ),
        ),
      ),
    );
  }
  _buildSliverGrid(){
    return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 10.h,
        mainAxisExtent: 262.h
    );
  }
}
