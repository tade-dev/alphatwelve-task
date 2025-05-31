import 'package:alphatwelve_task/core/resources/colors.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorManager.background,
  appBarTheme: AppBarTheme(
    backgroundColor: ColorManager.background,
    elevation: 0,
    scrolledUnderElevation: 0
  ),
  iconTheme:  IconThemeData(
    color: ColorManager.text
  ),
);