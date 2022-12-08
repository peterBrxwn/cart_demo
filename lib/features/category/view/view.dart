// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:cart_demo/features/category/bloc/category_bloc.dart';
import 'package:cart_demo/features/notification/view/view.dart';
import 'package:cart_demo/features/product/bloc/product_bloc.dart';
import 'package:cart_demo/features/product/services/repo.dart';
import 'package:cart_demo/features/product/view/view.dart';
import 'package:cart_demo/features/taxonomy/domain/entity/taxon_entity.dart';
import 'package:cart_demo/features/taxonomy/services/repo.dart';
import 'package:cart_demo/injection.dart';
import 'package:cart_demo/shared/loading.dart';
import 'package:cart_demo/shared/message.dart';
import 'package:cart_demo/utils/app_theme.dart';
import 'package:cart_demo/utils/image_utils.dart';

class CategoryPage extends StatelessWidget implements AutoRouteWrapper {
  const CategoryPage({Key? key}) : super(key: key);

  static const routeName = 'category';
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            return CategoryBloc(
              taxonomyRepo: locator<TaxonomyImpl>(),
            )..add(const CategoryInit());
          },
        ),
        BlocProvider(
          create: (_) {
            return ProductBloc(
              productRepo: locator<ProductImpl>(),
            );
          },
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryBloc, CategoryState>(
      listenWhen: (previous, current) => current.notifMsg != null,
      listener: (context, state) {
        Notify.generic(
          context,
          state.notifMsg!.type,
          state.notifMsg!.message,
        );
      },
      child: BlocBuilder<CategoryBloc, CategoryState>(
        buildWhen: (previous, current) => previous.selected != current.selected,
        builder: (context, state) {
          if (state.selected == null) return const _View();
          return ProductPage(taxon: state.selected!);
        },
      ),
    );
  }
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: BlocBuilder<CategoryBloc, CategoryState>(
            buildWhen: (previous, current) => current.status != previous.status,
            builder: (context, state) {
              if (state.status == CategoryStatus.loading) {
                return const Loading();
              }
              if (state.status == CategoryStatus.error) return const Message();

              return GridView.count(
                crossAxisCount: 2,
                children: [
                  for (int i = 0; i < state.taxons.length; i++)
                    _CategoryDetail(taxon: state.taxons[i]),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CategoryDetail extends StatelessWidget {
  const _CategoryDetail({required this.taxon, Key? key}) : super(key: key);
  final Taxon taxon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CategoryBloc>().add(CategorySelected(taxon: taxon));
        context.read<ProductBloc>().add(ProductInit(taxon: taxon.slug));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: AppTheme.lightGrey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                "${ImageUtils.validImage(taxon.slug)}.png",
              ),
            ),
            const SizedBox(height: 15),
            Text(taxon.name),
          ],
        ),
      ),
    );
  }
}
