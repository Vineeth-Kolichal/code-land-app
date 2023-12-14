
import 'package:dev_test/common/widgets/space.dart';
import 'package:dev_test/core/theme/app_theme.dart';
import 'package:dev_test/core/theme/font_styles.dart';
import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      //height: 88,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.lightGreyColor2,
        border: Border.all(color: AppTheme.yelloBordeColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Name: XXXX'), Text("Vehicle # : KA 01 JK2345")],
          ),
          Space.y(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 24,
                width: 74,
                decoration: BoxDecoration(
                  color: AppTheme.redColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Ward : 05",
                    style: txt10White400,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  height: 24,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.blackColor, width: 0.5),
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        const Text(
                          "9886745344",
                          style: txt10Black400,
                        ),
                        Space.x(5),
                        Image.asset('assets/Icons/Outgoing Call.png')
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
