//**************************
//  Copyright © 2023 by AERO Informática Ltda
//
//  elevated_button.dart
//  Widget customizado dos botões.
//
//  Autor: Marcos Vinicios
//   Data: 2023/Jun/30 - 16:56
//
//   Obs.:
//
//**************************

import 'package:aerosales_app/src/configs/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtom extends StatelessWidget {
  final IconData icone;
  final String label;
  final VoidCallback? onPressed;
  final String image;

  const CustomElevatedButtom({
    super.key,
    required this.icone,
    required this.label,
    this.onPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          height: 50,
          width: 50,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.customSwatchColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(image),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      label,
                      style: const TextStyle(
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
      ),
    );
  }
}
