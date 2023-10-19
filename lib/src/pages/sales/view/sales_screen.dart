import 'package:aerosales_app/src/configs/custom_colors.dart';
import 'package:aerosales_app/src/pages/sales/view/sales_cart.dart';
import 'package:aerosales_app/src/pages/sales/view/sales_data.dart';
import 'package:aerosales_app/src/pages/sales/view/sales_products.dart';
import 'package:aerosales_app/src/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({
    super.key,
  });

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final PageController pageController = PageController();
  int itemNavigator = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Iconde para voltar
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(PagesRoutes.homeTab);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        //Titulo da tela
        title: const Text(
          'Pedidos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: CustomColors.customSwatchColor,
      ),
      //Chama as outras telas
      body: PageView(
        controller: pageController,
        children: const [
          SalesData(),
          SalesProducts(),
          SalesCart(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        //Ao clicar nos botões chamo as respectivas telas
        type: BottomNavigationBarType.fixed,
        currentIndex: itemNavigator,
        backgroundColor: Colors.grey[300],
        onTap: (index) {
          setState(() {
            itemNavigator = index;
            pageController.jumpToPage(index);
          });
        },
        items: const [
          //Dados - Cabeçalho
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Dados',
          ),
          //Produtos - Seleção dos produtos
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox_rounded),
            label: 'Produtos',
          ),
          //Carrinho
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
        ],
      ),
    );
  }
}
