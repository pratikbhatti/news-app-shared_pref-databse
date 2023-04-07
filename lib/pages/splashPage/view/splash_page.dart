import 'dart:async';

import 'package:demo50/pages/homePage/view/home_page.dart';
import 'package:demo50/pages/loginPage/view/login_page.dart';
import 'package:demo50/utility/helpers/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 5), () async {
      bool? check_login = await Shared_preference.shared_preference.readLogin();
      print(check_login);
      if (check_login == true) {
        Get.off(LoginPage());
      } else if (check_login == null) {
        Get.off(LoginPage());
      } else {
        Get.off(HomePage());
      }

      // if (Shared_preference.shared_preference.readLogin == true) {
      //   Get.off(LoginPage());
      // } else {
      //   Get.off(HomePage());
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Lottie.asset(
            'assets/json/news-icon.json',
            repeat: true,
            reverse: false,
          ),
        ),
      ),
    );
  }
}
