import 'package:aerosales_app/src/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProdutoController extends GetxController {
  //Lista todos os produtos
  Future<List<Products>> consultarProdutos(String descricao) async {
    if (descricao == '') {
      descricao = 'vazio';
    }
    final response = await http
        .get(Uri.parse('http://10.11.12.18:8000/api/v1/produtos/$descricao'));

    //Resposta OK
    if (response.statusCode == 200) {
      final dynamic jsonData = json.decode(response.body);

      if (jsonData is Map<String, dynamic> && jsonData.containsKey('data')) {
        final List<dynamic> dataList = jsonData['data'];

        //Retorno a lista de produtos.
        return dataList
            .map((dados) => Products(
                  codigo: dados['PRO_COD'],
                  descricao: dados['PRO_DES'],
                  estoque: dados['EST_QUA'],
                  gramatura: dados['PRO_DESGRA'],
                  codBarras: dados['PRO_CODBAR'],
                  cusMedio: dados['MED_CUSMED'],
                  custo: dados['PRO_CUS'],
                  grupo: dados['GRU_DES'],
                  subGrupo: dados['SUB_DES'],
                  venda: dados['PRO_VEN'],
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
