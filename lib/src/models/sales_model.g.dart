// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sales _$SalesFromJson(Map<String, dynamic> json) => Sales(
      codigo: json['codigo'] as int?,
      cliente: json['cliente'] == null
          ? null
          : Cliente.fromJson(json['cliente'] as Map<String, dynamic>),
      produtos: (json['produtos'] as List<dynamic>?)
          ?.map((e) => ProductsCart.fromJson(e as Map<String, dynamic>))
          .toList(),
      condPgto: json['condPgto'] == null
          ? null
          : PaymentTerms.fromJson(json['condPgto'] as Map<String, dynamic>),
      tipoPgto: json['tipoPgto'] == null
          ? null
          : TypePayment.fromJson(json['tipoPgto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SalesToJson(Sales instance) => <String, dynamic>{
      'codigo': instance.codigo,
      'cliente': instance.cliente,
      'produtos': instance.produtos,
      'tipoPgto': instance.tipoPgto,
      'condPgto': instance.condPgto,
    };
