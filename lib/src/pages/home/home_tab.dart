import 'package:aerosales_app/src/pages/commom_widgets/app_name_widget.dart';
import 'package:aerosales_app/src/pages/commom_widgets/custom_elevated_button.dart';
import 'package:aerosales_app/src/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tamanhoTela = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        //Titulo da tela
        title: const AppNameWidget(
          whiteTitle: Colors.white,
          textSize: 25,
        ),

        centerTitle: true,
        //Insere o logo do app no inicio da AppBar
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/app_images/icone_logo.png'),
        ),
        //Botão para sair do sistema.
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  //Fehca o sistema!!!
                  SystemNavigator.pop();
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: SizedBox(
          //Insiro tudo dentro do SizedBox e passo o tamanho da tela para não
          //ocorrer overflow de tamanho dos widgets.
          height: tamanhoTela.height,
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              //Criação dos botões do Menu e suas respectivas chamadas
              //Tela de Novo pedido
              CustomElevatedButtom(
                image: 'assets/app_images/icone_pedidos.png',
                icone: Icons.list_alt_outlined,
                label: 'Novo Pedido',
                onPressed: () {},
              ),

              //Tela de Vendas
              CustomElevatedButtom(
                image: 'assets/app_images/icone_vendas.png',
                icone: Icons.local_offer,
                label: 'Vendas',
                onPressed: () {},
              ),
              //Tela de Produtos
              CustomElevatedButtom(
                image: 'assets/app_images/icone_produtos.png',
                icone: Icons.shopping_cart,
                label: 'Produtos',
                onPressed: () {
                  Get.toNamed(PagesRoutes.productScreen);
                },
              ),
              //Tela de Clientes

              CustomElevatedButtom(
                image: 'assets/app_images/icone_pessoa.png',
                icone: Icons.person,
                label: 'Clientes',
                onPressed: () {
                  Get.toNamed(PagesRoutes.clienteScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
