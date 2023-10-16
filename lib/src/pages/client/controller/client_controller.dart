import 'package:aerosales_app/src/models/client_model.dart';
import 'package:aerosales_app/src/pages/auth/controller/auth_controller.dart';
import 'package:aerosales_app/src/pages/client/repository/client_repository.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  ClientRepository clientRepository = ClientRepository();
  AuthController authController = Get.find<AuthController>();

  Future<List<Cliente>> loadClient(String clienteNome) async {
    final result = await clientRepository.consultarCliente(
      clienteNome: clienteNome,
      pathApi: authController.pathApi!,
    );

    return result;
  }
}
