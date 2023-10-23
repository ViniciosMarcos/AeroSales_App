import 'package:aerosales_app/src/models/product_model.dart';
import 'package:aerosales_app/src/pages/product/repository/product_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductRepository productRepository = ProductRepository();
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  //Lista todos os produtos
  Future<List<Products>> consultarProdutos(String descricao) async {
    if (descricao == '') {
      descricao = 'vazio';
    }

    final result = await productRepository.consultarProdutos(descricao);
    return result;
  }
}
