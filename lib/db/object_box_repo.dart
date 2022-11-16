import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modles/favourite_model.dart';
import 'package:e_commerce_app/modles/product_model.dart';

import '../modles/cart_model.dart';

class ObjectBoxRepo{
  static List<FavouriteModel> getFavouriteProducts()=>objectBox.getProductsFromFavourite();

  static List<CartModel> getCartProducts()=>objectBox.getProductsFromCart();


  static insertProductToFavourite(FavouriteModel product) async {
    objectBox.insertProductToFavourite(product);
  }
  static insertProductToCart(CartModel product) async {
    objectBox.insertProductToCart(product);
  }

  static removeProductFromFavourite(int id) async {
    objectBox.deleteProductFromFavourite(id);
  }
  static removeProductFromCart(int id) async {
    objectBox.deleteProductFromCart(id);
  }

  /*static List<ProductModel> getFavouriteProducts()=>objectBox.getAllProducts();

  static List<ProductModel> getCartProducts()=>objectBox.getAllProductsFromCart();


  static insertProductToFavourite(ProductModel product) async {
    objectBox.insertProduct(product);
  }
  static insertProductToCart(ProductModel product, int quantity) async {
    objectBox.insertProductToCart(product,quantity);
  }

  static removeProductFromFavourite(int id) async {
    objectBox.deleteProduct(id);
  }
  static removeProductFromCart(int id) async {
    objectBox.deleteProductFromCart(id);
  }
  static removeAllProductFromFavourite() async {
    objectBox.deleteAllProduct();
  }
  static removeAllProductFromCart() async {
    objectBox.deleteAllProductFromCart();
  }*/
}