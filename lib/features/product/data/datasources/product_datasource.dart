// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:cart_demo/core/app_error.dart';
import 'package:cart_demo/core/exceptions.dart';
import 'package:cart_demo/core/network/api_client.dart';
import 'package:cart_demo/core/network/api_endpoints.dart';
import 'package:cart_demo/core/typedef.dart';
import 'package:cart_demo/features/product/domain/entity/product_entity.dart';
import 'package:cart_demo/features/product/domain/params/product_api_param.dart';
import 'package:cart_demo/features/product/services/models/product_model.dart';
import 'package:cart_demo/utils/strings.dart';

abstract class ProductDatasource {
  Future<ErrorOrType<List<Product>>> list(ProductApiParam param);
}

class ProductDatasourceImpl implements ProductDatasource {
  ProductDatasourceImpl({required this.apiClient});
  final ApiClient apiClient;

  @override
  Future<ErrorOrType<List<Product>>> list(ProductApiParam param) async {
    try {
      final response = await apiClient.get(
        productEndpoint.list,
        queryParameters: param.toJson(),
      );
      final data = (response.data['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(data);
    } on ApiException catch (err, _) {
      return Left(AppError(message: err.message));
    } catch (err, _) {
      return Left(AppError(message: kError));
    }
  }
}
