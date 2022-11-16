
import 'package:objectbox/objectbox.dart';

@Entity()
class FavouriteModel{
  FavouriteModel({
    this.id = 0,
    required this.price,
    required this.title,
    required this.img,
  });
  int id;
  int price;
  String title;
  String img;
}