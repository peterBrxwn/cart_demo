import 'package:cart_demo/features/notification/services/models/notif_msg.dart';
import 'package:cart_demo/features/product/domain/entity/product_entity.dart';
import 'package:cart_demo/features/product/domain/params/product_api_param.dart';
import 'package:cart_demo/features/product/domain/repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({
    required ProductRepo productRepo,
  })  : _productRepo = productRepo,
        super(const ProductState()) {
    on<ProductInit>(_productDetailInit);
  }
  final ProductRepo _productRepo;

  Future<void> _productDetailInit(
    ProductInit event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    final products = await _productRepo.list(
      param: ProductApiParam(taxons: event.taxon),
    );
    products.fold(
      (l) => emit(
        state.copyWith(
          notifMsg: NotifMsg(message: l.message),
          status: Status.error,
        ),
      ),
      (r) => emit(state.copyWith(status: Status.loaded, products: r)),
    );
  }
}
