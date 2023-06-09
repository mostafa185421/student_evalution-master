// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_evaluation/fast_tools/widgets/button_wrapper.dart';
import 'package:student_evaluation/fast_tools/widgets/h_space.dart';
import 'package:student_evaluation/fast_tools/widgets/v_space.dart';
import 'package:student_evaluation/theming/constants/sizes.dart';
import 'package:student_evaluation/theming/constants/styles.dart';
import 'package:student_evaluation/theming/theme_calls.dart';

class DateChoosingCard extends StatelessWidget {
  final String title;
  final DateTime? dateTime;
  final VoidCallback onTap;
  final TimeOfDay? timeOfDay;

  const DateChoosingCard({
    super.key,
    required this.title,
    this.dateTime,
    required this.onTap,
    this.timeOfDay,
  });

  @override
  Widget build(BuildContext context) {
    if (dateTime == null && timeOfDay == null) {
      throw Exception('You must enter either a date or a time ');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: h3InactiveTextStyle,
        ),
        VSpace(factor: .4),
        ButtonWrapper(
          onTap: onTap,
          padding: EdgeInsets.symmetric(
            horizontal: kHPad / 2,
            vertical: kVPad / 2.5,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              mediumBorderRadius,
            ),
            border: Border.all(
              width: .3,
              color: colorTheme.inActiveText.withOpacity(.7),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/attendance.png',
                color: colorTheme.kBlueColor,
                width: smallIconSize,
              ),
              HSpace(factor: .4),
              Text(
                dateTime == null
                    ? DateFormat.jm().format(
                        DateTime(
                          2023,
                          1,
                          1,
                          timeOfDay!.hour,
                          timeOfDay!.minute,
                        ),
                      )
                    : DateFormat('MMM dd,yyyy').format(
                        dateTime!,
                      ),
                style: h4TextStyleInactive,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
