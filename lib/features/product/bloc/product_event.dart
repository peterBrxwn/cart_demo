part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductInit extends ProductEvent {
  const ProductInit({required this.taxon});
  final String taxon;

  @override
  List<Object> get props => [taxon];
}
