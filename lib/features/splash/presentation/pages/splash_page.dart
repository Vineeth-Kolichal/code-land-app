import 'dart:async';

import 'package:dev_test/core/dependancy_injection/modules/cookie_module.dart';
import 'package:dev_test/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../core/api_endpoints/api_endpoints.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final cookies = await persistCookieJar.loadForRequest(
          Uri.parse('${ApiEndpoints.baseUrl}${ApiEndpoints.login}'));
      Timer(const Duration(seconds: 3), () {
        if (cookies.isEmpty) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.login);
        } else {
          Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        }
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
