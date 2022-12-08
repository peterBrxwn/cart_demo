// Project imports:
import 'package:cart_demo/core/config.dart';

final baseUrl = AppConfig.baseUrl;

class _Product {
  final list = '$baseUrl/api/products';
}

class _Taxonomy {
  final list = '$baseUrl/api/taxonomies';
}

final productEndpoint = _Product();
final taxonomyEndpoint = _Taxonomy();
