import 'package:flutter/material.dart';

import '../../helpers/assets_helper.dart';
import '../../modules/basic/basic_screen.dart';
import '../../modules/basic/cart/cart_screen.dart';
import '../../modules/basic/favourite/favourite_screen.dart';
import '../../modules/basic/home/category/category_screen.dart';
import '../../modules/basic/home/home_screen.dart';
import '../../modules/basic/home/product_details/product_details_screen.dart';

class Constant{
  static const size = Size(375,812);
  static const String apiBaseUrl = 'https://api.escuelajs.co/api/v1/';
  static const String productsUrl = 'products';
  static const String categoriesUrl = 'categories';

  // routes name
  static const homeScreen = '/HomeScreen';
  static const productDetailsScreen = '/ProductDetailsScreen';
  static const favouriteScreen = '/FavouriteScreen';
  static const cartScreen = '/CartScreen';
  static const basicScreen = '/BasicScreen';
  static const categoryScreen = '/CategoryScreen';

 // routes
  static final routes = {
    homeScreen : (_)=> HomeScreen(),
    productDetailsScreen : (_)=> ProductDetailsScreen(),
    favouriteScreen : (_)=> const FavouriteScreen(),
    cartScreen : (_)=> const CartScreen(),
    basicScreen : (_)=> const BasicScreen(),
    categoryScreen : (_)=> const CategoryScreen(),
  };

  static List screens = [
    HomeScreen(),
    const FavouriteScreen(),
    const CartScreen(),
  ];
  static List<Map<String, dynamic>> tabs = [
    { nameKey: home ,iconKey: AssetsHelper.homeIcon, widgetKey: HomeScreen()},
    { nameKey: favourite,iconKey: AssetsHelper.heartIconFill, widgetKey: const FavouriteScreen()},
    { nameKey: cart,iconKey: AssetsHelper.shopIconWithoutContainer, widgetKey: const CartScreen()},
  ];

  static const String idKey = "id";
  static const String titleKey = "title";
  static const String priceKey = "price";
  static const String descriptionKey = "description";
  static const String categoryKey = "category";
  static const String category = "Category";
  static const String imagesKey = "images";
  static const String nameKey = "name";
  static const String widgetKey = "widget";
  static const String iconKey = "icon";
  static const String imageKey = "image";
  static const String noCategories = "No Categories";
  static const String noProducts = "No Products";
  static const String noFavourite = "No Favourite Products Yet !!";
  static const String noProductsCart = "No Products in cart Yet !!";
  static const String sureConnection = "sure from your connection";
  static const String popular = "Popular";
  static const String description = "Description:";
  static const String addToCart = "ADD TO CART";
  static const String quantity = "Quantity:";
  static const String subTotal = "Sub Total :";
  static const String checkOut = "CHECK OUT";
  static const String total = "Total:";
  static const String home = "Home";
  static const String favourite = "Favourite";
  static const String cart = "Cart";
  static const String delete = "Delete";
  static const String add = "Add";
  static const String addDone = "The Product Has Been Successfully Added To The";
  static const String deleteDone = "The Product Has Been Successfully Deleted";

}