part of 'order_bloc.dart';

class OrderState extends Equatable {
  const OrderState({
    this.deliveryFee = 0,
    this.idToQuantity = const {},
    this.notifMsg,
    this.orderCount = 0,
    this.orders = const {},
    this.orderTotal = 0,
    this.status = OrderStatus.initial,
  });
  final double deliveryFee;
  final Map<int, int> idToQuantity;
  final NotifMsg? notifMsg;
  final int orderCount;
  final Map<int, Variant> orders;
  final double orderTotal;
  final OrderStatus? status;

  OrderState copyWith({
    double? deliveryFee,
    Map<int, int>? idToQuantity,
    NotifMsg? notifMsg,
    int? orderCount,
    Map<int, Variant>? orders,
    double? orderTotal,
    OrderStatus? status,
  }) {
    return OrderState(
      deliveryFee: deliveryFee ?? this.deliveryFee,
      idToQuantity: idToQuantity ?? this.idToQuantity,
      notifMsg: notifMsg ?? this.notifMsg,
      orderCount: (orders ?? this.orders).keys.length,
      orders: orders ?? this.orders,
      orderTotal: orderTotal ?? this.orderTotal,
      status: status ?? OrderStatus.initial,
    );
  }

  @override
  List<Object?> get props => [
        deliveryFee,
        idToQuantity,
        notifMsg,
        orderCount,
        orders,
        orderTotal,
        status,
      ];
}

enum OrderStatus { initial, error }
