import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../core/types.dart';
import '../init/runtime_variables.dart';
import '../theming/theme_calls.dart';

class GlobalUtils {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
    Color? textColor,
    SnackBarType? snackBarType,
    bool aboveBottomNavBar = false,
    EdgeInsets? margin,
    VoidCallback? onActionTapped,
    String? actionString,
  }) {
    logger.i(message);
    try {
      if (!context.mounted) {
        logger.e('context is disposed $message');
        return;
      }
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: aboveBottomNavBar ? SnackBarBehavior.floating : null,
          content: Text(
            message,
          ),
          backgroundColor: backgroundColor ??
              ((snackBarType ?? SnackBarType.info) == SnackBarType.success
                  ? colorTheme.kGreenColor
                  : (snackBarType ?? SnackBarType.info) == SnackBarType.error
                      ? colorTheme.kDangerColor
                      : null),
          margin: margin,
          action: SnackBarAction(
            label: actionString ?? 'done',
            textColor: textColor ??
                ((snackBarType ?? SnackBarType.info) == SnackBarType.error ||
                        (snackBarType ?? SnackBarType.info) ==
                            SnackBarType.success ||
                        (snackBarType ?? SnackBarType.info) == SnackBarType.info
                    ? Colors.white
                    : null),
            onPressed: onActionTapped ?? () {},
          ),
        ),
      );
    } catch (e) {
      //
    }
  }

  static void fastSnackBar({
    required String msg,
    SnackBarType? snackBarType,
    GlobalKey<NavigatorState>? navKey,
  }) {
    BuildContext? ctx = (navKey ?? navigatorKey).currentContext;
    if (ctx == null) return;
    showSnackBar(
      context: ctx,
      message: msg,
      snackBarType: snackBarType,
    );
  }

  static String formatDuration(Duration d) {
    var seconds = d.inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('$days day${putS(days)}');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('$hours hour${putS(hours)}');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('$minutes minute${putS(minutes)}');
    }
    tokens
        .add('${seconds < 10 ? '0$seconds' : seconds} second${putS(seconds)}');

    return tokens.join(' ');
  }

  static String putS(int n, [bool capital = false]) {
    if (n > 1) {
      return capital ? 'S' : 's';
    } else {
      return '';
    }
  }

  static dynamic stringToEnum<T>(String n, List<T> e) {
    for (var name in e) {
      if (n == name.toString().split('.').last) {
        return name;
      }
    }
  }

  static void copyToClipboard(
      {required BuildContext context,
      required String data,
      bool showSnack = true,
      String snackContent = 'Copied To Clipboard'}) {
    Clipboard.setData(ClipboardData(text: data));
    if (showSnack) fastSnackBar(msg: snackContent);
  }

  static String dateToString(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
