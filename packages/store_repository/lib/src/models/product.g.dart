// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      image: json['image'] as String,
      title: json['title'] as String,
      rate: (json['rate'] as num).toDouble(),
      price: json['price'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'rate': instance.rate,
      'price': instance.price,
    };
