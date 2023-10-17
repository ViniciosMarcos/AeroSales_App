import 'package:aerosales_app/src/configs/custom_colors.dart';
import 'package:aerosales_app/src/models/product_model.dart';
import 'package:flutter/material.dart';

class CardProdutos extends StatelessWidget {
  final Products produto;

  const CardProdutos({
    super.key,
    required this.produto,
  });

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
            '${produto.codigo} - ${produto.descricao}',
            style: const TextStyle(
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            'Estoque: ${produto.estoque}',
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
