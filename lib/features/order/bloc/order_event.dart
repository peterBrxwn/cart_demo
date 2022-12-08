part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderClear extends OrderEvent {
  const OrderClear();

  @override
  List<Object> get props => [];
}

class OrderDecrement extends OrderEvent {
  const OrderDecrement({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}

class OrderIncrement extends OrderEvent {
  const OrderIncrement({required this.variant});
  final Variant variant;

  @override
  List<Object> get props => [variant];
}

class OrderQuantityChanged extends OrderEvent {
  const OrderQuantityChanged();

  @override
  List<Object> get props => [];
}

class OrderRemove extends OrderEvent {
  const OrderRemove({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}
