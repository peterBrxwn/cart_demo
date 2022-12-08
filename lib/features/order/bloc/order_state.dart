part of 'order_bloc.dart';

class OrderState extends Equatable {
  const OrderState({
    this.deliveryFee = 0,
    this.idToOrder = const {},
    this.idToQuantity = const {},
    this.notifMsg,
    this.orderCount = 0,
    this.orderTotal = 0,
    this.status = OrderStatus.initial,
  });
  final double deliveryFee;
  final Map<int, Variant> idToOrder;
  final Map<int, int> idToQuantity;
  final NotifMsg? notifMsg;
  final int orderCount;
  final double orderTotal;
  final OrderStatus? status;

  OrderState copyWith({
    double? deliveryFee,
    Map<int, Variant>? idToOrder,
    Map<int, int>? idToQuantity,
    NotifMsg? notifMsg,
    int? orderCount,
    double? orderTotal,
    OrderStatus? status,
  }) {
    return OrderState(
      deliveryFee: deliveryFee ?? this.deliveryFee,
      idToOrder: idToOrder ?? this.idToOrder,
      idToQuantity: idToQuantity ?? this.idToQuantity,
      notifMsg: notifMsg ?? this.notifMsg,
      orderCount: (idToOrder ?? this.idToOrder).keys.length,
      orderTotal: orderTotal ?? this.orderTotal,
      status: status ?? OrderStatus.initial,
    );
  }

  @override
  List<Object?> get props => [
        deliveryFee,
        idToOrder,
        idToQuantity,
        notifMsg,
        orderCount,
        orderTotal,
        status,
      ];
}

enum OrderStatus { initial, error }
