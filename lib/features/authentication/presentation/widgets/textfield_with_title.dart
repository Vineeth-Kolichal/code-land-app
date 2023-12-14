
import 'package:dev_test/core/theme/app_theme.dart';
import 'package:dev_test/core/theme/font_styles.dart';
import 'package:flutter/material.dart';

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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please fill login credentials";
                } else {
                  return null;
                }
              },
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
