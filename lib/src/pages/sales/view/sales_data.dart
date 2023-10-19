import 'package:aerosales_app/src/models/payment_terms_model.dart';
import 'package:aerosales_app/src/models/type_payment_model.dart';
import 'package:aerosales_app/src/pages/commom_widgets/custom_elevated_button.dart';
import 'package:aerosales_app/src/pages/sales/controller/sales_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesData extends StatefulWidget {
  const SalesData({super.key});

  @override
  State<SalesData> createState() => _SalesDataState();
}

class _SalesDataState extends State<SalesData> {
  SalesController salesController = Get.find<SalesController>();
  String dropdownValueTipoPgto = '';
  int dropdownValueTipoPgtoItem = 0;
  String dropdownValueCondicaoPgto = '';
  int dropdownValueCondicaoPgtoItem = 0;
  String cliente = '';

  final List<String> entrega = ['Retirada no Local', 'Entrega'];
  String dropdownValueEntrega = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Cliente',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 130,
                          width: 130,
                          child: CustomElevatedButtom(
                            icone: Icons.person,
                            label: 'Identificar',
                            image: 'assets/app_images/icone_pessoa.png',
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                salesController.sales.cliente == null
                                    ? 'Marcos Vinicios Saldanha dos Santos'
                                    : salesController.sales.cliente!.nome!,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                salesController.sales.cliente == null
                                    ? 'Fantasia Marcos Vinicios Saldanha dos Santos'
                                    : salesController.sales.cliente!.fantasia!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Pagamentos',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Tipo de Pagamento',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            FutureBuilder<List<TypePayment>>(
                              future: salesController.loadTypePayment(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Erro: ${snapshot.error}');
                                } else if (!snapshot.hasData) {
                                  return const Text('Nenhum dado encontrado.');
                                } else {
                                  List<TypePayment> tiposPagamento =
                                      snapshot.data!;

                                  final Map<String, TypePayment>
                                      tipoPagamentoMap = {};
                                  for (var tipo in tiposPagamento) {
                                    tipoPagamentoMap[tipo.id.toString()] = tipo;
                                  }

                                  // Retorno o DropdownButton.
                                  return DropdownButton<String>(
                                    value: salesController.sales.tipoPgto?.id
                                        .toString(),
                                    items: tipoPagamentoMap.keys.map((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                            tipoPagamentoMap[value]!.descricao),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        salesController.sales.tipoPgto =
                                            tipoPagamentoMap[newValue!];
                                      });
                                    },
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Cond. Pagamento',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            FutureBuilder<List<PaymentTerms>>(
                              future: salesController.loadPaymentTerms(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Erro: ${snapshot.error}');
                                } else if (!snapshot.hasData) {
                                  return const Text('Nenhum dado encontrado.');
                                } else {
                                  List<PaymentTerms> condicoesPagamento =
                                      snapshot.data!;
                                  if (dropdownValueCondicaoPgto.isEmpty) {
                                    dropdownValueCondicaoPgto =
                                        condicoesPagamento.first.id.toString();
                                  }

                                  // Retorno o DropdownButton.
                                  return DropdownButton<String>(
                                    value:
                                        salesController.sales.condPgto == null
                                            ? dropdownValueCondicaoPgto
                                            : salesController
                                                .sales.condPgto!.descricao,
                                    items: condicoesPagamento.map((tipo) {
                                      dropdownValueCondicaoPgtoItem = tipo.id;
                                      return DropdownMenuItem<String>(
                                        value: tipo.id.toString(),
                                        child: Text(tipo.descricao),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValueCondicaoPgto = newValue!;
                                      });
                                    },
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(
                        child: Text(
                          'Entrega',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownButton<String>(
                        value: dropdownValueEntrega.isEmpty
                            ? entrega.first
                            : dropdownValueEntrega,
                        items: entrega.map((entrega) {
                          return DropdownMenuItem<String>(
                            value: entrega,
                            child: Text(entrega),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueEntrega = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Observação',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          maxLines: null,
                          maxLength: 100,
                        ),
                      ],
                    ),
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
