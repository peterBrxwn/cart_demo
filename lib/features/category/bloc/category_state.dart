part of 'category_bloc.dart';

class CategoryState extends Equatable {
  const CategoryState({
    this.notifMsg,
    this.selected,
    this.status = CategoryStatus.loading,
    this.taxons = const [],
  });
  final NotifMsg? notifMsg;
  final Taxon? selected;
  final CategoryStatus? status;
  final List<Taxon> taxons;

  CategoryState copyWith({
    NotifMsg? notifMsg,
    Taxon? Function()? selected,
    CategoryStatus? status,
    List<Taxon>? taxons,
  }) {
    return CategoryState(
      notifMsg: notifMsg ?? this.notifMsg,
      selected: selected != null ? selected() : this.selected,
      status: status ?? CategoryStatus.initial,
      taxons: taxons ?? this.taxons,
    );
  }

  @override
  List<Object?> get props => [notifMsg, selected, status, taxons];
}

enum CategoryStatus { initial, loading, error, loaded }
