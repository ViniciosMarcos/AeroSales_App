import 'package:aerosales_app/src/pages/auth/sign_in_screen.dart';
import 'package:aerosales_app/src/pages/client/cliente_screen.dart';
import 'package:aerosales_app/src/pages/home/home_tab.dart';
import 'package:aerosales_app/src/pages/product/product_screen.dart';
import 'package:aerosales_app/src/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: PagesRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: PagesRoutes.signInScreen, page: () => const SignInScreen()),
    GetPage(name: PagesRoutes.homeTab, page: () => const HomeTab()),
    GetPage(name: PagesRoutes.clienteScreen, page: () => const ClientScreen()),
    GetPage(name: PagesRoutes.productScreen, page: () => const ProductScreen()),
  ];
}

abstract class PagesRoutes {
  static const String splashScreen = '/SplashScreen';
  static const String signInScreen = '/SignInScreen';
  static const String homeTab = '/HomeTab';
  static const String clienteScreen = '/ClienteScreen';
  static const String productScreen = '/ProdutoScreen';
}
