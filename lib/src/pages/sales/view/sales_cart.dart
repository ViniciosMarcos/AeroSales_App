import 'package:aerosales_app/src/configs/custom_colors.dart';
import 'package:aerosales_app/src/models/product_model.dart';
import 'package:aerosales_app/src/pages/product/repository/product_repository.dart';
import 'package:aerosales_app/src/pages/sales/components/procuct_sales_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class SalesCart extends StatefulWidget {
  const SalesCart({super.key});

  @override
  State<SalesCart> createState() => _SalesCartState();
}

class _SalesCartState extends State<SalesCart> {
  final produtoController = ProdutoController();

  String descricao = '';
  final bool _carregaDados = false;

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
                child: FutureBuilder<List<Products>>(
                  future: produtoController.consultarProdutos(descricao),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      //Enquanto está Carregando
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      //Erro
                      return Text('Erro: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      //Deu certo!!!
                      final produtos = snapshot.data!;

                      //Retorno a Lista
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: produtos.length,
                        itemBuilder: (context, index) {
                          final produto = produtos[index];
                          return CardProdutos(
                            produto: produto,
                          );
                        },
                      );
                    } else {
                      return const Text('Não foram encontrados produtos!');
                    }
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
