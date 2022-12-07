// Flutter imports:
import 'package:cart_demo/core/network/network.dart';
import 'package:cart_demo/features/order/bloc/order_bloc.dart';
import 'package:cart_demo/features/product/data/datasources/product_datasource.dart';
import 'package:cart_demo/features/product/services/repo.dart';
import 'package:cart_demo/features/taxonomy/data/datasources/taxonomy_datasource.dart';
import 'package:cart_demo/features/taxonomy/services/repo.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:cart_demo/injection.dart';
import 'package:cart_demo/routing/observer.dart';
import 'package:cart_demo/routing/router.gr.dart';
import 'package:cart_demo/utils/app_theme.dart';

class CartDemo extends StatelessWidget {
  CartDemo({Key? key}) : super(key: key);
  final _appRouter = locator<AppRouter>();
  final _apiClient = ApiClient();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) {
            ProductImpl(
              ProductDatasourceImpl(apiClient: _apiClient),
            );
          },
        ),
        RepositoryProvider(
          create: (_) {
            TaxonomyImpl(
              TaxonomyDatasourceImpl(apiClient: _apiClient),
            );
          },
        ),
      ],
      child: BlocProvider(
        create: (context) => OrderBloc(),
        child: MaterialApp.router(
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate(
            _appRouter,
            navigatorObservers: () => [AppRouteObserver()],
          ),
          theme: AppTheme.themeDataLight,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
