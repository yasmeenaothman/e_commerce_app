import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesSlider extends StatelessWidget {
  ImagesSlider({
    Key? key,
    required this.images,
  }) : super(key: key);
  List images;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              height: 351,
              reverse: true,
              viewportFraction: 1,
              onPageChanged: (index,reason){
               /* setState(() {
                  this.index= index;
                });*/
              }
          ),
          itemCount: images.length,
          itemBuilder: (context,index,x)=>Image.asset(images[index],fit: BoxFit.cover,),
        ),
        Positioned(
          bottom: 24,
          child: _buildIndicator(),
        ),
      ],
    );
  }
  Widget _buildIndicator(){
    return DotsIndicator(
      dotsCount: 3,
      //position: index.toDouble(),
      reversed: true,
      decorator: DotsDecorator(
        size: Size(7.w,4.h),
        activeSize: Size(9.w,4.h),
        activeColor: Colors.white,
        spacing: EdgeInsets.all(5.h),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      ),
    );
  }
}
