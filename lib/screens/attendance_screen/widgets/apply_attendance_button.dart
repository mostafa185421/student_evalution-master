// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_evaluation/fast_tools/widgets/button_wrapper.dart';
import 'package:student_evaluation/theming/constants/sizes.dart';
import 'package:student_evaluation/theming/constants/styles.dart';
import 'package:student_evaluation/theming/theme_calls.dart';

class ApplyAttendanceButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool active;
  const ApplyAttendanceButton({
    super.key,
    required this.title,
    required this.onTap,
    this.active = true,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      active: active,
      onTap: onTap,
      decoration: BoxDecoration(
        color: active
            ? colorTheme.kBlueColor
            : colorTheme.kBlueColor.withOpacity(
                .5,
              ),
        borderRadius: BorderRadius.circular(
          mediumBorderRadius,
        ),
        boxShadow: [
          BoxShadow(
            color: colorTheme.kBlueColor.withOpacity(
              .4,
            ),
            blurRadius: 20,
            offset: Offset(5, 5),
          ),
        ],
        border: Border.all(
          width: 1,
          color: colorTheme.kBlueColor,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kHPad,
        vertical: kVPad / 3,
      ),
      child: Text(
        title,
        style: h3LightTextStyle.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
