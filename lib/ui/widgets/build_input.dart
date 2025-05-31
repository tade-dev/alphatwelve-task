import 'package:alphatwelve_task/core/resources/colors.dart';
import 'package:alphatwelve_task/core/resources/styles.dart';
import 'package:flutter/material.dart';

class BuildInputFiled extends StatelessWidget {

  final TextEditingController? controller;
  final String? hintText;
  final String? label;
  final TextInputType? inputType;
  final bool enabled;
  final Function()? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final bool expand;
  final bool obscureText;
  final Function(String?)? onSaved;
  final ValueChanged<String> onChanged;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onEditingComplete;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool autofocus;
  final FormFieldValidator<String>? validator;

  const BuildInputFiled({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.label,
    this.inputType,
    this.enabled = true,
    this.expand = false,
    this.onTap,
    this.onSaved,
    this.textInputAction,
    this.onEditingComplete,
    required this.onChanged,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.autofocus = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        style: getMediumStyle(
          color: ColorManager.text,
          fontSize: 15
        ),
        controller: controller,
        onEditingComplete: onEditingComplete,
        onSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            height: 25,
            width: 25,
            child: Center(child: prefixIcon),
          ),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: getRegularStyle(
            color: ColorManager.light,
            fontSize: 15
          ),
          contentPadding: EdgeInsets.zero,
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          disabledBorder: buildBorder(),
        ),
      ),
    );
  }

  buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: ColorManager.gray3
      )
    );
  }

}