import 'package:e_commerce_app/modles/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../helpers/assets_helper.dart';
import '../../../helpers/color_helper.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/static_methods.dart';
import '../home/home_screen_controller.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({
    Key? key,
    required this.favouriteModel,
  }) : super(key: key);
  final FavouriteModel favouriteModel;
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeScreenController>(
      builder: (homeController) =>Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.grey[200],
                image: DecorationImage(
                  image: NetworkImage(favouriteModel.img,),
                  fit: BoxFit.fill,
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: StaticMethods.svgPictureWidget(
                      ()=>StaticMethods.checkFavourite(homeController,favouriteModel),
                  homeController.favouriteProducts.any((element) => element.title == favouriteModel.title)
                      ? AssetsHelper.heartIconFill
                      : AssetsHelper.heartIcon,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 90.w,
                  child: Text(
                    favouriteModel.title,
                    style: AppTextStyle.buildZillaSlabMediumTextStyle(
                      color: ColorHelper.grey_57636F,
                      size: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '\$${favouriteModel.price}',
                  style: AppTextStyle.buildNunitoSansBoldTextStyle(
                    color: ColorHelper.blue_126881,
                    size: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
