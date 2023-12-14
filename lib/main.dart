import 'package:dev_test/core/theme/app_theme.dart';
import 'package:dev_test/features/Authentication/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DevTestApp());
}

class DevTestApp extends StatelessWidget {
  const DevTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: LoginPage(),
    );
  }
}
