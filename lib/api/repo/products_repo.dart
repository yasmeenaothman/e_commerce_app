import 'package:dio/dio.dart';
import '../../modles/category_model.dart';
import '../../modles/product_model.dart';
import '../../utils/constants/constant.dart';
import '../controllers/products_controller.dart';

class ProductsRepo{

  static Future<dynamic> getAllProductsRequest() async{
    Response response = await ProductsController.getAllProductsRequest();
    if(response.statusCode == 200){
      return (response.data).map((e) {
        ProductModel product = ProductModel.fromJson(e);
       // product.category.target = CategoryModel.fromJson(e[Constant.categoryKey]);
        return product;
      }).toList();
    }
    return null;
  }

  static Future<ProductModel?> getSingleProductRequest(int id) async{
    Response response = await ProductsController.getSingleProductRequest(id);
    if(response.statusCode != 200){
      ProductModel product = ProductModel.fromJson(response.data as Map<String, dynamic>);
      //product.category.target = CategoryModel.fromJson(response.data[Constant.categoryKey]);
      return product;
    }
    return null;
  }
}