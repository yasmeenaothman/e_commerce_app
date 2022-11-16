import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../modules/basic/home/home_screen_controller.dart';

class ImagesSlider extends StatelessWidget {
  ImagesSlider({
    Key? key,
    required this.widget,
  }) : super(key: key);
  Widget widget;
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeScreenController>(
      builder: (homeController)=> Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
                height: 351,
                reverse: true,
                viewportFraction: 1,
                onPageChanged: (index,reason){
                 homeController.setSliderIndex(index);
                }
            ),
            itemCount: homeController.selectedProduct!.images.length,
            itemBuilder: (context,index,x)=> widget,
          ),
          Positioned(
            bottom: 24,
            child: _buildIndicator(homeController.sliderIndex),
          ),
        ],
      ),
    );
  }
  Widget _buildIndicator(int index){
    return DotsIndicator(
      dotsCount: 3,
      position: index.toDouble(),
      reversed: true,
      decorator: DotsDecorator(
        size: Size(7.w,4.h),
        activeSize: Size(9.w,4.h),
        activeColor: ColorHelper.pinkE4126B,
        color: Colors.white,
        spacing: EdgeInsets.all(5.h),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      ),
    );
  }
}
