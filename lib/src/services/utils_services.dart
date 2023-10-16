import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilsServices {
  final storage = const FlutterSecureStorage();

  //Toast para mostrar mensagens em tela
  void showToast({
    required String msg,
    bool isError = false,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER, //Ficar no centro a mensagem
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? Colors.red : Colors.white,
      textColor: isError ? Colors.white : Colors.black,
      fontSize: 16,
    );
  }

  //Salvando dados Localmente de API e Vendedor
  Future<void> saveLocalData({
    required String key,
    required String data,
  }) async {
    await storage.write(key: key, value: data);
  }

  //Buscando dados salvos.
  Future<String?> getLocalData({required String key}) async {
    return await storage.read(key: key);
  }

  //Deletar dados salvos localmente.
  Future<void> removeLocalData({required String key}) async {
    return await storage.delete(key: key);
  }
}
