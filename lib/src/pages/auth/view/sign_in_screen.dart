import 'package:aerosales_app/src/configs/custom_colors.dart';
import 'package:aerosales_app/src/constants/storage_key.dart';
import 'package:aerosales_app/src/pages/auth/controller/auth_controller.dart';
import 'package:aerosales_app/src/pages/commom_widgets/app_name_widget.dart';
import 'package:aerosales_app/src/pages/commom_widgets/custom_text_field.dart';
import 'package:aerosales_app/src/pages_routes/app_pages.dart';
import 'package:aerosales_app/src/services/utils_services.dart';
import 'package:aerosales_app/src/services/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UtilsServices utilsServices = UtilsServices();
  TextEditingController loginController = TextEditingController();
  TextEditingController parametroController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final tamanhoTela = MediaQuery.of(context).size;

    if (authController.seller != null) {
      loginController.text = authController.seller!;
    }

    return SingleChildScrollView(
      child: SizedBox(
        height: tamanhoTela.height,
        child: Scaffold(
          backgroundColor: CustomColors.customSwatchColor,
          body: ListView(
            children: [
              //Mais informações
              Container(
                alignment: Alignment.centerRight,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      _configParametros(context);
                    },
                    icon: const Icon(
                      Icons.more_vert_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    //Icone do app
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/app_images/icone_logo.png'),
                    ),
                    //Titulo do app em tela
                    const AppNameWidget(
                      whiteTitle: Colors.white,
                      textSize: 40,
                    ),
                  ],
                ),
              ),
              //Acesso
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 40,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Campo de Login
                        CustomTextField(
                          nomeCampo: 'Login',
                          icone: Icons.person,
                          textController: loginController,
                          validator: loginValidator,
                        ),

                        //Campo de senha
                        CustomTextField(
                          nomeCampo: 'Senha',
                          icone: Icons.lock,
                          senha: true,
                          textController: passwordController,
                          validator: passwordValidator,
                        ),
                        //Botao Entrar
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (authController.pathApi!.isEmpty ||
                                  authController.pathApi == null) {
                                utilsServices.showToast(
                                    msg: 'Caminho da API não configurado.',
                                    isError: true);
                                return;
                              }

                              utilsServices.saveLocalData(
                                key: StorageKeys.seller,
                                data: loginController.text,
                              );
                              if (_formKey.currentState!.validate()) {
                                final result =
                                    await authController.validateLogin(
                                  seller: loginController.text,
                                  password: passwordController.text,
                                );

                                if (result) {
                                  Get.offAllNamed(PagesRoutes.homeTab);
                                } else {
                                  utilsServices.showToast(
                                    msg: 'Login ou senha inválido, verifique!',
                                    isError: true,
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 10,
                            ),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Dialog para o senha antes do caminho da API
  Future _configParametros(BuildContext context) {
    final textControllerSenha = TextEditingController();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Center(
            child: Text('Digite a senha'),
          ),
          content: SingleChildScrollView(
            child: CustomTextField(
              textController: textControllerSenha,
              nomeCampo: '',
              icone: Icons.lock,
              senha: true,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                if (textControllerSenha.text == 'aero2001') {
                  Navigator.of(context).pop();
                  _inputParametros(context);
                }
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  //Dialog para inserir o caminho da API
  Future<bool?> _inputParametros(BuildContext context) {
    if (authController.pathApi != null) {
      parametroController.text = authController.pathApi!;
    }
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Center(
            child: Text('Digite o endereço da API'),
          ),
          content: SingleChildScrollView(
            child: CustomTextField(
              nomeCampo: '',
              icone: Icons.http_outlined,
              textController: parametroController,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () async {
                final result = await authController.validatePathApi(
                    pathApi: parametroController.text);

                if (result) {
                  utilsServices.saveLocalData(
                    key: StorageKeys.pathApi,
                    data: parametroController.text,
                  );
                  SystemNavigator.pop();
                } else {
                  utilsServices.showToast(
                    msg: 'Caminho inválido, verifique!',
                    isError: true,
                  );
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
