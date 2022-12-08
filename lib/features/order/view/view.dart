// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:cart_demo/core/extensions.dart';
import 'package:cart_demo/core/strings.dart';
import 'package:cart_demo/features/notification/view/view.dart';
import 'package:cart_demo/features/order/bloc/order_bloc.dart';
import 'package:cart_demo/features/product/domain/entity/variant_entity.dart';
import 'package:cart_demo/shared/message.dart';
import 'package:cart_demo/utils/app_theme.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  static const routeName = 'order';
  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listenWhen: (previous, current) => current.notifMsg != null,
      listener: (context, state) {
        Notify.generic(
          context,
          state.notifMsg!.type,
          state.notifMsg!.message,
        );
      },
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state.orderCount == 0) {
                return const Message(message: 'No orders available.');
              }

              return Column(
                children: [
                  for (final variant in state.orders.values)
                    _OrderDetail(variant: variant),
                  ListTile(
                    leading: Image.asset('$kImagePath/delivery.jpg'),
                    title: const Text('Delivery'),
                    trailing: Text(
                      state.deliveryFee.asCurrency(
                        state.orders.values.first.price.formatted[0],
                      ),
                      style: const TextStyle(color: AppTheme.darkGrey),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  const SizedBox(height: 20),
                  const _Divider(),
                  const SizedBox(height: 20),
                  ListTile(
                    title: const Text('Total:'),
                    trailing: Text(
                      state.orderTotal.asCurrency(
                        state.orders.values.first.price.formatted[0],
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  const SizedBox(height: 100),
                  const _CheckoutButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _OrderDetail extends StatelessWidget {
  const _OrderDetail({required this.variant, Key? key}) : super(key: key);
  final Variant variant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width / 5,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Image.network(variant.media),
              ),
            ),
            Row(
              children: [
                BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    return Text(
                      '${state.idToQuantity[variant.id]} x',
                      style: Theme.of(context).textTheme.titleSmall,
                    );
                  },
                ),
                const SizedBox(width: 7.5),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 3,
                  ),
                  child: Text(
                    variant.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  variant.price.formatted,
                  style: const TextStyle(color: AppTheme.darkGrey),
                ),
                IconButton(
                  onPressed: () {
                    context.read<OrderBloc>().add(OrderRemove(id: variant.id));
                  },
                  icon: const Icon(Icons.close),
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (2 * 10)).floor();

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return const SizedBox(
              width: 10.0,
              height: 1.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: AppTheme.lightGrey),
              ),
            );
          }),
        );
      },
    );
  }
}

class _CheckoutButton extends StatelessWidget {
  const _CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showCupertinoDialog(
          context: context,
          builder: (_) {
            return CupertinoAlertDialog(
              title: const Text('Checkout'),
              content: const Text('Checkout Successful'),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    context.read<OrderBloc>().add(const OrderClear());
                    context.router.pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CHECKOUT:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                return Text(
                  state.orderTotal.asCurrency(
                    state.orders.values.first.price.formatted[0],
                  ),
                  style: Theme.of(context).textTheme.titleSmall,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
