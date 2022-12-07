// Package imports:
import 'package:cart_demo/core/typedef.dart';
import 'package:cart_demo/features/taxonomy/data/datasources/taxonomy_datasource.dart';
import 'package:cart_demo/features/taxonomy/domain/entity/taxon_entity.dart';
import 'package:cart_demo/features/taxonomy/domain/entity/taxonomy_entity.dart';
import 'package:cart_demo/features/taxonomy/domain/params/taxonomy_api_param.dart';
import 'package:cart_demo/features/taxonomy/domain/repo.dart';

class TaxonomyImpl implements TaxonomyRepo {
  TaxonomyImpl(this.taxonomyDatasource);
  TaxonomyDatasource taxonomyDatasource;

  @override
  Future<ErrorOrType<List<Taxon>>> list({
    required TaxonomyApiParam param,
  }) async {
    return await taxonomyDatasource.list(param);
  }
}
