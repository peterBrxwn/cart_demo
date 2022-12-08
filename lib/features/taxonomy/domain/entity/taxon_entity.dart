// Package imports:
import 'package:cart_demo/features/taxonomy/domain/entity/taxonomy_entity.dart';
import 'package:equatable/equatable.dart';

class Taxon extends Equatable {
  final DateTime createdAt;
  final int id;
  final String name;
  final String slug;
  final Taxonomy taxonomy;
  final DateTime updatedAt;

  const Taxon({
    required this.createdAt,
    required this.id,
    required this.name,
    required this.slug,
    required this.taxonomy,
    required this.updatedAt,
  });

  Taxon copyWith({
    DateTime? createdAt,
    int? id,
    String? name,
    String? slug,
    Taxonomy? taxonomy,
    DateTime? updatedAt,
  }) {
    return Taxon(
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      taxonomy: taxonomy ?? this.taxonomy,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [createdAt, id, name, slug, taxonomy, updatedAt];
}
