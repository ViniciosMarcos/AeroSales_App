import 'package:aerosales_app/src/models/payment_terms_model.dart';
import 'package:aerosales_app/src/models/type_payment_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SalesRepository {
  //Consulta as Condicoes de Pagamento
  Future<List<PaymentTerms>> paymentTerms() async {
    final response = await http
        .get(Uri.parse('http://10.11.12.18:8000/api/v1/condicaoPgto/'));

    //Resposta OK
    if (response.statusCode == 200) {
      final dynamic jsonData = json.decode(response.body);

      if (jsonData is Map<String, dynamic> && jsonData.containsKey('data')) {
        final List<dynamic> dataList = jsonData['data'];

        //Retorno a lista de produtos.
        return dataList
            .map((dados) => PaymentTerms(
                  id: dados['PAG_COD'],
                  descricao: dados['PAG_DES'],
                ))
            .toList();
      } else {
        throw Exception('Falha ao carregar dados!');
      }
    } else {
      throw Exception('Falha ao consultar API');
    }
  }

  //Consulta de Tipos de Pagamento
  Future<List<TypePayment>> typePayments() async {
    final response =
        await http.get(Uri.parse('http://10.11.12.18:8000/api/v1/tipoPgto/'));

    //Resposta OK
    if (response.statusCode == 200) {
      final dynamic jsonData = json.decode(response.body);

      if (jsonData is Map<String, dynamic> && jsonData.containsKey('data')) {
        final List<dynamic> dataList = jsonData['data'];

        //Retorno a lista de produtos.
        return dataList
            .map((dados) => TypePayment(
                  id: dados['TIP_COD'],
                  descricao: dados['TIP_DES'],
                ))
            .toList();
      } else {
        throw Exception('Falha ao carregar dados!');
      }
    } else {
      throw Exception('Falha ao consultar API');
    }
  }
}
