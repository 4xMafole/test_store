import 'package:json_annotation/json_annotation.dart';
import 'package:store_api/src/models/rating.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String image;
  String title;
  Rating rating;
  String price;
  Product({
    required this.image,
    required this.title,
    required this.rating,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
