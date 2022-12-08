// Package imports:
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:cart_demo/core/network/api_client.dart';
import 'package:cart_demo/features/product/data/datasources/product_datasource.dart';
import 'package:cart_demo/features/product/services/repo.dart';
import 'package:cart_demo/features/taxonomy/data/datasources/taxonomy_datasource.dart';
import 'package:cart_demo/features/taxonomy/services/repo.dart';
import 'package:cart_demo/routing/router.gr.dart';

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @injectable
  AppRouter get appRouter => AppRouter();

  @injectable
  ApiClient get apiClient => ApiClient();

  @injectable
  ProductImpl get productRepo => ProductImpl(
        ProductDatasourceImpl(apiClient: apiClient),
      );

  @injectable
  TaxonomyImpl get taxonomyRepo => TaxonomyImpl(
        TaxonomyDatasourceImpl(apiClient: apiClient),
      );
}
