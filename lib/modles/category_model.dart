import 'package:e_commerce_app/utils/constants/constant.dart';
import 'package:objectbox/objectbox.dart';

class CategoryModel {
  CategoryModel({
    this.id = 0,
    required this.name,
    required this.image,
  });

  int id;
  String name;
  String image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json[Constant.idKey],
    name: json[Constant.nameKey],
    image: json[Constant.imageKey],
  );

  Map<String, dynamic> toJson() => {
    Constant.idKey: id,
    Constant.nameKey: name,
    Constant.imageKey: image,
  };
}