// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      image: json['image'] as String,
      title: json['title'] as String,
      rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
      price: json['price'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'rating': instance.rating,
      'price': instance.price,
    };
