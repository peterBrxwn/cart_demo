import 'package:auto_route/auto_route.dart';
import 'package:cart_demo/core/network/network.dart' hide Status;
import 'package:cart_demo/core/strings.dart';
import 'package:cart_demo/features/category/bloc/category_bloc.dart';
import 'package:cart_demo/features/notification/view/view.dart';
import 'package:cart_demo/features/product/bloc/product_bloc.dart' hide Status;
import 'package:cart_demo/features/product/data/datasources/product_datasource.dart';
import 'package:cart_demo/features/product/services/repo.dart';
import 'package:cart_demo/features/product/view/view.dart';
import 'package:cart_demo/features/taxonomy/data/datasources/taxonomy_datasource.dart';
import 'package:cart_demo/features/taxonomy/services/repo.dart';
import 'package:cart_demo/shared/loading.dart';
import 'package:cart_demo/shared/message.dart';
import 'package:cart_demo/utils/app_theme.dart';
import 'package:cart_demo/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget implements AutoRouteWrapper {
  const CategoryPage({Key? key}) : super(key: key);

  static const routeName = 'category';
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return CategoryBloc(
              // taxonomyRepo: context.read<TaxonomyImpl>()
              taxonomyRepo: TaxonomyImpl(
                TaxonomyDatasourceImpl(apiClient: ApiClient()),
              ),
            )..add(const CategoryInit());
          },
        ),
        BlocProvider(
          create: (context) {
            return ProductBloc(
              productRepo: ProductImpl(
                ProductDatasourceImpl(apiClient: ApiClient()),
              ),
            );
          },
          child: this,
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryBloc, CategoryState>(
      listenWhen: (previous, current) => current.status != previous.status,
      listener: (context, state) {
        if (state.status == Status.error) {
          Notify.generic(
            context,
            state.notifMsg!.type,
            state.notifMsg!.message,
          );
        }
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
              if (state.status == Status.loading) return const Loading();
              if (state.status == Status.error) return const Message();

              return GridView.count(
                crossAxisCount: 2,
                children: [
                  for (int i = 0; i < state.taxons.length; i++)
                    InkWell(
                      onTap: () {
                        context
                            .read<CategoryBloc>()
                            .add(CategorySelected(taxon: state.taxons[i]));
                        context
                            .read<ProductBloc>()
                            .add(ProductInit(taxon: state.taxons[i].slug));
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
                              child: Image(
                                image: AssetImage(
                                  "$kImagePath${ImageUtils.validImage(state.taxons[i].slug)}.png",
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(state.taxons[i].name),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
