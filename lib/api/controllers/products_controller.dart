import 'package:e_commerce_app/utils/constants/constant.dart';
import 'package:get/get.dart';

import '../dio_helper.dart';

class ProductsController extends GetxController{
  static Future getAllProductsRequest(){
    return dioHelper().get(Constant.productsUrl);
  }
  static Future getSingleProductRequest(int id){
    return dioHelper().get('${Constant.productsUrl}/$id');
  }
}