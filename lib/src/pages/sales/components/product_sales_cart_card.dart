import 'package:aerosales_app/src/configs/custom_colors.dart';
import 'package:aerosales_app/src/models/product_cart_model.dart';

import 'package:aerosales_app/src/pages/sales/controller/sales_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardProductsCart extends StatefulWidget {
  final ProductsCart produto;

  const CardProductsCart({
    super.key,
    required this.produto,
  });

  @override
  State<CardProductsCart> createState() => _CardProductsCartState();
}

class _CardProductsCartState extends State<CardProductsCart> {
  SalesController salesController = Get.find<SalesController>();
  ProductsCart? productCart;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 60,
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: CustomColors.customSwatchColor,
            ),
            child: SizedBox(
              height: 35,
              child: Image.asset('assets/app_images/icone_produtos.png'),
            ),
          ),
          title: Text(
            '${widget.produto.product!.codigo} - ${widget.produto.product!.descricao}',
            style: const TextStyle(
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            'Estoque: ${widget.produto.quantity}',
            style: const TextStyle(
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
