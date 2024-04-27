import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:istudy/screens/home/home.dart';
import 'package:istudy/screens/main.dart';
import 'package:istudy/tools/colors.dart';
import 'package:istudy/widgets/text_widget.dart';
import 'package:svg_icon/svg_icon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void didChangeDependencies() {
    if (mounted) {
      Timer(const Duration(seconds: 2), () {
        if (kDebugMode) {}
        Get.offAll(
          const MainScreen(),
        );
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset('assets/splash.svg'),
          ),
          const TextWidget(txt: 'iStudy',txtColor: Colors.white,)
        ],
      ),
    );
  }
}
