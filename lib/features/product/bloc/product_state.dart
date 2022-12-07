part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.notifMsg,
    this.status = Status.loading,
    this.products = const [],
  });
  final NotifMsg? notifMsg;
  final Status? status;
  final List<Product> products;

  ProductState copyWith({
    NotifMsg? notifMsg,
    Status? status,
    List<Product>? products,
  }) {
    return ProductState(
      notifMsg: notifMsg ?? this.notifMsg,
      status: status ?? Status.initial,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [notifMsg, status, products];
}

enum Status { initial, loading, error, loaded }
