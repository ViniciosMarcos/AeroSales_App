import 'package:aerosales_app/src/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_cart_model.g.dart';

@JsonSerializable()
class ProductsCart {
  Products? product;
  double? quantity;
  double? priceTotal;

  ProductsCart({
    this.product,
    this.quantity,
    this.priceTotal,
  });

  factory ProductsCart.fromJson(Map<String, dynamic> json) =>
      _$ProductsCartFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsCartToJson(this);
}
