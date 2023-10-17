import 'package:aerosales_app/src/constants/storage_key.dart';
import 'package:aerosales_app/src/pages/auth/repository/auth_repository.dart';
import 'package:aerosales_app/src/services/utils_services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final UtilsServices utilsServices = UtilsServices();
  final AuthRepository authRepository = AuthRepository();
  RxBool isLoading = false.obs;
  String? seller;
  String? pathApi;

  @override
  void onInit() {
    super.onInit();

    loadData();
  }

  Future<void> loadData() async {
    //Busca o vendedor e o caminho da API
    seller = await utilsServices.getLocalData(key: StorageKeys.seller);
    pathApi = await utilsServices.getLocalData(key: StorageKeys.pathApi);
  }

  //Valida o caminho da Api
  Future<bool> validatePathApi({
    required String pathApi,
  }) async {
    return await authRepository.validatePathApi(pathApi: pathApi);
  }

  //Valido o Login na API
  Future<bool> validateLogin({
    required String seller,
    required String password,
  }) async {
    final bool result = await authRepository.validateLogin(
      seller: seller,
      password: password,
      pathApi: pathApi!,
    );

    return result;
  }
}
