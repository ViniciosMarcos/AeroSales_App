import 'package:aerosales_app/src/configs/custom_colors.dart';
import 'package:aerosales_app/src/pages/commom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  final Color? baseColor;
  final Color? highlightColor;
  final bool isRounded;
  final BorderRadius? borderRadius;

  const CustomShimmer({
    Key? key,
    required this.height,
    required this.width,
    this.baseColor,
    this.highlightColor,
    this.isRounded = false,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: SizedBox(
        height: 55,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade500,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withAlpha(50),
            ),
          ),
        ),
      ),
    );
  }
}
