part of 'order_bloc.dart';

class OrderState extends Equatable {
  const OrderState({
    this.deliveryFee = 0,
    this.idToQuantity = const {},
    this.notifMsg,
    this.orderCount = 0,
    this.idToOrder = const {},
    this.orderTotal = 0,
    this.status = OrderStatus.initial,
  });
  final double deliveryFee;
  final Map<int, int> idToQuantity;
  final NotifMsg? notifMsg;
  final int orderCount;
  final Map<int, Variant> idToOrder;
  final double orderTotal;
  final OrderStatus? status;

  OrderState copyWith({
    double? deliveryFee,
    Map<int, int>? idToQuantity,
    NotifMsg? notifMsg,
    int? orderCount,
    Map<int, Variant>? idToOrder,
    double? orderTotal,
    OrderStatus? status,
  }) {
    return OrderState(
      deliveryFee: deliveryFee ?? this.deliveryFee,
      idToQuantity: idToQuantity ?? this.idToQuantity,
      notifMsg: notifMsg ?? this.notifMsg,
      orderCount: (idToOrder ?? this.idToOrder).keys.length,
      idToOrder: idToOrder ?? this.idToOrder,
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
        idToOrder,
        orderTotal,
        status,
      ];
}

enum OrderStatus { initial, error }
