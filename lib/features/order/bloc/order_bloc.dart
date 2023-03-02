// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:cart_demo/features/notification/services/models/notif_msg.dart';
import 'package:cart_demo/features/product/domain/entity/variant_entity.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderState()) {
    on<OrderClear>(_orderClear);
    on<OrderDecrement>(_orderDecrement);
    on<OrderIncrement>(_orderIncrement);
    on<OrderQuantityChanged>(_orderQuantityChanged);
    on<OrderRemove>(_orderRemove);
  }

  void _orderClear(OrderClear event, Emitter<OrderState> emit) {
    emit(
      state.copyWith(
        deliveryFee: 0,
        idToOrder: {},
        idToQuantity: {},
        orderTotal: 0,
      ),
    );
  }

  void _orderDecrement(OrderDecrement event, Emitter<OrderState> emit) {
    final idToQuantity = Map.of(state.idToQuantity);
    final quantity = idToQuantity[event.id];
    if (quantity == null || quantity == 0) return;
    if (quantity == 1) return add(OrderRemove(id: event.id));

    idToQuantity[event.id] = quantity - 1;
    emit(state.copyWith(idToQuantity: idToQuantity));
    add(const OrderQuantityChanged());
  }

  void _orderIncrement(OrderIncrement event, Emitter<OrderState> emit) {
    final idToQuantity = Map.of(state.idToQuantity);
    final idToOrder = Map.of(state.idToOrder);
    if (!idToOrder.containsKey(event.variant.id)) {
      idToQuantity[event.variant.id] = 0;
      idToOrder[event.variant.id] = event.variant;
    }

    idToQuantity[event.variant.id] = idToQuantity[event.variant.id]! + 1;
    emit(state.copyWith(idToQuantity: idToQuantity, idToOrder: idToOrder));
    add(const OrderQuantityChanged());
  }

  void _orderQuantityChanged(
    OrderQuantityChanged event,
    Emitter<OrderState> emit,
  ) {
    final idToQuantity = Map.of(state.idToQuantity);
    double orderTotal = 0;
    for (final order in state.idToOrder.values) {
      orderTotal += (order.price.amount / 100 * idToQuantity[order.id]!);
    }
    emit(
      state.copyWith(
        deliveryFee: orderTotal * 0.05,
        orderTotal: orderTotal * 1.05,
      ),
    );
  }

  void _orderRemove(OrderRemove event, Emitter<OrderState> emit) {
    final idToQuantity = Map.of(state.idToQuantity);
    final idToOrder = Map.of(state.idToOrder);
    idToOrder.removeWhere((key, value) => key == event.id);
    idToQuantity.removeWhere((key, value) => key == event.id);
    emit(state.copyWith(idToOrder: idToOrder, idToQuantity: idToQuantity));
    add(const OrderQuantityChanged());
  }
}
