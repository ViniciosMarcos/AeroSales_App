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
  bool _carregaDados = false;
  final clienteController = ClientController();
  final _textController = TextEditingController();
  UtilsServices utilsServices = UtilsServices();

  @override
  void initState() {
    super.initState();
    utilsServices.showToast(
        msg:
            'Digite o nome do cliente ou clique em pesquisar para listar todos os clientes');
  }

  @override
  Widget build(BuildContext context) {
    final tamanhoTela = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        //Titulo da tela
        title: const Text(
          'Clientes',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        //Icone de voltar
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: CustomColors.customSwatchColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),

        //Determino o tamnho da tela para não ocorrer overflow
        child: SizedBox(
          height: tamanhoTela.height,
          width: tamanhoTela.width,
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
                        'Digite o nome do Cliente',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _textController,
                      onChanged: (value) {
                        setState(() {
                          //Conforme for digitando vou trazendo a lista de clientes,
                          //passo o conteúdo do campo para a variavel e chamo a funcao
                          clienteTexto = value;

                          //Atribuo a varival para retornar os clientes
                          _carregaDados = true;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Pesquisar...',
                        hintStyle: const TextStyle(
                          color: Colors.white,
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
              Expanded(
                //So irá carregar os clientes se a variavel for true
                child: _carregaDados
                    ? SingleChildScrollView(
                        child: FutureBuilder<List<Cliente>>(
                          future: clienteController.loadClient(clienteTexto),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              //Até carregar aparece um circulo carregando.
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (snapshot.hasError) {
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
                                    onTap: () {},
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
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
