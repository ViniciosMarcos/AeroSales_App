// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsCart _$ProductsCartFromJson(Map<String, dynamic> json) => ProductsCart(
      product: json['product'] == null
          ? null
          : Products.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num?)?.toDouble(),
      priceTotal: (json['priceTotal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductsCartToJson(ProductsCart instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'priceTotal': instance.priceTotal,
    };
