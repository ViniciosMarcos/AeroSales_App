import 'package:aerosales_app/src/configs/custom_colors.dart';
import 'package:aerosales_app/src/models/product_model.dart';
import 'package:aerosales_app/src/pages/sales/controller/sales_controller.dart';
import 'package:flutter/material.dart';

class CardProdutos extends StatefulWidget {
  final Products produto;

  const CardProdutos({
    super.key,
    required this.produto,
  });

  @override
  State<CardProdutos> createState() => _CardProdutosState();
}

class _CardProdutosState extends State<CardProdutos> {
  SalesController salesController = SalesController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GestureDetector(
        onTap: () {
          setState(() {
            salesController.addProductSales(widget.produto);
          });
        },
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
              '${widget.produto.codigo} - ${widget.produto.descricao}',
              style: const TextStyle(
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            subtitle: Text(
              'Estoque: ${widget.produto.estoque}',
              style: const TextStyle(
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
