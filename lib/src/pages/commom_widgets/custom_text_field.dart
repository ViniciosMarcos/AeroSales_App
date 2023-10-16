//**************************
//  Copyright © 2023 by AERO Informática Ltda
//
//  text_field.dart
//  Widget customizado dos campos de Texto.
//
//  Autor: Marcos Vinicios
//   Data: 2023/Jun/30 - 16:54
//
//   Obs.:
//
//**************************

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String nomeCampo;
  final IconData icone;
  final bool senha;
  final List<TextInputFormatter>? formatacao;
  final String? value;
  final TextEditingController? textController;

  const CustomTextField({
    super.key,
    required this.nomeCampo,
    required this.icone,
    this.senha = false,
    this.formatacao,
    this.value,
    this.textController,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool senhaIcon = false;
  List<TextInputFormatter>? formatCampo;

  //SenhaIcon e para alterar o icone de visibilidade de senha
  @override
  void initState() {
    super.initState();
    //Inicio com o valor do parametro pelo construtor senha.
    senhaIcon = widget.senha;
    formatCampo = widget.formatacao;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.nomeCampo,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          TextFormField(
            //Se é campo de senha, passo como true para deixar obscuro.
            obscureText: senhaIcon,
            initialValue: widget.value,
            inputFormatters: formatCampo,
            controller: widget.textController,
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: Icon(
                widget.icone,
                size: 23,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              suffixIcon: widget.senha
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          //Ao pressionar o Icone, altero o valor da variavel
                          //Para alterar o Icone também.
                          senhaIcon = !senhaIcon;
                        });
                      },
                      icon: Icon(
                        //Altera o ícone com base no valor da variavel
                        senhaIcon ? Icons.visibility : Icons.visibility_off,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
