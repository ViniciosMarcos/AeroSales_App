import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  final double textSize;
  final Color? whiteTitle;
  const AppNameWidget({
    super.key,
    this.textSize = 30,
    this.whiteTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: [
          TextSpan(
            text: 'AERO',
            style: TextStyle(
              color: whiteTitle ?? Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Sales',
            style: TextStyle(
              color: whiteTitle ?? Colors.blue,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
