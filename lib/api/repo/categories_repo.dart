import 'package:dio/dio.dart';
import 'package:e_commerce_app/modles/category_model.dart';
import '../../modles/product_model.dart';
import '../controllers/categories_controller.dart';
import '../controllers/products_controller.dart';

class CategoriesRepo{

  static Future<dynamic> getAllCategoriesRequest() async{
    Response response = await CategoriesController.getAllCategoriesRequest();

    if(response.statusCode == 200){
      print(response.statusCode);
      return (response.data).map((e) => CategoryModel.fromJson(e)).toList();
    }
    return null;
  }

  static Future<CategoryModel?> getSingleCategoryRequest(int id) async{
    Response response = await CategoriesController.getSingleCategoryRequest(id);
    if(response.statusCode != 200){
      return CategoryModel.fromJson(response.data as Map<String, dynamic>);
    }
    return null;
  }
  static Future<dynamic> getAllProductsByCategoryRequest(int categoryID) async{
    Response response = await CategoriesController.getAllProductsByCategoryRequest(categoryID);
    if(response.statusCode == 200){
      print(response.statusCode);
      return (response.data).map((e) => ProductModel.fromJson(e)).toList();
    }
    return null;
  }
}