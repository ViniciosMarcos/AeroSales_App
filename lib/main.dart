import 'package:aerosales_app/src/configs/custom_colors.dart';
import 'package:aerosales_app/src/pages/auth/controller/auth_controller.dart';
import 'package:aerosales_app/src/pages/sales/controller/sales_controller.dart';
import 'package:aerosales_app/src/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());
  Get.put(SalesController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AEROSales',
      theme: ThemeData(
        primarySwatch: CustomColors.customSwatchColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      getPages: AppPages.pages,
      initialRoute: PagesRoutes.splashScreen,
    );
  }
}
