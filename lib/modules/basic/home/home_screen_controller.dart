import 'package:e_commerce_app/api/repo/products_repo.dart';
import 'package:e_commerce_app/modles/category_model.dart';
import 'package:e_commerce_app/modles/favourite_model.dart';
import 'package:e_commerce_app/modles/product_model.dart';
import 'package:e_commerce_app/utils/static_methods.dart';
import 'package:get/get.dart';

import '../../../api/repo/categories_repo.dart';
import '../../../db/object_box_repo.dart';
import '../../../modles/cart_model.dart';
import '../../../utils/constants/constant.dart';

class HomeScreenController extends GetxController{
 // dynamic categories =[];
  dynamic products =[];
  List<FavouriteModel> favouriteProducts =[];
  List<CartModel> cartProducts =[];
  dynamic searchResults =[];
  ProductModel? selectedProduct;
  bool isLoading = false;
  int num = 1;
  int sliderIndex = 0;
  bool isProductSelected = true;
 /* updateCategoriesList(List<CategoryModel> categories){
    this.categories = categories;
    update();
  }*/
  setNum(bool isAdd){
    isAdd? num++: num--;
    num <1 ? num =1:null;
    update();
  }
  updateIsProductSelected(bool isProductSelected){
    this.isProductSelected = isProductSelected;
    update();
  }
  resetNum(){
    num = 1;
    update();
  }
  setSliderIndex(int index){
    sliderIndex = index;
    update();
  }
  updateSelectedProduct(ProductModel selectedProduct){
    this.selectedProduct = selectedProduct;
    update();
  }
  setIsLoading(bool isLoading){
    this.isLoading = isLoading;
    update();
  }
  updateSearchResultsList(List searchResults){
    this.searchResults = searchResults;
    update();
  }
 /* getCategories() async {
    setIsLoading(true);
    categories = await CategoriesRepo.getAllCategoriesRequest();
    update();
    setIsLoading(false);
  }*/
  getProducts() async {
    setIsLoading(true);
    products = await ProductsRepo.getAllProductsRequest();
    searchResults = products;
    update();
    setIsLoading(false);
  }
  getFavouriteProducts() {
    favouriteProducts = ObjectBoxRepo.getFavouriteProducts();
    update();
  }
  getCartProducts() {
    cartProducts = ObjectBoxRepo.getCartProducts();
    update();
    print(cartProducts.length);
  }
  insertProductToFavourite(FavouriteModel product) {
    ObjectBoxRepo.insertProductToFavourite(product);
    getFavouriteProducts();
    StaticMethods.buildSnackBar(
      Constant.add,
      '${Constant.addDone} Favourite',
    );
  }
  removeProductFromFavourite(int id) {
    ObjectBoxRepo.removeProductFromFavourite(id);
    getFavouriteProducts();
    StaticMethods.buildSnackBar(
      Constant.delete,
      Constant.deleteDone,
    );
  }
  removeProductFromCart(int id) {
    ObjectBoxRepo.removeProductFromCart(id);
    getCartProducts();
    StaticMethods.buildSnackBar(
      Constant.delete,
      Constant.deleteDone,
    );
  }
 /* removeAllProductFromFavourite() {
    ObjectBoxRepo.removeAllProductFromFavourite();
    getFavouriteProducts();
  }
  removeAllProductFromCart() {
    ObjectBoxRepo.removeAllProductFromCart();
    getCartProducts();
  }*/

  insertProductToCart(CartModel product) {
    ObjectBoxRepo.insertProductToCart(product);
    getCartProducts();
    StaticMethods.buildSnackBar(
      Constant.add,
      '${Constant.addDone} Cart',
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    //getCategories();
    getProducts();
    //removeAllProductFromFavourite();
    //removeAllProductFromCart();
    getFavouriteProducts();
    getCartProducts();
    super.onInit();
  }

}