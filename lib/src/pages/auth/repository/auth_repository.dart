import 'package:aerosales_app/src/services/utils_services.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final UtilsServices utilsServices = UtilsServices();

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
