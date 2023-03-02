// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';

// Project imports:
import 'package:cart_demo/features/notification/view/view.dart';
import 'package:cart_demo/features/order/bloc/order_bloc.dart';
import 'package:cart_demo/features/product/bloc/product_bloc.dart';
import 'package:cart_demo/features/product/domain/entity/variant_entity.dart';
import 'package:cart_demo/shared/loading.dart';
import 'package:cart_demo/shared/message.dart';
import 'package:cart_demo/utils/app_theme.dart';
import 'package:cart_demo/utils/image_utils.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _PageHeader(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<ProductBloc, ProductState>(
                buildWhen: (previous, current) =>
                    current.status != previous.status,
                builder: (context, state) {
                  if (state.status == ProductStatus.loading) {
                    return const Loading();
                  }
                  if (state.status == ProductStatus.error) {
                    return const Message();
                  }

                  return Column(
                    children: [
                      for (final product in state.products)
                        for (final variant in product.variants)
                          _ProductDetail(variant: variant),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Container(
          constraints: BoxConstraints(
            minHeight: 300,
            minWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "${ImageUtils.validImage(state.taxon!.slug)}-bg.png",
              ),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: AppTheme.white,
                  ),
                  onPressed: () {
                    context
                        .read<ProductBloc>()
                        .add(const ProductInit(taxon: null));
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    state.taxon!.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppTheme.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProductDetail extends StatelessWidget {
  const _ProductDetail({required this.variant, Key? key}) : super(key: key);
  final Variant variant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  variant.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Proteins',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '16.2 gr',
                          style: Theme.of(context).textTheme.bodySmall!,
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Carbohydrate',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '16.2 gr',
                          style: Theme.of(context).textTheme.bodySmall!,
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fibre',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '16.2 gr',
                          style: Theme.of(context).textTheme.bodySmall!,
                        ),
                      ],
                    ),
                    const _PieChart(),
                  ],
                ),
                Row(
                  children: [
                    _ToggleQuantityButton(variant: variant),
                    const SizedBox(width: 10),
                    Text(variant.price.formatted),
                  ],
                ),
              ],
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: Image.network(variant.media),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Divider(),
        const SizedBox(height: 15),
      ],
    );
  }
}

class _PieChart extends StatelessWidget {
  const _PieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: const {'_': 300.0, '__': 510.0},
      animationDuration: const Duration(milliseconds: 800),
      chartRadius: 40,
      colorList: const [AppTheme.white, AppTheme.green],
      initialAngleInDegree: -270,
      chartType: ChartType.ring,
      ringStrokeWidth: 3,
      centerText: "510\nkCal",
      centerTextStyle:
          Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 7.5),
      legendOptions: const LegendOptions(
        showLegends: false,
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValues: false,
      ),
    );
  }
}

class _ToggleQuantityButton extends StatelessWidget {
  const _ToggleQuantityButton({required this.variant, Key? key})
      : super(key: key);
  final Variant variant;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppTheme.lightGrey,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context.read<OrderBloc>().add(OrderDecrement(id: variant.id));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: Icon(Icons.remove),
            ),
          ),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return Text(state.idToQuantity[variant.id]?.toString() ?? '0');
            },
          ),
          InkWell(
            onTap: () {
              context.read<OrderBloc>().add(OrderIncrement(variant: variant));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
