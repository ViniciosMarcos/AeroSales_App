import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Products {
  String? codigo;
  String? descricao;
  double? estoque;
  double? venda;
  double? custo;
  String? gramatura;
  String? grupo;
  double? cusMedio;
  String? subGrupo;
  String? codBarras;

  Products({
    this.codigo,
    this.descricao,
    this.estoque,
    this.venda,
    this.custo,
    this.gramatura,
    this.grupo,
    this.cusMedio,
    this.subGrupo,
    this.codBarras,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
