import 'package:cart_demo/core/app_error.dart';
import 'package:cart_demo/core/exceptions.dart';
import 'package:cart_demo/core/network/api_client.dart';
import 'package:cart_demo/core/network/api_endpoints.dart';
import 'package:cart_demo/core/typedef.dart';
import 'package:cart_demo/features/taxonomy/domain/params/taxonomy_api_param.dart';
import 'package:cart_demo/features/taxonomy/services/models/taxon_model.dart';
import 'package:cart_demo/utils/strings.dart';
import 'package:dartz/dartz.dart';

abstract class TaxonomyDatasource {
  Future<ErrorOrType<List<TaxonModel>>> list(TaxonomyApiParam param);
}

class TaxonomyDatasourceImpl implements TaxonomyDatasource {
  TaxonomyDatasourceImpl({required this.apiClient});
  final ApiClient apiClient;

  @override
  Future<ErrorOrType<List<TaxonModel>>> list(
    TaxonomyApiParam param,
  ) async {
    try {
      final response = await apiClient.get(
        '${taxonomyEndpoint.list}/${param.taxonomy}',
      );
      final data = (response.data as List<dynamic>)
          .map((e) => TaxonModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(data);
    } on ApiException catch (err, _) {
      return Left(AppError(message: err.message));
    } catch (err, _) {
      return Left(AppError(message: kError));
    }
  }
}
