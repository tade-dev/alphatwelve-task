import 'package:alphatwelve_task/core/resources/colors.dart';
import 'package:alphatwelve_task/core/resources/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildBtn extends StatelessWidget {

  Function()? onPressed;
  String? label;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  final bool disabled;

  BuildBtn({
    super.key,
    this.onPressed,
    this.label,
    this.color,
    this.textColor,
    this.width,
    this.height,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: disabled ?
        null : 
        onPressed, 
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor: ColorManager.disable,
          disabledForegroundColor: ColorManager.icon,
          backgroundColor: color ?? ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
        child: Text(
          label ?? "Button",
          style: getBoldStyle(
            color: textColor ?? ColorManager.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}