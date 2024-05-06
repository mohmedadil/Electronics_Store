import 'package:hive/hive.dart';
part 'shoes_model.g.dart';

@HiveType(typeId: 0)
class ShoesModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  dynamic price;
  @HiveField(3)
  List<dynamic>? image;
  @HiveField(4)
  String? description;

  ShoesModel({this.id, this.name, this.price, this.description, this.image});

  factory ShoesModel.fromjson(Map<String, dynamic> json) {
    return ShoesModel(
        id: json['product_id'],
        description: json['product_description'],
        image: json['product_photos'],
        name: json['product_title'],
        price: json['offer']['price']);
  }
}
