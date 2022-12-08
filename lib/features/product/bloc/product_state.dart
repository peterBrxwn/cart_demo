part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.notifMsg,
    this.status = ProductStatus.loading,
    this.products = const [],
  });
  final NotifMsg? notifMsg;
  final ProductStatus? status;
  final List<Product> products;

  ProductState copyWith({
    NotifMsg? notifMsg,
    ProductStatus? status,
    List<Product>? products,
  }) {
    return ProductState(
      notifMsg: notifMsg ?? this.notifMsg,
      status: status ?? ProductStatus.initial,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [notifMsg, status, products];
}

enum ProductStatus { initial, loading, error, loaded }
