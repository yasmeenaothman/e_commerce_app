import 'package:e_commerce_app/utils/constants/constant.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  String id;
  String name;
  String email;

  factory UserModel.fromMap(Map map) => UserModel(
    id: map[Constant.idKey],
    name: map[Constant.nameKey],
    email: map[Constant.emailKey],
  );

  toMap() {
    return {
      Constant.idKey : id,
      Constant.nameKey : name,
      Constant.emailKey : email,
    };
  }
}