import 'package:json_annotation/json_annotation.dart';

part 'type_payment_model.g.dart';

@JsonSerializable()
class TypePayment {
  int id;
  String descricao;

  TypePayment({
    required this.id,
    required this.descricao,
  });

  factory TypePayment.fromJson(Map<String, dynamic> json) =>
      _$TypePaymentFromJson(json);

  Map<String, dynamic> toJson() => _$TypePaymentToJson(this);
}
