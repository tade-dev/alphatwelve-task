import 'package:alphatwelve_task/core/resources/colors.dart';
import 'package:alphatwelve_task/core/resources/styles.dart';
import 'package:flutter/material.dart';

buildBackView({
  required Function() onClick,
  required String title,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: ColorManager.white,
      border: Border(
        bottom: BorderSide(
          color: ColorManager.whiteAlt
        )
      )
    ),
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 10,
      leading: GestureDetector(
        onTap: onClick, 
        child: Icon(
          Icons.chevron_left,
          color: ColorManager.icon,
        )
      ),
      title: Text(
        title,
        style: getBoldStyle(
          color: ColorManager.text,
          fontSize: 18
        ),
      ),
    )
  );
}