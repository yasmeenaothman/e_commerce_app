import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/assets_helper.dart';
import '../../modules/auth/auth_screen_controller.dart';
import '../../modules/auth/signin/signin_screen.dart';
import '../../modules/auth/signup/signup_screen.dart';
import '../../modules/auth/signup/verify_number_screen.dart';
import '../../modules/basic/basic_screen.dart';
import '../../modules/basic/cart/cart_screen.dart';
import '../../modules/basic/favourite/favourite_screen.dart';
import '../../modules/basic/home/category/category_screen.dart';
import '../../modules/basic/home/home_screen.dart';
import '../../modules/basic/home/product_details/product_details_screen.dart';
import '../../modules/splash/splash_screen.dart';

class Constant{
  static const size = Size(375,812);
  static const String apiBaseUrl = 'https://api.escuelajs.co/api/v1/';
  static const String productsUrl = 'products';
  static const String categoriesUrl = 'categories';
  static final controller = Get.find<AuthScreenController>();
  // routes name
  static const splashScreen = '/splashScreen';
  static const signInScreen = '/signInScreen';
  static const signUpScreen = '/signUpScreen';
  static const homeScreen = '/HomeScreen';
  static const productDetailsScreen = '/ProductDetailsScreen';
  static const favouriteScreen = '/FavouriteScreen';
  static const cartScreen = '/CartScreen';
  static const basicScreen = '/BasicScreen';
  static const categoryScreen = '/CategoryScreen';
  static const verifyScreen = '/verifyNumberScreen';


  // routes
  static final routes = {
    splashScreen : (_)=> const SplashScreen(),
    homeScreen : (_)=> HomeScreen(),
    productDetailsScreen : (_)=> ProductDetailsScreen(),
    favouriteScreen : (_)=> const FavouriteScreen(),
    cartScreen : (_)=> const CartScreen(),
    basicScreen : (_)=> const BasicScreen(),
    categoryScreen : (_)=> const CategoryScreen(),
    signInScreen : (_)=> const SignInScreen(),
    signUpScreen : (_)=> const SignUpScreen(),
    verifyScreen : (_)=> const VerifyNumberScreen(),
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
  static const String emailKey = "email";
  static const String descriptionKey = "description";
  static const String categoryKey = "category";
  static const String category = "Categories";
  static const String imagesKey = "images";
  static const String nameKey = "name";
  static const String funKey = "function";
  static const String widgetKey = "widget";
  static const String iconKey = "icon";
  static const String imageKey = "image";
  static const String noCategories = "No Categories";
  static const String noProducts = "No Products";
  static const String noFavourite = "No Favourite Products Yet !!";
  static const String noProductsCart = "No Products in cart Yet !!";
  static const String sureConnection = "sure from your connection";
  static const String products = "Products";
  static const String productName = "product name";
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
  static const String search = "Search for a product....";
  static const String noResult = "No matching search results";
  static const String addDone = "The Product Has Been Successfully Added To The";
  static const String deleteDone = "The Product Has Been Successfully Deleted";
  static const verifyNum = 'Verify Your Mobile Number';
  static const enterPinCode = 'Enter The Pin You Have Received Via SMS On';
  static const signIn = 'Sign In';
  static const signUp = 'Sign UP';
  static const phoneNumber = 'Phone Number';
  static const email = 'Email';
  static const enterPhoneNum = 'Enter phone number';
  static const enterName = 'Enter Name';
  static const enterEmail = 'Enter Email';
  static const password = 'Password';
  static const createAccount = 'Create account';
  static const weakPass = 'weak-password';
  static const emailExisted = 'email-already-in-use';
  static const invalidEmail = 'invalid-email';
  static const fill = 'please...fill all fields';
  static const userNotFound = 'user-not-found';
  static const wrongPass = 'wrong-password';
  static const uid = 'uid';
  //static const List imagesPath = ['google_img.svg','facebook_icon.svg'];
  static List<String> menuItems = [
    categoryKey,
    productName,
  ];
  static List<Map<String,dynamic>> fBAndGoogle = [
    {iconKey: AssetsHelper.googleImg, funKey: controller.googleSignIn,},
    {iconKey: AssetsHelper.fBImg, funKey: controller.signInFB,},
  ];
}