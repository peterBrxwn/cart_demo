part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.notifMsg,
    this.products = const [],
    this.status = ProductStatus.loading,
    this.taxon,
  });
  final NotifMsg? notifMsg;
  final List<Product> products;
  final ProductStatus? status;
  final Taxon? taxon;

  ProductState copyWith({
    NotifMsg? notifMsg,
    List<Product>? products,
    ProductStatus? status,
    Taxon? Function()? taxon,
  }) {
    return ProductState(
      notifMsg: notifMsg ?? this.notifMsg,
      products: products ?? this.products,
      status: status ?? ProductStatus.initial,
      taxon: taxon != null ? taxon() : this.taxon,
    );
  }

  @override
  List<Object?> get props => [notifMsg, products, status, taxon];
}

enum ProductStatus { initial, loading, error, loaded }
