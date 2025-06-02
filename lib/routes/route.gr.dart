// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../ui/dashboard/dashboard_v.dart' as _i1;
import '../ui/dashboard/home/product_details_v.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DashboardV.name: (routeData) {
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardV(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProductDetailsV.name: (routeData) {
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.ProductDetailsV(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          DashboardV.name,
          path: '/',
        ),
        _i3.RouteConfig(
          ProductDetailsV.name,
          path: '/product-details-v',
        ),
      ];
}

/// generated route for
/// [_i1.DashboardV]
class DashboardV extends _i3.PageRouteInfo<void> {
  const DashboardV()
      : super(
          DashboardV.name,
          path: '/',
        );

  static const String name = 'DashboardV';
}

/// generated route for
/// [_i2.ProductDetailsV]
class ProductDetailsV extends _i3.PageRouteInfo<void> {
  const ProductDetailsV()
      : super(
          ProductDetailsV.name,
          path: '/product-details-v',
        );

  static const String name = 'ProductDetailsV';
}
