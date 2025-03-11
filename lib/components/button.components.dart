import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonComponents extends StatelessWidget {
  const ButtonComponents({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final Future<void> Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await onPressed();
      },
      child: Container(
        width: Adaptive.w(40),
        height: Adaptive.h(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: Adaptive.w(5),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
