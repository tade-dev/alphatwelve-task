import 'package:alphatwelve_task/core/resources/colors.dart';
import 'package:alphatwelve_task/core/resources/styles.dart';
import 'package:alphatwelve_task/gen/assets.gen.dart';
import 'package:alphatwelve_task/ui/widgets/build_back_v.dart';
import 'package:alphatwelve_task/ui/widgets/build_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

buildAppBar({
  bool searchable = false,
  bool hasBack = false,
  List<Widget>? actions,
  required String title,
  String? backLabel,
  required String address,
  Widget? leading,
  Function()? onback
}) {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorManager.white,
              border: Border(
                bottom: BorderSide(
                  color: ColorManager.gray3
                )
              )
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          title,
                          style: getSemiBoldStyle(
                            color: ColorManager.gray2,
                            fontSize: 10
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          address,
                          style: getSemiBoldStyle(
                            color: ColorManager.gray2,
                            fontSize: 12
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                searchable ?
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: BuildInputFiled(
                    onChanged: (v){
                  
                    },
                    prefixIcon: SvgPicture.asset(
                      Assets.icons.search,
                      height: 25,
                      width: 25,
                    ),
                    hintText: "Search...",
                  ),
                ): 
                SizedBox()
              ],
            ),
          ),
          hasBack ?
            buildBackView(
              onClick: onback ?? (){}, 
              title: backLabel ?? ""
            ) : SizedBox()
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 20, top: 20),
        child: leading ?? SvgPicture.asset(
          Assets.svg.logo
        ),
      ),
      Positioned(
        right: 0,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, top: 20),
          child: Row(
            children: actions ?? [
              SvgPicture.asset(
                Assets.icons.notification
              )
            ],
          ),
        ),
      )
    ],
  );
}