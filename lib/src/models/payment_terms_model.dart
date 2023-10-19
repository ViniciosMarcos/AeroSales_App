import 'package:json_annotation/json_annotation.dart';

part 'payment_terms_model.g.dart';

@JsonSerializable()
class PaymentTerms {
  int id;
  String descricao;

  PaymentTerms({
    required this.id,
    required this.descricao,
  });

  factory PaymentTerms.fromJson(Map<String, dynamic> json) =>
      _$PaymentTermsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTermsToJson(this);
}
