import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String imageUrl;
  String title;
  double rating;
  String price;
  Product({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
