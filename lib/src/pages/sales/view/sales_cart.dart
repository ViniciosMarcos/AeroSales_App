import 'package:aerosales_app/src/pages/sales/components/product_sales_cart_card.dart';
import 'package:aerosales_app/src/pages/sales/controller/sales_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesCart extends StatefulWidget {
  const SalesCart({super.key});

  @override
  State<SalesCart> createState() => _SalesCartState();
}

class _SalesCartState extends State<SalesCart> {
  SalesController salesController = Get.find<SalesController>();

  String descricao = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: salesController.sales.produtos!.length,
                  itemBuilder: (context, index) {
                    final produto = salesController.sales.produtos![index];
                    return CardProductsCart(
                      produto: produto,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
