import 'package:e_commerce_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../modles/category_model.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 62.w,
          height: 62.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10.r,
            ),
            image: DecorationImage(
              image: NetworkImage(categoryModel.image,),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 50.w,
          child: Text(
            categoryModel.name,
            //maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyle.buildQuickSandBoldTextStyle(),
          ),
        ),
      ],
    );
  }
}