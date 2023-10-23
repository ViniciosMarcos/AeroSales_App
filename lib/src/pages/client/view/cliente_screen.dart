//**************************
//  Copyright © 2023 by AERO Informática Ltda
//
//  clientes_consulta_view.dart
//  Consulta clientes através da API
//
//  Autor: Marcos Vinicios
//   Data: 2023/Jun/20 - 11:42
//
//   Obs.: Para consultar, deverá clicar no ícone de pesquisa. Se não estiver
//         preenchido, o retorno será todos os clientes.
//**************************

import 'package:aerosales_app/src/configs/custom_colors.dart';
import 'package:aerosales_app/src/models/client_model.dart';
import 'package:aerosales_app/src/pages/client/components/client_card.dart';
import 'package:aerosales_app/src/pages/client/controller/client_controller.dart';
import 'package:aerosales_app/src/pages/commom_widgets/custom_shimmer.dart';
import 'package:aerosales_app/src/pages_routes/app_pages.dart';
import 'package:aerosales_app/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({
    super.key,
  });

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  String clienteTexto = '';

  final clienteController = ClientController();
  final _textController = TextEditingController();
  UtilsServices utilsServices = UtilsServices();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tamanhoTela = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: tamanhoTela.height,
          width: tamanhoTela.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        padding: const EdgeInsets.symmetric(vertical: 10),
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
                                      'Pesquisa de Clientes',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.abc),
                                  color: CustomColors.customSwatchColor,
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
                                      borderSide:
                                          BorderSide(color: Colors.white),
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
                                      borderSide:
                                          BorderSide(color: Colors.white),
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
                                          clienteTexto = _textController.text;

                                          //Atribuo a varival para retornar os clientes
                                          clienteController.setLoading(true);
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
                if (clienteController.isLoading)
                  Expanded(
                    child: SingleChildScrollView(
                      child: FutureBuilder<List<Cliente>>(
                        future: clienteController.loadClient(clienteTexto),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            //Se ocorrer erro, mostro em tela.
                            return Text('Ocorreu um erro: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            //Tudo certo, retornou dados!!!
                            final clientes = snapshot.data!;

                            //Retorno a Lista de Clientes.
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: clientes.length,
                              itemBuilder: (context, index) {
                                final cliente = clientes[index];
                                return CardCliente(
                                  cliente: cliente,
                                );
                              },
                            );
                          } else {
                            //Caso consulte a API e não encontre Clientes.
                            return const Text(
                                'Não foram encontrados clientes!');
                          }
                        },
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                          16,
                          (index) => const CustomShimmer(height: 10, width: 10),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
