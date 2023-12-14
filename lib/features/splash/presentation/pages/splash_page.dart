import 'dart:async';

import 'package:dev_test/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      });
    });
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'icon',
          child: Image.asset(
            'assets/images/logo.png',
            height: 178,
            width: 178,
          ),
        ),
      ),
    );
  }
}
