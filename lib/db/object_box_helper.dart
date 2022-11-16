import 'package:e_commerce_app/modles/category_model.dart';
import 'package:objectbox/objectbox.dart';
import '../modles/cart_model.dart';
import '../modles/favourite_model.dart';
import '../modles/product_model.dart';
import '../objectbox.g.dart';

class ObjectBoxHelper{
  late final Store _store;
  /*late final Box<ProductModel> _productBox;
  late final Box<CategoryModel> _categoryBox;*/
  late final Box<FavouriteModel> _favouriteBox;
  late final Box<CartModel> _cartBox;

  // named constructor
  ObjectBoxHelper._(this._store) {
    //_productBox = Box<ProductModel>(_store);
    _favouriteBox = Box<FavouriteModel>(_store);
    _cartBox = Box<CartModel>(_store);
  }

  static Future<ObjectBoxHelper> init() async {
    final store = await openStore();
    return ObjectBoxHelper._(store);
  }

 /* List<ProductModel> getAllProducts() => _productBox.getAll();

  int insertProduct(ProductModel product) => _productBox.put(product);

  bool deleteProduct(int id) => _productBox.remove(id);
  int deleteAllProduct() => _productBox.removeAll();

  insertProductToCart(ProductModel productModel,int quantity){
    CartModel cartModel  = CartModel(quantity: quantity, productId: productModel.id);
    cartModel.products.add(productModel);
    _cartBox.put(cartModel);
  }
  getAllProductsFromCart() {
    return _cartBox.getAll().map((e) => e.products.toList().first).toList();
  }
  deleteProductFromCart(int id) {
    _cartBox.remove(_cartBox.getAll().firstWhere((element) => element.productId == id).id);
  }
  deleteAllProductFromCart(){
    _cartBox.removeAll();
  }*/
  // Favourite
  int insertProductToFavourite(FavouriteModel product) => _favouriteBox.put(product);
  bool deleteProductFromFavourite(int id) => _favouriteBox.remove(id);
  List<FavouriteModel> getProductsFromFavourite() => _favouriteBox.getAll();
  // Cart
  int insertProductToCart(CartModel product) => _cartBox.put(product);
  bool deleteProductFromCart(int id) => _cartBox.remove(id);
  List<CartModel> getProductsFromCart() => _cartBox.getAll();

}
