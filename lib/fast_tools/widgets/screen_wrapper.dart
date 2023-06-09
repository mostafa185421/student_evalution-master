import 'package:flutter/material.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  const ScreenWrapper(
      {super.key, required this.body, this.appBar, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          body,
          // GestureDetector(
          //   onTap: () {
          //     CNav.pushNamed(context, TestScreen.routeName);
          //   },
          //   child: Container(
          //     width: 50,
          //     height: 100,
          //     color: Colors.red,
          //   ),
          // ),
        ],
      ),
      appBar: appBar,
    );
  }
}
