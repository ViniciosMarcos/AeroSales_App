import 'package:aerosales_app/src/models/payment_terms_model.dart';
import 'package:aerosales_app/src/models/product_cart_model.dart';
import 'package:aerosales_app/src/models/sales_model.dart';
import 'package:aerosales_app/src/models/type_payment_model.dart';
import 'package:aerosales_app/src/pages/sales/repository/sales_repostory.dart';
import 'package:get/get.dart';

class SalesController extends GetxController {
  SalesRepository salesRepository = SalesRepository();
  Sales sales = Sales(produtos: []);

  void addProductSales(ProductsCart produto) {
    if (sales.produtos != null) {
      sales.produtos!.add(produto);
      update();
    }
  }

  bool isLoading = true;
  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  //Consulta de Condicoes de Pagamento
  Future<List<PaymentTerms>> loadPaymentTerms() async {
    setLoading(false);

    final result = await salesRepository.paymentTerms();

    setLoading(true);

    return result;
  }

  //Consulta de Tipos de Pagamento
  Future<List<TypePayment>> loadTypePayment() async {
    setLoading(false);

    final result = await salesRepository.typePayments();

    setLoading(true);

    return result;
  }
}
