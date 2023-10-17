import 'package:aerosales_app/src/models/product_model.dart';
import 'package:aerosales_app/src/pages/product/components/card_product.dart';
import 'package:aerosales_app/src/pages/product/repository/product_repository.dart';
import 'package:aerosales_app/src/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final produtoController = ProdutoController();
  final _textController = TextEditingController();
  String descricao = '';
  bool _carregaDados = false;
  String codBar = '';

  //Funcao para ler QRCode
  lerQRCode() async {
    String codigo = await FlutterBarcodeScanner.scanBarcode(
      "#FF0000",
      "Cancelar",
      false,
      ScanMode.QR,
    );

    setState(() {
      if (codigo != '-1') {
        //Get.off(() => ProductPage(codigo: codigo));
      } else {
        codigo = 'Não validado';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Botao de voltar
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(PagesRoutes.homeTab);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        //Titulo da tela
        title: const Text('Produtos'),
        centerTitle: true,

        //Leitor de Código de barras
        actions: [
          IconButton(
            onPressed: () {
              lerQRCode();
            },
            icon: const Icon(Icons.camera_alt_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Campo de pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      'Pesquise o Produto',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _textController,
                    onChanged: (value) {
                      setState(() {
                        //Conforme for digitando vou trazendo a lista de produtos,
                        //Atribuo o valor do campo para a variável
                        descricao = value;
                        //Atribuo a varivael para mostrar a lista de produtos
                        _carregaDados = true;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Pesquisar...',
                      hintStyle: TextStyle(
                        color: Colors.grey[300],
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 12),
                      //Icone de pesquisa
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            //Atribuo o valor do campo para a variável
                            descricao = _textController.text;
                            //Atribuo a varivael para mostrar a lista de produtos
                            _carregaDados = true;
                          });
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Só mostra os dadfos se a variavel for true
            _carregaDados
                ? Expanded(
                    child: SingleChildScrollView(
                      child: FutureBuilder<List<Products>>(
                        future: produtoController.consultarProdutos(descricao),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                            return const Text(
                                'Não foram encontrados produtos!');
                          }
                        },
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Digite para pesquisar um produto ou clique em pesquisar para listar todos os produtos.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
