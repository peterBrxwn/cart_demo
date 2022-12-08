part of 'category_bloc.dart';

class CategoryState extends Equatable {
  const CategoryState({
    this.notifMsg,
    this.status = CategoryStatus.loading,
    this.taxons = const [],
  });
  final NotifMsg? notifMsg;
  final CategoryStatus? status;
  final List<Taxon> taxons;

  CategoryState copyWith({
    NotifMsg? notifMsg,
    CategoryStatus? status,
    List<Taxon>? taxons,
  }) {
    return CategoryState(
      notifMsg: notifMsg ?? this.notifMsg,
      status: status ?? CategoryStatus.initial,
      taxons: taxons ?? this.taxons,
    );
  }

  @override
  List<Object?> get props => [notifMsg, status, taxons];
}

enum CategoryStatus { initial, loading, error, loaded }
