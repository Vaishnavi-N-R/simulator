import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/constants/colors.dart';
import 'package:trade_simulator/theme/custom_themes/text_theme.dart';

class CardDesignContainer extends StatelessWidget {
  final Widget child;

  const CardDesignContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: Get.isDarkMode
            ? TColors.linearGradientdark
            : TColors.linearGradientlight,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}


