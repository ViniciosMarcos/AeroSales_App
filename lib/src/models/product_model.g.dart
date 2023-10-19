// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      codigo: json['codigo'] as String?,
      descricao: json['descricao'] as String?,
      estoque: (json['estoque'] as num?)?.toDouble(),
      venda: (json['venda'] as num?)?.toDouble(),
      custo: (json['custo'] as num?)?.toDouble(),
      gramatura: json['gramatura'] as String?,
      grupo: json['grupo'] as String?,
      cusMedio: (json['cusMedio'] as num?)?.toDouble(),
      subGrupo: json['subGrupo'] as String?,
      codBarras: json['codBarras'] as String?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'estoque': instance.estoque,
      'venda': instance.venda,
      'custo': instance.custo,
      'gramatura': instance.gramatura,
      'grupo': instance.grupo,
      'cusMedio': instance.cusMedio,
      'subGrupo': instance.subGrupo,
      'codBarras': instance.codBarras,
    };
