// Package imports:
import 'package:cart_demo/features/taxonomy/domain/entity/taxon_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:cart_demo/features/notification/services/models/notif_msg.dart';
import 'package:cart_demo/features/product/domain/entity/product_entity.dart';
import 'package:cart_demo/features/product/domain/params/product_api_param.dart';
import 'package:cart_demo/features/product/domain/repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required ProductRepo productRepo})
      : _productRepo = productRepo,
        super(const ProductState()) {
    on<ProductInit>(_productInit);
  }
  final ProductRepo _productRepo;

  Future<void> _productInit(
    ProductInit event,
    Emitter<ProductState> emit,
  ) async {
    if (event.taxon == null) {
      return emit(state.copyWith(taxon: () => null));
    }
    emit(
      state.copyWith(
        status: ProductStatus.loading,
        taxon: () => event.taxon,
      ),
    );

    final products = await _productRepo.list(
      param: ProductApiParam(taxons: event.taxon!.slug),
    );
    products.fold(
      (l) => emit(
        state.copyWith(
          notifMsg: NotifMsg(message: l.message),
          status: ProductStatus.error,
        ),
      ),
      (r) => emit(
        state.copyWith(products: r, status: ProductStatus.loaded),
      ),
    );
  }
}
