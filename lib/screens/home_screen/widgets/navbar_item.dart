// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:student_evaluation/fast_tools/helpers/responsive.dart';
import 'package:student_evaluation/fast_tools/widgets/button_wrapper.dart';
import 'package:student_evaluation/fast_tools/widgets/custom_text_field.dart';
import 'package:student_evaluation/fast_tools/widgets/h_line.dart';
import 'package:student_evaluation/fast_tools/widgets/h_space.dart';
import 'package:student_evaluation/fast_tools/widgets/padding_wrapper.dart';
import 'package:student_evaluation/fast_tools/widgets/v_space.dart';
import 'package:student_evaluation/theming/constants/sizes.dart';
import 'package:student_evaluation/theming/constants/styles.dart';
import 'package:student_evaluation/theming/theme_calls.dart';
import 'package:intl/intl.dart' as intl;

class NavBarItem extends StatelessWidget {
  final String title;
  final bool active;
  final String iconName;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.title,
    required this.active,
    required this.iconName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: onTap,
      child: active
          ? Container(
              padding: EdgeInsets.symmetric(
                horizontal: kHPad / 2,
                vertical: kVPad / 2,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(1000),
              ),
              child: Text(
                title,
                style: h4TextStyleInactive.copyWith(
                  color: colorTheme.kBlueColor,
                ),
              ),
            )
          : Image.asset(
              'assets/icons/$iconName.png',
            ),
    );
  }
}
