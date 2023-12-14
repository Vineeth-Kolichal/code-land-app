import 'package:dev_test/common/widgets/space.dart';
import 'package:dev_test/core/theme/app_theme.dart';
import 'package:dev_test/core/theme/font_styles.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.themeYello,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(8),
          ),
        ),
        title: Text(
          "Login",
          style: txt16Black500,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Space.y(38),
              Image.asset(
                'assets/images/logo.png',
                height: 158,
                width: 158,
              ),
              Space.y(38),
              const Text(
                'Login to your Account',
                style: txt20Black500,
              ),
              Space.y(38),
              TextFieldWithTitle(
                controller: TextEditingController(),
                title: 'Enter user name',
              ),
              Space.y(20),
              TextFieldWithTitle(
                controller: TextEditingController(),
                title: 'Password',
              ),
              Space.y(68),
              LoginButton(
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 48,
      width: size.width * 0.6,
      child: MaterialButton(
          color: AppTheme.themeYello,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Space.x(5),
              const Text(
                'Login',
                style: txt24Black500,
              ),
              const Icon(Icons.arrow_circle_right_outlined)
            ],
          )),
    );
  }
}

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle(
      {super.key, required this.controller, required this.title});
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: txt16Black500,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppTheme.textFieldBg,
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                fillColor: AppTheme.textFieldBg,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
