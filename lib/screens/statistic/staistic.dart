
import 'package:flutter/material.dart';
import 'package:istudy/tools/colors.dart';

class ChekScreen extends StatelessWidget {
  const ChekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 360,
            color: AppColors.primaryColor,
          )
        ],
      ),
    );
  }
}
