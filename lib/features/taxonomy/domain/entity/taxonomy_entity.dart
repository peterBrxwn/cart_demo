// Package imports:
import 'package:equatable/equatable.dart';

class Taxonomy extends Equatable {
  final DateTime createdAt;
  final int id;
  final String name;
  final String slug;
  final DateTime updatedAt;

  const Taxonomy({
    required this.createdAt,
    required this.id,
    required this.name,
    required this.slug,
    required this.updatedAt,
  });

  Taxonomy copyWith({
    DateTime? createdAt,
    int? id,
    String? name,
    String? slug,
    DateTime? updatedAt,
  }) {
    return Taxonomy(
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        createdAt,
        id,
        name,
        slug,
        updatedAt,
      ];
}
