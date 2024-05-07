import 'package:hive/hive.dart';
part 'shoes_model.g.dart';

@HiveType(typeId: 0)
class ItemModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? category;
  @HiveField(3)
  dynamic price;
  @HiveField(4)
  String ?image;
  @HiveField(5)
  String? description;
  @HiveField(6)
  String? brand;
  @HiveField(7)
  String? color;
  @HiveField(8)
  bool isFavourite = false;

  ItemModel({this.id, this.title, this.price, this.description, this.image,this.brand,this.category,this.color});

  factory ItemModel.fromjson(Map<String, dynamic> json) {
    return ItemModel(
        id: json['id'],
        description: json['description'],
        image: json['image'],
        title: json['title'],
        price: json['price'],
        brand: json['brand'],
        color: json['color'],
        category: json['category']);
  }
}
