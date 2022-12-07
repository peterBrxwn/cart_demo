// Package imports:
import 'package:cart_demo/core/typedef.dart';
import 'package:cart_demo/features/product/data/datasources/product_datasource.dart';
import 'package:cart_demo/features/product/domain/entity/product_entity.dart';
import 'package:cart_demo/features/product/domain/params/product_api_param.dart';
import 'package:cart_demo/features/product/domain/repo.dart';

class ProductImpl implements ProductRepo {
  ProductImpl(this.productDatasource);
  ProductDatasource productDatasource;

  @override
  Future<ErrorOrType<List<Product>>> list({
    required ProductApiParam param,
  }) async {
    return await productDatasource.list(param);
  }
}
