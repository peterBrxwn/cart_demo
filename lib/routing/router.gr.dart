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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:cart_demo/features/category/view/view.dart' as _i2;
import 'package:cart_demo/features/order/view/view.dart' as _i3;
import 'package:cart_demo/features/tab/view/view.dart' as _i1;
import 'package:flutter/material.dart' as _i5;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    TabRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.TabPage(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(child: const _i2.CategoryPage()),
      );
    },
    OrderRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.OrderPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'tab',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          TabRoute.name,
          path: 'tab',
          children: [
            _i4.RouteConfig(
              '#redirect',
              path: '',
              parent: TabRoute.name,
              redirectTo: 'category',
              fullMatch: true,
            ),
            _i4.RouteConfig(
              CategoryRoute.name,
              path: 'category',
              parent: TabRoute.name,
            ),
            _i4.RouteConfig(
              OrderRoute.name,
              path: 'order',
              parent: TabRoute.name,
            ),
          ],
        ),
        _i4.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.TabPage]
class TabRoute extends _i4.PageRouteInfo<void> {
  const TabRoute({List<_i4.PageRouteInfo>? children})
      : super(
          TabRoute.name,
          path: 'tab',
          initialChildren: children,
        );

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i2.CategoryPage]
class CategoryRoute extends _i4.PageRouteInfo<void> {
  const CategoryRoute()
      : super(
          CategoryRoute.name,
          path: 'category',
        );

  static const String name = 'CategoryRoute';
}

/// generated route for
/// [_i3.OrderPage]
class OrderRoute extends _i4.PageRouteInfo<void> {
  const OrderRoute()
      : super(
          OrderRoute.name,
          path: 'order',
        );

  static const String name = 'OrderRoute';
}
