class ShoesModel {
  String? id;
  String? name;
  dynamic price;
  List<dynamic>? image;
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
