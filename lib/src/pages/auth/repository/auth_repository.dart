import 'dart:convert';
import 'package:aerosales_app/src/services/utils_services.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final UtilsServices utilsServices = UtilsServices();

  Future<bool> validatePathApi({
    required String pathApi,
  }) async {
    //Faz uma requisicao simples com dados mocados para testar a API
    final response = await http.get(Uri.parse('$pathApi/login/teste/pathapi'));
    final dynamic jsonData = json.decode(response.body);

    if (jsonData['status'] != null) {
      //Null quer dizer que não encontrou o caminho da api
      return true;
    } else {
      return false;
    }
  }

  Future<bool> validateLogin({
    required String seller,
    required String password,
    required String pathApi,
  }) async {
    final response =
        await http.get(Uri.parse('$pathApi/login/$seller/$password'));

    //Se retornar a reposta "Ok"
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
