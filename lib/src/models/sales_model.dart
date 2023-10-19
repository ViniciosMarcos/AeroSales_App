import 'package:aerosales_app/src/models/client_model.dart';
import 'package:aerosales_app/src/models/payment_terms_model.dart';
import 'package:aerosales_app/src/models/product_model.dart';
import 'package:aerosales_app/src/models/type_payment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sales_model.g.dart';

@JsonSerializable()
class Sales {
  int? codigo;
  Cliente? cliente;
  List<Products>? produtos;
  TypePayment? tipoPgto;
  PaymentTerms? condPgto;

  Sales({
    this.codigo,
    this.cliente,
    this.produtos,
    this.condPgto,
    this.tipoPgto,
  });

  factory Sales.fromJson(Map<String, dynamic> json) => _$SalesFromJson(json);

  Map<String, dynamic> toJson() => _$SalesToJson(this);
}
