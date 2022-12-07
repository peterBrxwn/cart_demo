part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class CategoryInit extends CategoryEvent {
  const CategoryInit();

  @override
  List<Object> get props => [];
}

class CategorySelected extends CategoryEvent {
  const CategorySelected({required this.taxon});
  final Taxon? taxon;

  @override
  List<Object?> get props => [taxon];
}
