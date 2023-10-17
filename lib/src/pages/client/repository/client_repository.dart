import 'package:aerosales_app/src/models/client_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClientRepository {
  //Retorna Lista de Clientes com Codigo e Nome
  Future<List<Cliente>> consultarCliente({
    required String clienteNome,
    required String pathApi,
  }) async {
    if (clienteNome == '') {
      clienteNome = 'vazio';
    }
    final response =
        await http.get(Uri.parse('$pathApi/clientes/$clienteNome'));

    final dynamic jsonData = json.decode(response.body);

    //Se for != null validou a api
    if (jsonData['status'] != null) {
      //Resposta ok
      if (response.statusCode == 200) {
        //Verifica se JSon é um Map de string com dinamic e se contém dados.
        if (jsonData is Map<String, dynamic> && jsonData.containsKey('data')) {
          //Crio uma lista dinamica com os dados.
          final List<dynamic> dataList = jsonData['data'];

          //Retorno uma Lista de cliente com codigo e nome.
          return dataList
              .map((data) => Cliente(
                    codigo: data['CLI_COD'],
                    nome: data['CLI_NOM'],
                    fantasia: data['CLI_FAN'],
                    bloqueado: data['CLI_BLOQ'],
                    bairro: data['CLI_BAI'],
                    endereco: data['CLI_END'],
                    numero: data['CLI_NUM'],
                    cidade: data['CID_NOM'],
                    cpf: data['CLI_CGC'],
                    telefone: data['CLI_TEL'],
                  ))
              .toList();
        } else {
          throw Exception('Erro ao recuperar os dados da API.');
        }
      } else {
        throw Exception(
            'Não foram encontrados clientes com este nome, verifique!');
      }
    } else {
      throw Exception('Falha ao consultar API.');
    }
  }
}
