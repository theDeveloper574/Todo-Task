import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_utils/contestants.dart';
import 'home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const HomeView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          splashImg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
