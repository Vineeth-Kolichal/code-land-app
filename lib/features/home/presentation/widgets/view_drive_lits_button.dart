
import 'package:dev_test/common/widgets/space.dart';
import 'package:dev_test/core/theme/app_theme.dart';
import 'package:dev_test/core/theme/font_styles.dart';
import 'package:flutter/material.dart';

class ViewDriveListButton extends StatelessWidget {
  const ViewDriveListButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 150,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
            color: AppTheme.buttonBlue,
            onPressed: onPressed,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View Driver List',
                  style: txt12White400,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.whiteColor,
                  size: 14,
                )
              ],
            ),
          ),
        ),
        Space.x(30)
      ],
    );
  }
}
