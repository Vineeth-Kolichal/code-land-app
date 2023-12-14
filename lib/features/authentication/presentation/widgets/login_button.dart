import 'package:dev_test/common/widgets/space.dart';
import 'package:dev_test/core/theme/app_theme.dart';
import 'package:dev_test/core/theme/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key, required this.onPressed, required this.isLoading});
  final VoidCallback onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 48,
      width: size.width * 0.6,
      child: MaterialButton(
          elevation: 5,
          color: AppTheme.themeYello,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: onPressed,
          child: isLoading
              ? LoadingAnimationWidget.staggeredDotsWave(
                  color: AppTheme.blackColor, size: 35)
              : Row(
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
