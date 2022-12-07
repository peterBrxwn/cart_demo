// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:cart_demo/features/category/view/view.dart';
import 'package:cart_demo/features/order/view/view.dart';
import 'package:cart_demo/features/product/view/view.dart';
import 'package:cart_demo/features/tab/view/view.dart';

// Project imports:

@MaterialAutoRouter(
  preferRelativeImports: false,
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      children: [
        AutoRoute(
          initial: true,
          page: CategoryPage,
          path: CategoryPage.routeName,
        ),
        AutoRoute(
          page: OrderPage,
          path: OrderPage.routeName,
        ),
      ],
      initial: true,
      page: TabPage,
      path: TabPage.routeName,
    ),
    RedirectRoute(path: "*", redirectTo: ""),
  ],
)
class $AppRouter {}
