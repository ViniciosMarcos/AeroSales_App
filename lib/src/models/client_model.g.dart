// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cliente _$ClienteFromJson(Map<String, dynamic> json) => Cliente(
      codigo: json['codigo'] as int?,
      nome: json['nome'] as String?,
      fantasia: json['fantasia'] as String?,
      bloqueado: json['bloqueado'] as String?,
      endereco: json['endereco'] as String?,
      bairro: json['bairro'] as String?,
      numero: json['numero'] as String?,
      cidade: json['cidade'] as String?,
      cpf: json['cpf'] as String?,
      telefone: json['telefone'] as String?,
    );

Map<String, dynamic> _$ClienteToJson(Cliente instance) => <String, dynamic>{
      'codigo': instance.codigo,
      'nome': instance.nome,
      'fantasia': instance.fantasia,
      'bloqueado': instance.bloqueado,
      'endereco': instance.endereco,
      'bairro': instance.bairro,
      'numero': instance.numero,
      'cidade': instance.cidade,
      'cpf': instance.cpf,
      'telefone': instance.telefone,
    };
