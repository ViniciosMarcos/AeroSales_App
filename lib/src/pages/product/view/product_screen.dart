import 'package:aerosales_app/src/configs/custom_colors.dart';
import 'package:aerosales_app/src/models/product_model.dart';
import 'package:aerosales_app/src/pages/product/components/card_product.dart';
import 'package:aerosales_app/src/pages/product/controller/product_controller.dart';
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
  final produtoController = ProductController();
  final _textController = TextEditingController();
  String descricao = '';
  final bool _carregaDados = false;
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
      // appBar: AppBar(
      //   //Botao de voltar
      //   leading: IconButton(
      //     onPressed: () {
      //       Get.offAllNamed(PagesRoutes.homeTab);
      //     },
      //     icon: const Icon(Icons.arrow_back),
      //   ),
      //   //Titulo da tela
      //   title: const Text('Produtos'),
      //   centerTitle: true,

      //   //Leitor de Código de barras
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         lerQRCode();
      //       },
      //       icon: const Icon(Icons.camera_alt_outlined),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: CustomColors.customSwatchColor),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.offAllNamed(PagesRoutes.homeTab);
                                },
                                icon: const Icon(Icons.arrow_back_ios_new),
                                color: Colors.white,
                              ),
                              const Expanded(
                                child: Center(
                                  child: Text(
                                    'Pesquisa de Produtos',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  lerQRCode();
                                },
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Theme(
                              data: ThemeData(
                                inputDecorationTheme:
                                    const InputDecorationTheme(
                                  hintStyle: TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                controller: _textController,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Pesquisar...',
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),

                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 12),

                                  prefixIcon: Icon(
                                    Icons.person_pin_circle_outlined,
                                    size: 35,
                                    color: Colors.yellow.shade800,
                                  ),

                                  //Icone de pesquisar
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        //passo o conteúdo do campo para a variavel e chamo a funcao
                                        descricao = _textController.text;

                                        //Atribuo a varival para retornar os clientes
                                        produtoController.setLoading(true);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.search,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Só mostra os dadfos se a variavel for true
              produtoController.isLoading
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: FutureBuilder<List<Products>>(
                          future:
                              produtoController.consultarProdutos(descricao),
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
      ),
    );
  }
}
