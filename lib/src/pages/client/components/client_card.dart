import 'package:aerosales_app/src/configs/custom_colors.dart';
import 'package:aerosales_app/src/models/client_model.dart';
import 'package:flutter/material.dart';

class CardCliente extends StatelessWidget {
  final Cliente cliente;
  final VoidCallback onTap;

  const CardCliente({
    super.key,
    required this.cliente,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      color: Colors.blueGrey[100],
      elevation: 5,
      child: ExpansionTile(
        title: SizedBox(
          width: size.width,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: CustomColors.customSwatchColor,
                ),
                child: SizedBox(
                  height: 25,
                  child: Image.asset('assets/app_images/icone_pessoa.png'),
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Text(
                  ' ${cliente.codigo} - ${cliente.nome}',
                  style: TextStyle(
                    color:
                        (cliente.bloqueado == 'S') ? Colors.red : Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('Fantasia: ${cliente.fantasia}'),
          ),
          Text('${cliente.cidade}'),
          Row(
            children: [
              Text('${cliente.endereco}'),
              Text('${cliente.bairro}'),
            ],
          ),
          Text(cliente.formatterPhoneNumber()),
        ],
      ),
    );
  }
}
