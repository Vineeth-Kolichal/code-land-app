
import 'package:dev_test/core/theme/app_theme.dart';
import 'package:dev_test/core/theme/font_styles.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      color: AppTheme.bottomNavColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavItem(
            imageNo: 1,
            label: 'Tracking',
            onTap: () {
              bottonNavNotifier.value = 0;
            },
          ),
          BottomNavItem(
            imageNo: 2,
            label: 'Task',
            onTap: () {
              bottonNavNotifier.value = 1;
            },
          ),
          BottomNavItem(
            imageNo: 3,
            label: 'Ticket',
            onTap: () {
              bottonNavNotifier.value = 2;
            },
          ),
          BottomNavItem(
            imageNo: 4,
            label: 'MIS',
            onTap: () {
              bottonNavNotifier.value = 3;
            },
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem(
      {super.key,
      required this.imageNo,
      required this.label,
      required this.onTap});
  final String label;
  final int imageNo;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 52,
        width: size.width * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/b$imageNo.png',
              height: 15,
            ),
            Text(
              label,
              style: txt10White400,
            )
          ],
        ),
      ),
    );
  }
}
