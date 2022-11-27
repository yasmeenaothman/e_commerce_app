import 'package:e_commerce_app/utils/constants/constant.dart';
import 'package:get/get.dart';

import '../dio_helper.dart';

class CategoriesController{
  static Future getAllCategoriesRequest(){
    return dioHelper().get(Constant.categoriesUrl);
  }
  static Future getSingleCategoryRequest(int id){
    return dioHelper().get('${Constant.categoriesUrl}/$id');
  }
  static Future getAllProductsByCategoryRequest(int categoryID){
    return dioHelper().get('${Constant.categoriesUrl}/$categoryID/${Constant.productsUrl}');
  }
}