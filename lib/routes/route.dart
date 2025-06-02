import 'package:alphatwelve_task/ui/dashboard/dashboard_v.dart';
import 'package:alphatwelve_task/ui/dashboard/home/product_details_v.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  transitionsBuilder: buildTransitions,
  routes: <CustomRoute>[
    CustomRoute(page: DashboardV, initial: true),
    CustomRoute(page: ProductDetailsV),
  ]
)


@lazySingleton
class $AppRouter {}

Widget buildTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(opacity: animation, child: child);
}