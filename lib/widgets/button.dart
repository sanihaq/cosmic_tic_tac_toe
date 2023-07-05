import 'package:flutter/material.dart';

import '../theme/constants.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      child: Container(
        decoration: BoxDecoration(
          color: kButtonColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
          child: Text(
            label,
            style: const TextStyle(
              color: kButtonTextColor,
              fontSize: 9,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }
}
