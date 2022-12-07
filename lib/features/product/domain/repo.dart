// Project imports:
import 'package:cart_demo/core/typedef.dart';
import 'package:cart_demo/features/product/domain/entity/product_entity.dart';
import 'package:cart_demo/features/product/domain/params/product_api_param.dart';

abstract class ProductRepo {
  Future<ErrorOrType<List<Product>>> list({required ProductApiParam param});
}
