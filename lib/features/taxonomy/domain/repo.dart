// Project imports:
import 'package:cart_demo/core/typedef.dart';
import 'package:cart_demo/features/taxonomy/domain/entity/taxon_entity.dart';
import 'package:cart_demo/features/taxonomy/domain/params/taxonomy_api_param.dart';

abstract class TaxonomyRepo {
  Future<ErrorOrType<List<Taxon>>> list({required TaxonomyApiParam param});
}
