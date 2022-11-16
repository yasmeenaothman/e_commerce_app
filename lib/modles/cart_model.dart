import 'package:objectbox/objectbox.dart';
@Entity()
class CartModel{
  CartModel({
    this.id = 0,
    required this.title,
    required this.quantity,
    required this.price,
    required this.img,
  });
  int id;
  String title;
  int quantity;
  int price;
  String img;
}
/*
@Entity()
class CartModel{
  CartModel({
    this.id = 0,
    required this.quantity,
    required this.productId,
  });
  int id;
  int quantity;
  int productId;
  final products = ToMany<ProductModel>();
}*/
