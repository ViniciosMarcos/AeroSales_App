import 'package:aerosales_app/src/models/client_model.dart';
import 'package:aerosales_app/src/pages/auth/controller/auth_controller.dart';
import 'package:aerosales_app/src/pages/client/repository/client_repository.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  ClientRepository clientRepository = ClientRepository();
  AuthController authController = Get.find<AuthController>();
  bool isLoading = false;
  late List<Cliente> clientes;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  Future<List<Cliente>> loadClient(String clienteNome) async {
    setLoading(false);

    final result = await clientRepository.consultarCliente(
      clienteNome: clienteNome,
      pathApi: authController.pathApi!,
    );
    clientes = result;
    setLoading(true);

    return result;
  }
}
