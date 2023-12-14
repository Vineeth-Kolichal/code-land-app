
import 'package:dev_test/core/theme/app_theme.dart';
import 'package:dev_test/core/theme/font_styles.dart';
import 'package:flutter/material.dart';

class TastStatusContainer extends StatelessWidget {
  const TastStatusContainer({
    super.key,
    required this.label,
    required this.count,
    required this.labelStyle,
  });
  final String label;
  final int count;
  final TextStyle labelStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 96,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: AppTheme.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppTheme.lightGreyColor,
            blurRadius: 3,
            spreadRadius: 0.5,
            offset: Offset(0.0, 4.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Column(children: [
        Text(
          "$count",
          style: txt32Black400,
        ),
        Text(
          label,
          style: labelStyle,
        )
      ]),
    );
  }
}
