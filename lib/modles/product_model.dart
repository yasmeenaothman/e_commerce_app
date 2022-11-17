
import 'dart:convert';
import 'package:objectbox/objectbox.dart';

import '../utils/constants/constant.dart';
import 'category_model.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  int id;
  String title;
  int price;
  String description;
  //@Id()
  int idProduct =0;
  CategoryModel category;
  List<dynamic> images;
  //final category = ToOne<CategoryModel>();

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json[Constant.idKey],
    title: json[Constant.titleKey],
    price: json[Constant.priceKey].toInt(),
    description: json[Constant.descriptionKey],
    category: CategoryModel.fromJson(json[Constant.categoryKey]),
    images: List<dynamic>.from(json[Constant.imagesKey].map((x) => x),),
  );

  Map<String, dynamic> toJson() => {
    Constant.idKey: id,
    Constant.titleKey: title,
    Constant.priceKey: price,
    Constant.descriptionKey: description,
    Constant.categoryKey: category.toJson(),
    Constant.imagesKey: List<dynamic>.from(images.map((x) => x),),
  };
}

