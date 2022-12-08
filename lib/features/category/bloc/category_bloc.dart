// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:cart_demo/features/notification/services/models/notif_msg.dart';
import 'package:cart_demo/features/taxonomy/domain/entity/taxon_entity.dart';
import 'package:cart_demo/features/taxonomy/domain/params/taxonomy_api_param.dart';
import 'package:cart_demo/features/taxonomy/domain/repo.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required TaxonomyRepo taxonomyRepo})
      : _taxonomyRepo = taxonomyRepo,
        super(const CategoryState()) {
    on<CategoryInit>(_categoryInit);
  }
  final TaxonomyRepo _taxonomyRepo;

  Future<void> _categoryInit(
    CategoryInit event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(status: CategoryStatus.loading));

    final taxons = await _taxonomyRepo.list(
      param: const TaxonomyApiParam(taxonomy: 'food-type'),
    );
    taxons.fold(
      (l) => emit(state.copyWith(notifMsg: NotifMsg(message: l.message))),
      (r) => emit(state.copyWith(status: CategoryStatus.loaded, taxons: r)),
    );
  }
}
